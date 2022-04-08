package com.herejava.book.service;

import java.sql.Connection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.herejava.book.dao.BookDao;
import com.herejava.book.vo.Book;
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

}
