package com.swdo.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.UserService;
import com.swdo.test.vo.UserVO;

@Controller
@RequestMapping(value ="/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	
		// 회원가입 폼이동
		@RequestMapping( value = "/joinForm" , method = RequestMethod.GET)
		public String joinForm() {
			
			return  "user/joinForm" ;
		}
		

		//회원가입
		@RequestMapping(value = "/join" , method = RequestMethod.POST)
		public String join(UserVO user) {
			
			System.out.println(user);
			service.userJoin(user);
			String path = login(user);
			
			return path;
		}
		
		
		//네이버 회원 전용 회원가입
		@RequestMapping(value = "/naver_join" , method = RequestMethod.GET)
		public String naver_join(UserVO user) {
			
			System.out.println("네이버 전용 회원 가입");
			System.out.println(user);
			
			UserVO data = new UserVO();
			data.setUser_id(user.getUser_id().substring(0, user.getUser_id().length()/2));
			data.setUser_pw(user.getUser_id().substring(user.getUser_id().length()/2,user.getUser_id().length()));
			data.setUser_nm(user.getUser_nm());
			
			System.out.println(data);
			service.userJoin(data);
			
			String path = login(data);
			
			return  path ;
		}
		
		
		//로그인 폼이동
		@RequestMapping( value = "/loginForm" , method = RequestMethod.GET)
		public String loginForm() {
			
			
			return  "user/loginForm" ;
		}
		
		//로그인
		@RequestMapping( value = "/login" , method = RequestMethod.POST)
		public String login(UserVO user) {
			
			System.out.println(user);
			String path = service.userLogin(user);
			
			return  path;
		}
		
		// 네이버 연동 가입 및 로그인
			@RequestMapping( value = "/naver_login" , method = RequestMethod.GET)
			public String naver_login(UserVO user) {
				
				UserVO data = new UserVO();
				data.setUser_id(user.getUser_id().substring(0, user.getUser_id().length()/2));
				data.setUser_pw(user.getUser_id().substring(user.getUser_id().length()/2,user.getUser_id().length()));
				data.setUser_nm(user.getUser_nm());
				
				System.out.println(data);
				String path = service.userLogin(data);
				
				return  path;
			}
		
		// 콜백
			@RequestMapping( value = "/collback" , method = RequestMethod.GET)
			public String collback(UserVO user) {
				
				
				
				return  "user/collback" ;
			}
			
		// 콜백2
			@RequestMapping( value = "/collbackJoin" , method = RequestMethod.GET)
			public String collback_join(UserVO user) {
				
				
				
				return  "user/collbackJoin" ;
			}
		
		
		//로그아웃
			@RequestMapping(value = "/logout" , method = RequestMethod.GET)
			public String logout() {

				 service.userLogout();
								
				return "redirect:/";
			}
		
	
	

}
