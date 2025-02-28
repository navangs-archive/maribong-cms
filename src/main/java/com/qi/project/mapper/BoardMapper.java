package com.qi.project.mapper;

import java.util.List;
import java.util.Map;

public interface BoardMapper {
	public List<Map<String, Object>> getAdminBoardList() throws Exception;								// 게시글 목록 조회(관리자용)
	public List<Map<String, Object>> getBoardDetail(Map<String, Object> paramMap) throws Exception;		// 게시글 상세조회 
	public Map<String, Object> getMaxId();
	
	public int insertCommunity(Map<String, Object> parmaMap);											// 글등록 
	public int updateMark(Map<String, Object> parmaMap);												// 인증마크 부여
	public int updateCommunity(Map<String, Object> parmaMap);											// 글수정
	public int deleteCommunity(Map<String, Object> parmaMap);											// 글삭제 
}
