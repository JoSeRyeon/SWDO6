package com.swdo.test.dao;

import com.swdo.test.vo.TimerVO;

public interface TimerMapper {
	
	//타이머 값 넣기
	public int timerInsert(TimerVO timer);
	
	//특정 사용자의 타이머 값 불러오기
	public TimerVO timerSelect(String user_id);
	

}
