package com.swdo.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.UserDAO;
import com.swdo.test.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO dao;
	
	
	public void userJoin(UserVO user) {
		
	dao.userJoin(user);
	}

}
