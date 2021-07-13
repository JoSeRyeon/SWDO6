package com.swdo.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.media.jfxmedia.logging.Logger;
import com.swdo.test.service.CalendarService;
import com.swdo.test.vo.JsonPlanVO;
import com.swdo.test.vo.PlanVO;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {

	@Autowired
	private CalendarService service;
	

	// 캘린더 화면 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String calendar() {

		//service.planSelectAll();
		
		
		ArrayList<PlanVO> planList = service.planSelectAll();
		
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

		for (int i = 0; i < planList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("plan_num", planList.get(i).getPlan_num());
			map.put("plan_content", planList.get(i).getPlan_content());
			
			list.add(map);
			
		}
		

		
		//JSONArray jsonArray = new JSONArray();

		//model.addAttribute("jsonList", planList2); 
		
		//System.out.println(JSONArray.toJSONString(planList2));

		//model.addAttribute("jsonListArray", JSONArray.toJSONString(planList2));
		
		

		return "calendar";
	}
	
	@ResponseBody
	@RequestMapping(value = "/content", method = RequestMethod.POST)
	public List<Map<String, Object>> content(@RequestBody String obj){
		
		//System.out.println("일정의 세부사항 불러오기");
		
		ArrayList<PlanVO> planList = service.planSelectAll();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

		for (int i = 0; i < planList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("plan_num", planList.get(i).getPlan_num());
			map.put("plan_content", planList.get(i).getPlan_content());
			
			list.add(map);
			
		}
		
		//System.out.println(list);
		
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public List<Map<String, Object>> save(@RequestBody String obj) throws ParseException {

		
		//System.out.println(obj);

		JSONParser p = new JSONParser();

		JSONArray arr = (JSONArray) p.parse(obj);

		//일정 추가
		service.planInsert(arr);

		
		ArrayList<PlanVO> planList = service.planSelectAll();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for (int i = 0; i < planList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("plan_num", planList.get(i).getPlan_num());
			map.put("plan_content", planList.get(i).getPlan_content());
			
			list.add(map);
			
		}
		
		return list;
	}
	
	//일정 데이터 캘린더화면으로 전송
	@ResponseBody
	@RequestMapping(value = "/json", method = RequestMethod.POST)
	public List<Map<String, Object>> json(@RequestBody String obj){
		
		//System.out.println("db요청");
		ArrayList<PlanVO> planList = service.planSelectAll();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for (int i = 0; i < planList.size(); i++) {
			
			JsonPlanVO data = new JsonPlanVO();
			Map<String, Object> map = new HashMap<String, Object>();
			
			data.setId(Integer.toString((int)planList.get(i).getPlan_num()));
			data.setTitle(planList.get(i).getPlan_title());
			data.setStart(planList.get(i).getPlan_sdate());
			data.setEnd(planList.get(i).getPlan_edate());
			data.setAllDay(planList.get(i).getPlan_allDay());
			data.setColor(planList.get(i).getPlan_color());
			
			//planList2.add(i, data);
			//System.out.println(planList2.get(i));
			
			
			map.put("id", data.getId());
			map.put("title", data.getTitle());
			map.put("start", data.getStart());
			map.put("end", data.getEnd());
			map.put("allDay", Boolean.parseBoolean(data.getAllDay()));
			map.put("color", data.getColor());
			list.add(map);
		}
		
		
		//System.out.println(list);
		
		return list;
		
	}
	
	
	//plan_achv 수정
	@ResponseBody
	@RequestMapping(value="/planAchvCheck" , method = RequestMethod.GET)
	public void planAchvCheck(PlanVO plan) {
		
		//System.out.println(plan);
		service.updateAchv(plan);
		
	}
	
}
