package com.sports.persistance.mapper;

import java.util.List;

import config.Mapper;
import com.sports.dto.NoticeDTO;
import com.sports.dto.UserDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {
	UserDTO testUser(String userNo) throws Exception;
}
