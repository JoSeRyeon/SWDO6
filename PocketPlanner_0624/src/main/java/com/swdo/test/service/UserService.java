package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.UserDAO;
import com.swdo.test.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO dao;
	@Autowired
	private HttpSession session;
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	//회원가입
	public String userJoin(UserVO user) {
		
		int cnt = dao.userJoin(user);
		String path = "";
	
		if(cnt == 0) {
			logger.info("회원가입 실패");
			path = "redirect:/user/joinForm";
		}else {
			logger.info("회원가입 성공");
			path = "redirect:/";
		}
	
		return path;
	}
	
	//로그인
	public String userLogin(UserVO user) {
	
		UserVO result = dao.userSelectOne(user);
		String path = "";
		
		if(result != null) {
			if(result.getUser_pw().equals(user.getUser_pw())) {
				logger.info("로그인 성공");
				session.setAttribute("loginVO", result);
				path = "redirect:/";
			}else {//비밀번호 오류
				logger.info("비밀번호 오류");
				path = "redirect:/user/loginForm";
				
			}}else {//아이디 오류
				logger.info("아이디 오류");
				path = "redirect:/user/loginForm";
			}
		
		return path;
		
	}
	

	//로그아웃
	public void userLogout() {
		session.removeAttribute("loginVO");
	}

}
