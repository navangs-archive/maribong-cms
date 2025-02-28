package com.qi.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qi.project.mapper.QuizMapper;

@Service
public class QuizService {

	@Autowired
	private QuizMapper quizMapper;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());	
	
	/**
	 * 퀴즈리스트 가져오기
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public List<Map<String, Object>> getQuizList() throws Exception {
		
		return quizMapper.getQuizList();
	}
	
	/**
	 * 퀴즈 상세내역 가져오기
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public Map<String, Object> getQuizDetail(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("quiz", quizMapper.getQuiz(paramMap));
		resultMap.put("question", quizMapper.getQuizQuestion(paramMap));
		resultMap.put("choice", quizMapper.getQuizChoice(paramMap));
		
		return resultMap;
	}
	
	
	
	/**
	 * 퀴즈 할당 
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int addQuiz(Map<String, Object> paramMap) throws Exception {
		
		int cnt = quizMapper.checkQuizUser(paramMap);
		
		if (cnt > 0) {
			return 2;
		} else {
			return quizMapper.insertQuizUser(paramMap);
		}
	}
	/**
	 * 퀴즈 등록 
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int insertQuiz(Map<String, Object> paramMap) throws Exception {
		
		// 1) 퀴즈등록 
		quizMapper.insertQuiz(paramMap);
		
		// 2) 마지막 퀴즈번호 조회 
		int maxQuizId = quizMapper.getMaxQuizNo();
		
		// 3) 문항 및 선택지 등록
		Map<String, Object> question = null;
		Map<String, Object> choice = null;
		int questionFlag = 0;
		int answerFlag = 0;
		
		for (String key : paramMap.keySet()) {
			logger.debug("@@ test : " + key);
			
			// 질문
			if(key.indexOf("questionContent") > -1) {
				if (!paramMap.get(key).toString().equals("")) {
					question = new HashMap<String,Object>();
					question.put("questionNo", key.split("_")[1]);
					question.put("quizNo", maxQuizId);
					question.put("questionContent", paramMap.get(key));
					questionFlag = 1;
				}
				continue;
			}
			
			// 정답 
			if(key.indexOf("questionAnswer") > -1) {
				if (questionFlag == 1) {
					if (!paramMap.get(key).toString().equals("")) {
						question.put("questionAnswer", paramMap.get(key));
						quizMapper.insertQuizQuestion(question);
						answerFlag = 1;
					}
				}
				continue;
			}
			
			// 선택지
			if(key.indexOf("choiceContent") > -1) {
				if (questionFlag == 1 && answerFlag == 1) {
					if (!paramMap.get(key).toString().equals("")) {
						choice = new HashMap<String,Object>();
						String [] splitTemp = key.split("_");
						choice.put("choiceNo", splitTemp[2]);
						choice.put("questionNo", splitTemp[1]);
						choice.put("quizNo", maxQuizId);
						choice.put("choiceContent", paramMap.get(key));
						quizMapper.insertQuizChoice(choice);
					}
				}
			}
		}
		
		return 1;
	}
	
	/**
	 * 퀴즈 수정 
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int updateQuiz(Map<String, Object> paramMap) throws Exception {
		
		// 1) 퀴즈등록 
		quizMapper.updateQuiz(paramMap);
		String quizNo = paramMap.get("quizNo").toString();
		
		// 2) 기존문항 및 선택지 삭제
		quizMapper.deleteQuizQuestion(paramMap);
		quizMapper.deleteQuizChoice(paramMap);
		
		// 3) 문항 및 선택지 등록
		Map<String, Object> question = null;
		Map<String, Object> choice = null;
		int questionFlag = 0;
		int answerFlag = 0;
		
		for (String key : paramMap.keySet()) {
			logger.debug("@@ test : " + key);
			
			// 질문
			if(key.indexOf("questionContent") > -1) {
				if (!paramMap.get(key).toString().equals("")) {
					question = new HashMap<String,Object>();
					question.put("questionNo", key.split("_")[1]);
					question.put("quizNo", quizNo);
					question.put("questionContent", paramMap.get(key));
					questionFlag = 1;
				}
				continue;
			}
			
			// 정답 
			if(key.indexOf("questionAnswer") > -1) {
				if (questionFlag == 1) {
					if (!paramMap.get(key).toString().equals("")) {
						question.put("questionAnswer", paramMap.get(key));
						quizMapper.insertQuizQuestion(question);
						answerFlag = 1;
					}
				}
				continue;
			}
			
			// 선택지
			if(key.indexOf("choiceContent") > -1) {
				if (questionFlag == 1 && answerFlag == 1) {
					if (!paramMap.get(key).toString().equals("")) {
						choice = new HashMap<String,Object>();
						String [] splitTemp = key.split("_");
						choice.put("choiceNo", splitTemp[2]);
						choice.put("questionNo", splitTemp[1]);
						choice.put("quizNo", quizNo);
						choice.put("choiceContent", paramMap.get(key));
						quizMapper.insertQuizChoice(choice);
					}
				}
			}
		}
		
		return 1;
	}
	
	/**
	 * 퀴즈 삭제 
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int deleteQuiz(Map<String, Object> paramMap) throws Exception {
		
		quizMapper.deleteQuizUser(paramMap);
		quizMapper.deleteQuizChoice(paramMap);
		quizMapper.deleteQuizQuestion(paramMap);
		quizMapper.deleteQuiz(paramMap);
		
		return 1;
	}
}
