package com.swdo.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swdo.test.service.TimerService;
import com.swdo.test.vo.TimerVO;

@Controller
@RequestMapping(value ="/timer")
public class TimerController {
	
	@Autowired
	private TimerService service;
	
	private static final Logger logger = LoggerFactory.getLogger(TimerController.class);
	
	
	//타이머 화면으로 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		
		return "timer";
	}
	
	//타이머 정보 저장(비동기)
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public void save(TimerVO timer) {
		
		//System.out.println(timer);
		service.timerInsert(timer);
		
	}
	
	
	/*
	 * @RequestMapping(value = "/total", method = RequestMethod.GET) public String
	 * total() {
	 * 
	 * service.timerSelect(); return "total"; }
	 */
	 
	
	// 타이머 Reset
	@RequestMapping(value = "/timerReset", method = RequestMethod.GET)
	public String timerReset(boolean total_flag , boolean today_flag) {
		
		//logger.info("총 학습시간:{}", total_flag);
		//logger.info("오늘 학습시간:{}", today_flag);
		
		service.timerReset(total_flag, today_flag);
		service.totalTimerSelect();
		
		return "/user/updateForm";
	}
	
	


}
