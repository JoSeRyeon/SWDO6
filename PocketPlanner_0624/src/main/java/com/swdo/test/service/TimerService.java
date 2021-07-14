package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.TimerDAO;
import com.swdo.test.vo.TimerVO;
import com.swdo.test.vo.UserVO;

@Service
public class TimerService {
	

	@Autowired
	private TimerDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(TimerService.class);

	
	//특정 사용자의 타이머 불러오기
	public TimerVO timerSelect() {
		
		//user_id을 추가
		
		  UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		  TimerVO timer = new TimerVO();
		  timer.setUser_id(loginVO.getUser_id());
		  
		  timer = dao.timerSelect(timer.getUser_id());
		  
		  return timer;
			
		}
	
	
	
	//타이머 값 추가
	public void timerInsert(int saveTime) {
		
		  int timer_total = 0;
		  int timer_today = 0;
		  //원래 타이머 데이터 불러오기
		  //UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		  TimerVO timer = new TimerVO();
		 //timer.setUser_id(loginVO.getUser_id());
		  
		  timer.setUser_id("test1");
		  
		  timer = dao.timerSelect(timer.getUser_id());
		  

		//기존 타이머 값에 새로운 타이머 값 더하기
		  if( timer == null) { //사용자가 타이머를 한 번도 사용하지 않았을 경우
			  timer_total = saveTime;
			  timer_today = saveTime;
		  }else {
			 timer_total = timer.getTimer_total() + saveTime;
			 timer_today = timer.getTimer_today() + saveTime;
			 
		  }
		 
		  
				
		  //더한 타이머 데이터 추가
		  int cnt = dao.timerInsert(timer);
				
				if(cnt == 0) {
					logger.info("타이머저장 실패");
				}else {
					logger.info("타이머저장 성공");
					logger.info("타이머 값:{}",timer);
				}
		
	}
}
