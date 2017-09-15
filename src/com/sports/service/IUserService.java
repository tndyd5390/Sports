package com.sports.service;

import java.util.List;

import com.sports.dto.UserDTO;

public interface IUserService {

	public int getIdCheck(UserDTO uDTO) throws Exception;

	public void insertUserInfo(UserDTO uDTO) throws Exception;

	public UserDTO getLoginInfo(UserDTO uDTO) throws Exception;


	public void updateEmailCode(UserDTO uDTO) throws Exception;

	public UserDTO getUserId(UserDTO uDTO) throws Exception;

	public void updatePassword(UserDTO uDTO) throws Exception;

	public void updateEmailCheck(UserDTO uDTO) throws Exception;

	public List<UserDTO> getUserList() throws Exception;

	public List<UserDTO> getSearchUser(UserDTO uDTO) throws Exception;

	public UserDTO getUserDetail(UserDTO uDTO) throws Exception;

	public void updateUserDetail(UserDTO uDTO) throws Exception;

	public void userDelete(String userNo) throws Exception;

}
