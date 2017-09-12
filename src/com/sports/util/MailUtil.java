package com.sports.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
	public static void sendMail(String recipient, String subject, String body) throws AddressException, MessagingException {
		// 네이버일 경우 smtp.naver.com 을 입력합니다.
		// Google일 경우 smtp.gmail.com 을 입력합니다.
		String host = "smtp.naver.com";

		// 메일 관련 정보
		final String username = "portfolio_jg"; // 네이버 아이디 @naver.com은 입력생략
		final String password = "123qweasd"; // 네이버 이메일 비밀번호 입력
		int port = 465; // 포트번호

		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		// Session 생성
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // for debug

		Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("portfolio_jg@naver.com"));
		// 발신자 셋팅, 보내는 사람의 이메일주소를 한번 더 입력합니다.
		// 이메일 풀 주소를 다 작성해주세요.
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		// 수신자셋팅
		// .TO외에 .CC(참조) .BCC(숨은참조)도 있음

		mimeMessage.setSubject(subject); // 제목셋팅
		mimeMessage.setText(body); // 내용세팅
		Transport.send(mimeMessage); // javax.mail.Transport.send() 이용
	}
}
