package com.swdo.test.dao;

import com.swdo.test.vo.UserVO;

public interface UserMapper {
	
	//회원가입
	public int userJoin(UserVO user);
	
	//로그인
	public UserVO userSelectOne(UserVO user);
	

}
 