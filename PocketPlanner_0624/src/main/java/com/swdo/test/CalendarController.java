package com.swdo.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;
import com.swdo.test.vo.CalendarVO;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {

	// 캘린더 화면 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String calendar() {

		return "calendar";
	}

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public Map<String, Object> save(@RequestBody String obj) throws ParseException {

		
		System.out.println(obj);
		
		JSONParser p = new JSONParser();

		JSONArray arr = (JSONArray) p.parse(obj);
		
		for (int i = 0; i < arr.size(); i++) {
			
			JSONObject list = (JSONObject)arr.get(i);
			
			System.out.println("title : " + list.get("title"));
			System.out.println("allDay : " + list.get("allDay"));
			System.out.println("start : " + list.get("start"));
			System.out.println("end : " + list.get("end"));
		}
		
		
	
		

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("msg", "성공");

		return map;
	}
}
