package com.herejava.member.service;

import java.sql.Connection;

import com.herejava.member.dao.MemberDao;
import com.herejava.member.vo.Member;

import common.JDBCTemplate;

public class MemberService {

	public Member selectOneMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.selectOneMember(conn,member);
		return null;
	}

}
