package com.herejava.room.vo;

public class Room {
	private int roomNo;
	private String roomName;
	private int roomPrice;
	private int roomCount;
	private int roomCapacity;
	private String roomOption;
	private String filepath;
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Room(int roomNo, String roomName, int roomPrice, int roomCount, int roomCapacity, String roomOption,
			String filepath) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.roomPrice = roomPrice;
		this.roomCount = roomCount;
		this.roomCapacity = roomCapacity;
		this.roomOption = roomOption;
		this.filepath = filepath;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	public int getRoomCount() {
		return roomCount;
	}
	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}
	public int getRoomCapacity() {
		return roomCapacity;
	}
	public void setRoomCapacity(int roomCapacity) {
		this.roomCapacity = roomCapacity;
	}
	public String getRoomOption() {
		return roomOption;
	}
	public void setRoomOption(String roomOption) {
		this.roomOption = roomOption;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}
