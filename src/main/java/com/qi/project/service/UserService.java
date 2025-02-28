package com.qi.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qi.project.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 회원 목록 가져오기
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public List<Map<String, Object>> getAdminBoardList() throws Exception {
		
		return userMapper.getUserList();
	}
	
	/**
	 * 인증기록 부여하기
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int addHistory(Map<String, Object> paramMap) throws Exception {
		
		return userMapper.addHistory(paramMap);
	}
}
