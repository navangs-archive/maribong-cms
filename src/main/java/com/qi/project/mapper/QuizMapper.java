package com.qi.project.mapper;

import java.util.List;
import java.util.Map;

public interface QuizMapper {
	// 조회 
	public List<Map<String, Object>> getQuizList() throws Exception;									// 퀴즈 목록 조회
	public int getMaxQuizNo();																			// 마지막 퀴즈번호 조회
	public int checkQuizUser(Map<String, Object> parmaMap);												// 퀴즈할당 조회 
	public Map<String, Object> getQuiz(Map<String, Object> parmaMap);									// 퀴즈 조회
	public List<Map<String, Object>> getQuizQuestion(Map<String, Object> parmaMap);						// 문항 조회 
	public List<Map<String, Object>> getQuizChoice(Map<String, Object> parmaMap);						// 선택지 조회 
	public Map<String, Object> getQuizUser(Map<String, Object> parmaMap);								// 퀴즈 할당자 조회
	
	// 등록
	public int insertQuiz(Map<String, Object> parmaMap);												// 퀴즈 등록 
	public int insertQuizQuestion(Map<String, Object> parmaMap);										// 문항 등록
	public int insertQuizChoice(Map<String, Object> parmaMap);											// 선택지 등록
	public int insertQuizUser(Map<String, Object> parmaMap);											// 퀴즈 할당

	// 수정
	public int updateQuiz(Map<String, Object> parmaMap);												// 퀴즈 수정 
	public int updateQuizQuestion(Map<String, Object> parmaMap);										// 문항 수정

	// 삭제
	public int deleteQuiz(Map<String, Object> parmaMap);												// 퀴즈 삭제 
	public int deleteQuizQuestion(Map<String, Object> parmaMap);										// 문항 삭제
	public int deleteQuizChoice(Map<String, Object> parmaMap);											// 선택지 삭제
	public int deleteQuizUser(Map<String, Object> parmaMap);											// 퀴즈 할당자 삭제
}
