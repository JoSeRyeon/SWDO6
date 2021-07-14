package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.UserVO;


@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession session;
	
	public void userJoin(UserVO user) {
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.userJoin(user);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
	}

}
