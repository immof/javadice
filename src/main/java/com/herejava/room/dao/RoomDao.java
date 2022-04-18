package com.herejava.room.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.room.vo.Room;

import common.JDBCTemplate;

public class RoomDao {
	//Room 객체에 데이터 set 메소드
	private Room setRoom(ResultSet rset) {
		Room r = new Room();
		try {
			r.setRoomNo(rset.getInt("room_no"));
			r.setRoomName(rset.getString("room_name"));
			r.setRoomPrice(rset.getInt("room_price"));
			r.setRoomCount(rset.getInt("room_count"));
			r.setRoomCapacity(rset.getInt("room_capacity"));
			r.setRoomOption(rset.getString("room_option"));
			r.setFilepath(rset.getString("filepath"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}
	
	//전체 Room 데이터 불러오는 메소드
	public ArrayList<Room> selectAllRoom(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Room> list = new ArrayList<Room>();
		String query = "select * from room";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Room r = setRoom(rset);
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int priceChange(Connection conn, int roomPrice, String roomNo, int roomCapacity) {
		PreparedStatement pstmt = null;
		int result =0;
		String query = "update room set room_price = ?, room_capacity = ? where room_no =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomPrice);
			pstmt.setInt(2, roomCapacity);
			pstmt.setString(3, roomNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Room selectOneRoom(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Room r = new Room();
		String query = "select * from room where room_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = setRoom(rset);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}

	

}
