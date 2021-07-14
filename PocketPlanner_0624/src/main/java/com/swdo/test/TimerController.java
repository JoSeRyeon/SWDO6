package com.swdo.test;

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
	
	
	//타이머 화면으로 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		
		return "timer";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String save(@RequestBody int saveTime) {
		
		System.out.println(saveTime);
		service.timerInsert(saveTime);
		
		
		return "timer";
	}
	
	
	
	
	
	/*
	  //학습한 시간 저장 (비동기)
	  
	  @ResponseBody
	
	  @RequestMapping(value = "/save", method = RequestMethod.GET) public void
	  save(int saveTime) {
	  
	  System.out.println(saveTime); }
	 */

}
