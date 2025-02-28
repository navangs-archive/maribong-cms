package com.qi.project.mapper;

import java.util.List;
import java.util.Map;

public interface UserMapper {
	public List<Map<String, Object>> getUserList() throws Exception;								// 회원 조회
	
	public int addHistory(Map<String, Object> paramMap) throws Exception;							// 인증기록부여하기
}
