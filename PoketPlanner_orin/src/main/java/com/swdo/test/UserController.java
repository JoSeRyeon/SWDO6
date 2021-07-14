package com.swdo.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.vo.UserVO;

@Controller
@RequestMapping(value ="/user")
public class UserController {
	
	
	//로그인 폼이동
	@RequestMapping( value = "/loginForm" , method = RequestMethod.GET)
	public String loginForm() {
		
		
		return  "user/loginForm" ;
	}
	
	//로그인
	@RequestMapping( value = "/login" , method = RequestMethod.POST)
	public String login(UserVO user) {
		
		System.out.println(user);
		
		return  "home" ;
	}
	
	// 네이버 연동 가입 및 로그인
		@RequestMapping( value = "/naver_login" , method = RequestMethod.GET)
		public String naver_login(UserVO user) {
			
			
			System.out.println(user.getUser_id());
			System.out.println(user.getUser_nm());
			
			return  "home" ;
		}
	
	// 콜백
		@RequestMapping( value = "/collback" , method = RequestMethod.GET)
		public String collback(UserVO user) {
			
			System.out.println(user);
			
			return  "user/collback" ;
		}
	
	
	// 회원가입 폼이동
	@RequestMapping( value = "/joinForm" , method = RequestMethod.GET)
	public String joinForm() {
		
		
		return  "user/joinForm" ;
	}
	

	//회원가입
	@RequestMapping(value = "/join" , method = RequestMethod.POST)
	public String join(UserVO user) {
		
		System.out.println(user);
		//service.userJoin(user);
		
		return  "home" ;
	}

}
