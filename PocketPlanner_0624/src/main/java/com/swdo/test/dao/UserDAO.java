package com.swdo.test.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.UserVO;


@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession session;
	
	
	//회원가입
	public int userJoin(UserVO user) {
		
		int cnt = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userJoin(user);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return cnt;
		
	}
	
	//로그인
	public UserVO userSelectOne(UserVO user) {
		UserVO result = null;	
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.userSelectOne(user);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return result;
	}
	
	
	
	
	
	
	
}
