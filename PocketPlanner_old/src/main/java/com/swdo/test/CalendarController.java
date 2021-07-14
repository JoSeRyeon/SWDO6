package com.swdo.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.html.HTMLEditorKit.Parser;

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

@Controller
@RequestMapping(value ="/calendar")
public class CalendarController {

	//캘린더 화면 이동
	@RequestMapping( value = "/main" , method = RequestMethod.GET)
	public String calendar() {
		
		
		return  "calendar" ;
	}
	
	
	@ResponseBody
	@RequestMapping( value = "/save" , method = RequestMethod.POST)
	public Map<String, Object> save(@RequestParam HashMap<String, Object> obj) {
		
		System.out.println(obj);
		
		String str = new String((String)obj.get("jsonData"));
		JSONObject obj2 = new JSONObject(obj);
		JSONArray arr = new JSONArray();
		
		
		JSONParser parser = new JSONParser();
		Map<String, Object> list = new HashMap<String, Object>(obj);
		
		//JSONObject jobj = new JSONObject(map);
		try {
			System.out.println(parser.parse(str));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
		

		//System.out.println(obj.get("jsonData"));
		//JSONObject jsonObj = new JSONObject(obj);
		//System.out.println(jsonObj);
		//JSONArray jsonArray = (JSONArray) jsonObj.get("title");
		
		//JSONParser jsonParser = new JSONParser(obj);
		//JSONObject jsonObj = (JSONObject) jsonParser.parse(obj);

		

		
		
		
		//JSONArray arr = JSONArray.fromObject(str);

		//System.out.println(obj.get("jsonData"));
		//System.out.println(obj.get("title"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		//List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		/*
		 * for(int i = 0; i < obj.size(); i++) { list.add(i, obj); }
		 */
		
		//System.out.println(list.get(0).get("title"));
		
	
		
		
		map.put("msg", "성공");
		
		return  map ;
	}
}
