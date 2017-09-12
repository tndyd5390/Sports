package com.sports.service.impl;

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

}
