package com.qi.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qi.project.service.BoardService;
import com.qi.project.service.QuizService;
import com.qi.project.service.UserService;

@RequestMapping(value="/")
@Controller
public class WebController {
	
	@Autowired
	BoardService boardService;

	@Autowired
	QuizService quizService;
	
	@Autowired
	UserService userService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 게시물 관리 페이지
	@RequestMapping(value="/board")
	public String boardPage(Model model) {
		
		List<Map<String, Object>> boardList = new ArrayList<Map<String, Object>>();
		
		try {
			boardList = boardService.getAdminBoardList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("boardList", boardList);
		
		return "board";
	}
	
	// 게시글 작성 페이지 
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public String editorPage(Model model, @RequestParam String userId, @RequestParam String communityNo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		paramMap.put("communityNo", communityNo);
		
		try {
			model.addAttribute("boardDetail", boardService.getBoardDetail(paramMap));			// 게시글 내용 가져오기 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "edit";
	}
	
	// 게시글 상세보기 페이지
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String detailPage(Model model, @RequestParam String userId, @RequestParam String communityNo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		try {
			paramMap.put("userId", userId);
			paramMap.put("communityNo", communityNo);
			model.addAttribute("boardDetail", boardService.getBoardDetail(paramMap));			// 게시글 내용 가져오기 
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.error("result : " + model);
		
		return "detail";
	}
	
	// 게시물 등록
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public void write(@RequestParam HashMap<String, Object> boardParam, Model model) {
		
		try {
			boardService.insertCommunity(boardParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("boardCategory", boardParam.get("boardCategory"));
	}
	
	// 게시물 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public void modify(@RequestParam HashMap<String, Object> boardParam, Model model) {
		
		try {
			boardService.updateCommunity(boardParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 게시물 수정
	@RequestMapping(value="/updateMark", method = RequestMethod.GET)
	public void updateMark(@RequestParam HashMap<String, Object> boardParam, Model model) {
		
		try {
			boardService.updateMark(boardParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 게시물 삭제
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public void delete(@RequestParam HashMap<String, Object> boardParam, Model model) {
		
		try {
			boardService.deleteCommunity(boardParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 퀴즈 관리 페이지
	@RequestMapping(value="/quizBoard")
	public String quizPage(Model model) {
		
		List<Map<String, Object>> boardList = new ArrayList<Map<String, Object>>();
		
		try {
			boardList = quizService.getQuizList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("boardList", boardList);
		
		return "quizBoard";
	}
	
	// 퀴즈 작성 페이지 
	@RequestMapping(value="/quizEdit", method = RequestMethod.GET)
	public String quizEditorPage(Model model, @RequestParam String quizNo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		try {
			if (quizNo.equals("0")) {
				model.addAttribute("quizNo", quizNo);
			} else {
				paramMap.put("quizNo", quizNo);
				model.addAttribute("quizNo", quizNo);
				model.addAttribute("boardDetail", quizService.getQuizDetail(paramMap));			// 게시글 내용 가져오기 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "quizEdit";
	}
	
	// 퀴즈 등록
	@RequestMapping(value="/writeQuiz", method = RequestMethod.POST)
	public void writeQuiz(@RequestParam HashMap<String, Object> boardParam, Model model) {
		
		try {
			quizService.insertQuiz(boardParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 게시물 수정
	@RequestMapping(value="/quizModify", method = RequestMethod.POST)
	public void quizModify(@RequestParam HashMap<String, Object> boardParam, Model model) {
		
		try {
			quizService.updateQuiz(boardParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 퀴즈 삭제
	@RequestMapping(value="/deleteQuiz", method = RequestMethod.GET)
	public void deleteQuiz(@RequestParam HashMap<String, Object> boardParam, Model model) {
		
		try {
			quizService.deleteQuiz(boardParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	// 회원 관리 페이지
	@RequestMapping(value="/user")
	public String userPage(Model model) {
		
		List<Map<String, Object>> userList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> quizList = new ArrayList<Map<String, Object>>();
		
		try {
			userList = userService.getAdminBoardList();
			quizList = quizService.getQuizList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("userList", userList);
		model.addAttribute("quizList", quizList);
		
		return "user";
	}
	
	// 퀴즈 할당 
	@RequestMapping(value="/addQuiz", method = RequestMethod.GET)
	@ResponseBody
	public String addQuiz(@RequestParam String userId, @RequestParam String quizNo) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		String result = null;
		
		try {
			paramMap.put("userId", userId);
			paramMap.put("quizNo", quizNo);
			
			int rst = quizService.addQuiz(paramMap);
			
			if(rst == 2) {
				return "{\"result\":\"fail\"}";
			} else {
				return "{\"result\":\"success\"}";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "{\"result\":\"error\"}";
		}
	}
	
	// 봉사인증기록 부여 
	@RequestMapping(value="/addHistory", method = RequestMethod.GET)
	@ResponseBody
	public String addHistory(@RequestParam String userId, @RequestParam String content, @RequestParam String sDate, @RequestParam String eDate) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String result = null;
		
		try {
			paramMap.put("userId", userId);
			paramMap.put("content", content);
			paramMap.put("sDate", sDate.substring(0, 4) + "."+ sDate.substring(4, 6) + "." + sDate.substring(6, 8));
			paramMap.put("eDate", eDate.substring(0, 4) + "."+ eDate.substring(4, 6) + "." + eDate.substring(6, 8));
			
			int rst = userService.addHistory(paramMap);
			
			if(rst > 0) {
				return "{\"result\":\"success\"}";
			} else {
				return "{\"result\":\"fail\"}";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "{\"result\":\"error\"}";
		}
	}
}
