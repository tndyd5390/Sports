package com.sports.service.impl;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.UserDTO;
import com.sports.persistance.mapper.UserMapper;
import com.sports.service.IUserService;
import com.sports.util.MailUtil;

@Service("UserService")
public class UserService implements IUserService{
	@Resource(name="UserMapper")
	private UserMapper userMapper;
	@Override
	public int getIdCheck(UserDTO uDTO) throws Exception {
		
		return userMapper.getIdCheck(uDTO);
	}
	@Override
	public void insertUserInfo(UserDTO uDTO) throws Exception {
		userMapper.insertUserInfo(uDTO);
		userMapper.updateRegUser(uDTO);
		updateEmailCode(uDTO);
		uDTO = userMapper.getUserId(uDTO);
		MailUtil.sendMail(uDTO.getEmail(), "티맥스몰 인증메일입니다.", "https://tmaxxsports.com:5023/emailCheckProc.do?uNo="+uDTO.getUser_no()+"&code="+uDTO.getEmail_code());
	}
	@Override
	public UserDTO getLoginInfo(UserDTO uDTO) throws Exception {
		return userMapper.getLoginInfo(uDTO);
	}
	@Override
	public void updateEmailCode(UserDTO uDTO) throws Exception {
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();

		for(int i=0;i<20;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		uDTO.setEmail_code(buf.toString());
		
		userMapper.updateEmailCode(uDTO);
	}
	@Override
	public UserDTO getUserId(UserDTO uDTO) throws Exception {
		return userMapper.getUserId(uDTO);
	}
	@Override
	public void updatePassword(UserDTO uDTO) throws Exception {
		userMapper.updatePassword(uDTO);
	}
	@Override
	public void updateEmailCheck(UserDTO uDTO) throws Exception {
		userMapper.updateEmailCheck(uDTO);
	}
	@Override
	public List<UserDTO> getUserList() throws Exception {
		return userMapper.getUserList();
	}
	@Override
	public List<UserDTO> getSearchUser(UserDTO uDTO) throws Exception {
		if(uDTO.getType().equals("name")){
			
			return userMapper.getSearchName(uDTO);
		}else{
			
			return userMapper.getSearchId(uDTO);
		}
	}
	@Override
	public UserDTO getUserDetail(UserDTO uDTO) throws Exception {
		return userMapper.getUserDetail(uDTO);
	}
	@Override
	public void updateUserDetail(UserDTO uDTO) throws Exception {
		userMapper.updateUserDetail(uDTO);
	}
	@Override
	public void userDelete(String userNo) throws Exception {
		userMapper.userDelete(userNo);
	}
	@Override
	public List<UserDTO> getMoreUserList(int readMore) throws Exception {
		return userMapper.getMoreUserList(readMore);
	}
}
