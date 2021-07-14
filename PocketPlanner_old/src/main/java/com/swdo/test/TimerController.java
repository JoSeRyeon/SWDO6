package com.swdo.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="/timer")
public class TimerController {
	
	
	//타이머 화면으로 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		
		return "timer";
	}
	
	
	//학습한 시간 저장 (비동기 방식으로 수정하기)
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String save(int timersave) {
	
		System.out.println(timersave);
		
		return "timer";
	}
	

}
