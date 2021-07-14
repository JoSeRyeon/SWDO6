package com.swdo.test;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.test.vo.CalendarVO;

@Controller
@RequestMapping(value ="/callendar")
public class CallendarController {

	@RequestMapping( value = "/main" , method = RequestMethod.GET)
	public String loginForm() {
		
		
		return  "user/calendar" ;
	}
	
	@RequestMapping( value = "/save" , method = RequestMethod.POST,  produces = "application/json; charset=utf-8")
	public String save(@RequestBody CalendarVO jsonData) throws Exception {
	
		
	    
		System.out.println(jsonData.getTitle());
		
        
        return "user/calendar";
	 

	}
	
	
	@RequestMapping( value = "/insert" , method = RequestMethod.POST)
	public String insert(CalendarVO calendar) {
		
		System.out.println(calendar);
		
		return  "user/calendar" ;
	}
}
