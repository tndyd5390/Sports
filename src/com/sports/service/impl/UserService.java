package com.sports.service.impl;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.UserDTO;
import com.sports.persistance.mapper.UserMapper;
import com.sports.service.IUserService;

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

}
