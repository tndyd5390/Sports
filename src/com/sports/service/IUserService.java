package com.sports.service;

import com.sports.dto.UserDTO;

public interface IUserService {

	public int getIdCheck(UserDTO uDTO) throws Exception;

	public void insertUserInfo(UserDTO uDTO) throws Exception;

	public int getLoginInfo(UserDTO uDTO) throws Exception;

}
