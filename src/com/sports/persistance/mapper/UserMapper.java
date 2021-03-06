package com.sports.persistance.mapper;

import java.util.List;

import com.sports.config.Mapper;
import com.sports.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {

	int getIdCheck(UserDTO uDTO) throws Exception;

	void insertUserInfo(UserDTO uDTO) throws Exception;

	void updateRegUser(UserDTO uDTO) throws Exception;

	UserDTO getLoginInfo(UserDTO uDTO) throws Exception;

	void updateEmailCode(UserDTO uDTO) throws Exception;

	UserDTO getUserId(UserDTO uDTO) throws Exception;

	void updatePassword(UserDTO uDTO) throws Exception;

	void updateEmailCheck(UserDTO uDTO) throws Exception;

	List<UserDTO> getUserList() throws Exception;

	List<UserDTO> getSearchName(UserDTO uDTO) throws Exception;

	List<UserDTO> getSearchId(UserDTO uDTO) throws Exception;

	UserDTO getUserDetail(UserDTO uDTO) throws Exception;

	void updateUserDetail(UserDTO uDTO) throws Exception;

	void userDelete(String userNo) throws Exception;

	List<UserDTO> getMoreUserList(int readMore) throws Exception;

}
