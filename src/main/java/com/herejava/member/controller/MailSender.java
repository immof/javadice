package com.herejava.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	public String sendMail(String email) {
		boolean result = false;
		//이메일 통신 설정
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//인증정보설정(gmail 로그인)
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() { 
				//getPasswordAuthentication() 부분 자동완성하면 Pass가 소문자로 적혀서 오류남
				PasswordAuthentication pa = new PasswordAuthentication("lee1073800@gmail.com", "pope1526");
				return pa;
			}
		});
		//이메일을 작성해서 전송하는 객체 생성
		MimeMessage msg = new MimeMessage(session);
		
		//인증용 랜덤코드 생성
		Random r = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<6;i++) {
			//숫자, 영어소문자, 영어대문자를 랜덤으로 조합하여 6글자를 만들기 위해 반복 6회
			int flag = r.nextInt(3);//0:0~9사이에서 랜덤 1:A-Z 사이에서 랜덤 2: a-z 사이 랜덤
			if(flag == 0) {
				//0~9
				int randomNum = r.nextInt(10);
				sb.append(randomNum);
			}else if(flag == 1) {
				//A~Z
				char randomChar = (char)(r.nextInt(26)+65);
				sb.append(randomChar);
			}else if(flag == 2) {
				//a~z
				char randomChar = (char)(r.nextInt(26)+97);
				sb.append(randomChar);
			}
		}
		
		//이메일작성
		try {
			//메일 전송 날짜 설정
			msg.setSentDate(new Date());
			//보내는 사람 정보 설정
			msg.setFrom(new InternetAddress("lee1073800@gmail.com","JAVADICE CITY"));
			//받는사람 정보 설정
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			//이메일 제목설정
			msg.setSubject("JAVADICE CITY 인증메일입니다.","UTF-8");
			//이메일 본문설정
			msg.setContent("<h1>안녕하세요 JAVADICE CITY 입니다</h1>"
						+ "<h3>회원님의 인증번호는 [<span style='color:red;'>"+sb.toString()+"</span>]입니다.</h3>"
						+ "<h3>회원님께 만족을 드릴 수 있는 JAVADICE CITY가 되겠습니다. 감사합니다</h3>"
					,"text/html;charset=UTF-8");
			//이메일 전송
			Transport.send(msg);
			//전송이 완료되면 전송결과 값 true로 변경
			result = true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result) {
			return sb.toString();
		}else {
			return null;
		}
	}
}
