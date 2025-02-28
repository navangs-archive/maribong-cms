package com.qi.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qi.project.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	/**
	 * 게시글 목록 가져오기 (관리자용) 
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public List<Map<String, Object>> getAdminBoardList() throws Exception {
		
		return boardMapper.getAdminBoardList();
	}
	/**
	 * 게시글 상세보기
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public List<Map<String, Object>> getBoardDetail(Map<String, Object> paramMap) throws Exception {
		
		return boardMapper.getBoardDetail(paramMap);
	}
	
	/**
	 * 게시글 등록
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int insertCommunity(Map<String, Object> paramMap) throws Exception {

		Map<String,Object> tempMap = boardMapper.getMaxId();
		paramMap.put("maxId", tempMap.get("maxId").toString());
		
		int resultCnt = boardMapper.insertCommunity(paramMap);
		
		return resultCnt;
	}
	
	/**
	 * 인증마크 부여
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int updateMark(Map<String, Object> paramMap) throws Exception {
		
		int resultCnt = boardMapper.updateMark(paramMap);
		
		return resultCnt;
	}
	
	/**
	 * 글 수정  
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int updateCommunity(Map<String, Object> paramMap) throws Exception {
		
		int resultCnt = boardMapper.updateCommunity(paramMap);
		
		return resultCnt;
	}
	
	/**
	 * 글 삭제 
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public int deleteCommunity(Map<String, Object> paramMap) throws Exception {
		
		int resultCnt = boardMapper.deleteCommunity(paramMap);
		
		return resultCnt;
	}
}
