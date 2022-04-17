package com.herejava.book.service;

import java.sql.Connection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.herejava.book.dao.BookDao;
import com.herejava.book.vo.Book;
import com.herejava.book.vo.BookCheckPage;
import com.herejava.book.vo.BookData;
import com.herejava.book.vo.BookPageData;
import com.herejava.book.vo.BookPay;
import com.herejava.book.vo.BookPayData;
import com.herejava.member.vo.MemberPageData;
import com.herejava.point.dao.PointDao;
import com.herejava.room.dao.RoomDao;
import com.herejava.room.vo.Room;

import common.JDBCTemplate;
public class BookService {
	
	public ArrayList<Room> selectSearchRoom(Book book) {
		Connection conn = JDBCTemplate.getConnection();
		//예약 가능한 객실의 갯수를 구하는 작업
		//1.전체 객실의 기본 데이터를 불러옴
		RoomDao rDao = new RoomDao();
		ArrayList<Room> list = rDao.selectAllRoom(conn);
		//2. checkOut과 checkIn을 String 타입 그대로 꺼내놓음
		String checkOut = book.getCheckOut();
		String checkIn = book.getCheckIn();
		//3. String 타입의 두 날짜를 SimpleDateFormat의 parse() 메소드를 이용해서 날짜 형식으로 변환
		//날짜로 변환할때 예외 처리를 해야 해서 {}에 갇히게 되니까 두 날짜 변수를 먼저 선언해놓음
		Date format1 = null;
		Date format2 = null;
		try {
			//날짜 포맷 입력할 떄 mm이 아니라 MM 입력해야 하는것 주의!
			format1 = new SimpleDateFormat("yyyy-MM-dd").parse(checkOut);
			format2 = new SimpleDateFormat("yyyy-MM-dd").parse(checkIn);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//4.Date 타입의 두 날짜를 getTime() 메소드로 기준일부터 현재까지의 경과 시간을 ms 단위로 구하고,
		//종료일에서 시작일을 뺀 후, 원하는 형식에 따라 초(*1000), 분(*60), 시(*60), 일(*24)으로 나누면 두 날짜의 차이값을 계산할 수 있음
		long diffSec = (format1.getTime() - format2.getTime()) / 1000; //초 차이
		long diffDays = diffSec / (24*60*60); //일 차이
		//5.예약하고자 하는 날짜에 예약된 방의 갯수를 구하는 작업.
		//쿼리문 구성 : select count(*) from book where room_no = ? and check_in <= ? and check_out > ?
		//오라클에서 문자타입도 자동 형변환해서 날짜의 비교를 유연하게 해주는걸 이용
		//where 절에서 room_no는 객실타입, check_in 과 check_out과의 비교는 해당 예약이 찾고자 하는 날짜에 속하는지를 알고자 함 
		BookDao dao = new BookDao();
		for(Room r : list) {	//객실별로 where 절에 조건으로 roomNo 조건을 걸어주고 값을 세팅하기 위한 foreach문
			int useRoom = 0;	//예약된 객실의 수를 저장할 변수
			for(int i = 0 ; i < diffDays ; i++) {	//날짜별로 where 절에 조건으로 날짜를 걸어주기 위한 for문 
				int day = (1000*60*60*24)*(i);		//장기 투숙일 경우 하루하루 더해가며 search를 반복함
				//날짜를 하루하루 더하기 위해 지지고 볶는 과정
				Date searchDay = new Date(format2.getTime()+day);					//getTime()으로 ms단위로 치환한걸 다시 날짜화
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");			//날짜형식을 다시 문자로 바꾸기 위해 포맷을 정하는 과정
				String dayToStr = dateFormat.format(searchDay);						//날짜형식을 다시 문자열로
				//쿼리문 수행해서 해당 객실이 해당날짜에 몇개 에약되었는지 갯수를 반환
				int bookCount = dao.searchBookCount(conn,r.getRoomNo(),dayToStr);
				if(useRoom < bookCount) {
					useRoom = bookCount;	//예약하고자 하는 날짜중 가장 많이 예약된 갯수를 찾는다.
				}
			}
			r.setRoomCount(r.getRoomCount()-useRoom);	//객실의 총갯수를 저장하던 roomCount에 예약가능한 room갯수를 저장한다.
			//예약 가능한 room 갯수가 마이너스 이거나, 예약하고자 하는 인원이 해당 객실의 수용인원을 초과할 때 예약가능한 room갯수를 0으로 세팅.
			if(r.getRoomCount() < 0 || r.getRoomCapacity() < book.getBookPeople()) {
				r.setRoomCount(0);
			}
		}
		JDBCTemplate.close(conn);
		return list;	//여기서 반환되는 roomCount는 해당 room의 총 갯수가 아니라 예약 가능한 room의 갯수임
	}

	// 예약번호로 예약 1개 가져오는 메소드
	public Book selectOneBook(long bookNo) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		Book b = dao.selectOneBook(conn, bookNo);
		JDBCTemplate.close(conn);
		return b;
	}
	
	// 회원번호로 예약 1개 가져오는 메소드
	public Book selectOneBook(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		Book b = dao.selectOneBook(conn, memberNo);
		JDBCTemplate.close(conn);
		return b;
	}
	
	// 멤버번호&요청페이지로 예약리스트 + 페이지번호 가져오는 메소드
	public BookPageData selectBookList(int memberNo, int reqPage) {
		Connection conn= JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		
		//numPerPage = 한 페이지당 게시물 수 
		int numPerPage = 4;
		
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<BookData> list = dao.selectBookList(conn,memberNo,start,end);
		//페이징처리
		int totalCount = dao.totalBookCount(conn,memberNo);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		int pageNaviSize = 5; 
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/bookList.do?memberNo="+memberNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/bookList.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/bookList.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/bookList.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		BookPageData bpd = new BookPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return bpd;
	}

	
	// 예약번호로 리뷰갯수 리턴하는 메소드
	public int getReview(long bookNo){
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		int result = dao.getReview(conn,bookNo);
		JDBCTemplate.close(conn);
		return result;
	}
	

	// 멤버번호&요청페이지로 예약리스트 + 페이지번호 가져오는 메소드 -관리자
	public BookPageData selectBookListAdmin(int memberNo, String memberNick, int reqPage, int chk) {
		Connection conn= JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		
		//numPerPage = 한 페이지당 게시물 수 
		int numPerPage = 4;
		
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<BookData> list = dao.selectBookList(conn,memberNo,start,end,chk);
		//페이징처리
		int totalCount = dao.totalBookCount(conn,memberNo,chk);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		int pageNaviSize = 5; 
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/adminBookList.do?memberNo="+memberNo+"&memberNick="+memberNick+"&reqPage="+(pageNo-1)+"&chk="+chk+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/adminBookList.do?memberNo="+memberNo+"&memberNick="+memberNick+"&reqPage="+pageNo+"&chk="+chk+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/adminBookList.do?memberNo="+memberNo+"&memberNick="+memberNick+"&reqPage="+pageNo+"&chk="+chk+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/adminBookList.do?memberNo="+memberNo+"&memberNick="+memberNick+"&reqPage="+pageNo+"&chk="+chk+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		BookPageData bpd = new BookPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return bpd;
	}
	
	//멤버번호로 예약리스트 가져오는 메소드
	public ArrayList<BookData> selectAllBook(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		ArrayList<BookData> list = dao.selectAllBook(conn, memberNo);
		JDBCTemplate.close(conn);
		return list;
	}
	
	//예약리스트 최신순으로 전체 가져오는 메소드
	public ArrayList<Book> selectAllBook(){
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		ArrayList<Book> list = dao.selectAllBook(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	//예약번호로 book/pay/point테이블 예약취소(update) 및 결제금액/결제포인트 취소하는 메소드
	public int updateBook(long bookNo, int memberNo, int memberPoint) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		//일단 메소드 8개 가져오기
		int result1 = dao.updateBookStateInBook(conn, bookNo);
		int result2 = dao.updateBookStateInPay(conn, bookNo);
		int result3 = dao.payAmountUpdateInPay(conn, bookNo);
		int result4 = dao.payAmountUpdateInPoint(conn, bookNo);
		int result5 = dao.usePointUpdateInPay(conn, bookNo);
		int result6 = dao.usePointUpdateInPoint(conn, bookNo);
		int result7 = dao.plusPointUpdateInPay(conn, bookNo);
		int result8 = dao.memberPointUpdateInMember(conn, memberPoint, memberNo);//member_point 결과값
		int totalResult = result1 + result2 + result3 + result4 + result5
				 	+ result6 + result7 + result8;
		if(totalResult == 8) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return totalResult;
	}

	
	//예약번호로 예약(방사진/방이름/체크인/체크아웃/예약상태/이용자숫자/예약자명/예약자전화번호) 1개 가져오는 메소드
	public BookData getBook(long bookNo) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		BookData bd = dao.getBook(conn,bookNo);
		JDBCTemplate.close(conn);
		return bd;
	}

	public BookCheckPage selectAllBook1(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		
		
		int numPerPage = 8;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		ArrayList<Book> list = dao.selectAllBook1(conn,start,end);
		//페이징처리
		
				int totalBookCount = dao.totalBookCount(conn);
				int totalPage = 0;	// 전체 페이지수
				if(totalBookCount % numPerPage == 0) {
					totalPage = totalBookCount / numPerPage;
				}else {
					totalPage = (totalBookCount / numPerPage) +1;
				}
				int pageNaviSize = 5;	//페이지 네비게이션 길이
				
				//페이지 네비게이션 시작번호 계산
				int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
				//페이지 네비게이션 제작 시작
				String pageNavi = "<ul class='pagination circle-style'>";
				//이전버튼
				if(pageNo != 1) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/bookcheck.do?reqPage="+(pageNo-1)+"'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				//페이지숫자
				for(int i=0;i<pageNaviSize;i++) {
					if(pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/bookcheck.do?reqPage="+pageNo+"'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/bookcheck.do?reqPage="+pageNo+"'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}
					pageNo++;
					if(pageNo > totalPage) {
						break;
					}
				}
				//다음버튼
				if(pageNo <= totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/bookcheck.do?reqPage="+pageNo+"'>";		//위에 pageNo++로 이미 숫자가 커졌기때문에 pageNo+1이 아니다
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
				BookCheckPage bcp = new BookCheckPage(list,pageNavi);
				
				JDBCTemplate.close(conn);
				return bcp;
			}

	//숙박일 수 리턴하는 메소드
	public int diffDays(String checkIn, String checkOut) {
		Date format1 = null;
		Date format2 = null;
		try {
			format1 = new SimpleDateFormat("yyyy-MM-dd").parse(checkOut);
			format2 = new SimpleDateFormat("yyyy-MM-dd").parse(checkIn);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long diffSec = (format1.getTime() - format2.getTime()) / 1000;
		long diffDaysLong = diffSec / (24*60*60);
		int diffDays = (int)diffDaysLong;
		return diffDays;
	}
	
	//현재날짜 기준 예약상태(숙박완료로) 최신화 시켜주는 메소드 -Book테이블
	public int updateBookStateInBook() {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		//book 예약상태 변경
		int result = dao.updateBookStateInBook(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// 멤버번호&요청페이지로 예약리스트 + 페이지번호 가져오는 메소드 - 이신영 (reviewNo추가)
	public BookPageData selectBookList2(int memberNo, int reqPage) {
		Connection conn= JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		
		//numPerPage = 한 페이지당 게시물 수 
		int numPerPage = 4;
		
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<BookData> list = dao.selectBookList2(conn,memberNo,start,end);
		//페이징처리
		int totalCount = dao.totalBookCount(conn,memberNo);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		int pageNaviSize = 5; 
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/bookList.do?memberNo="+memberNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/bookList.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/bookList.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/bookList.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		BookPageData bpd = new BookPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return bpd;
	}
	
	//결제완료시 예약테이블에 예약 추가
	public int insertBook(BookPay bpay) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		int result = dao.insertBook(conn,bpay);
		JDBCTemplate.close(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertPay(BookPay bpay, BookPayData bpd) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		int result = dao.insertPay(conn,bpay,bpd);
		JDBCTemplate.close(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public BookPayData searchBookNo(BookPay bpay) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		BookPayData bpd = dao.searchBookNo(conn, bpay);
		JDBCTemplate.close(conn);
		return bpd;
	}

	public long searchPayNo(BookPayData bpd) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		long result = dao.searchPayNo(conn, bpd);
		JDBCTemplate.close(conn);
		return result;
	}

	public Book selectOneBook(Long bookNo, String bookName) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		Book b = dao.selectOneBook(conn, bookNo, bookName);
		JDBCTemplate.close(conn);
		return b;
	}

	public int updateMemberPoint(int memberNo, int newPoint) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		int result = dao.updateMemberPoint(conn,memberNo,newPoint);
		JDBCTemplate.close(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


}











