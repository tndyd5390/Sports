package com.sports.util;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHAUtill {
	static private String ck = encryption("super_developer");
	
	public static String encryption(String str) {
		String SHA = "";
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			SHA = "";
		}
		return SHA;
	}

	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String a = encryption("aba");
		System.out.println("암호화 : " + a);
		System.out.println("암호화 : " + encryption(a+ck));
	}
	
	public static String double_encryption(String str){
		String one = encryption(str);
		return encryption(one+ck);
	}
}
