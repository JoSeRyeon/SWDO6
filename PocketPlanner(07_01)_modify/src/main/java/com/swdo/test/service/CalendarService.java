package com.swdo.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.swdo.test.dao.CalendarDAO;
import com.swdo.test.vo.PlanVO;
import com.swdo.test.vo.UserVO;

@Service
public class CalendarService {

	@Autowired
	private HttpSession session;
	@Autowired
	private CalendarDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(CalendarService.class);

	// 일정 추가
	public void planInsert(JSONArray arr) {

		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		// PlanVO plan = new PlanVO();
		int cnt = 0;
		
		//일정 추가 전 사용자가 일정을 가지고 있는지 확인
		ArrayList<PlanVO> planList = dao.planSelectAll(loginVO.getUser_id());
		
		System.out.println(planList);
		
		if(!ObjectUtils.isEmpty(planList)) {//이미 저장 된 일정이 있을 경우에는 삭제 
			
			cnt = dao.planDeleteAll(loginVO.getUser_id());
			
			if (cnt == 0) {
				logger.info("전체 일정 삭제 실패");
			} else {
				logger.info("전체 일정 삭제 성공");

			}
			
		}
		
		//일정 저장
		for (int i = 0; i < arr.size(); i++) {

			PlanVO plan = new PlanVO();
			JSONObject list = (JSONObject) arr.get(i);

			System.out.println("plan_title : " + list.get("title"));
			System.out.println("allDay : " + list.get("allDay"));
			System.out.println("plan_sdate : " + list.get("start"));
			System.out.println("plan_edate : " + list.get("end"));
			System.out.println("plan_content : " + list.get("content"));

			plan.setPlan_title((String) list.get("title"));
			plan.setUser_id(loginVO.getUser_id());
			plan.setPlan_allDay(String.valueOf(list.get("allDay")));
			plan.setPlan_edate((String) list.get("end"));
			plan.setPlan_sdate((String) list.get("start"));
			plan.setPlan_content((String)list.get("content"));

			System.out.println(plan);

			cnt = dao.planInsert(plan);

			if (cnt == 0) {
				logger.info("{}번 일정 저장 실패", i);
			} else {
				logger.info("{}번 일정 저장 성공", i);

			}

		}
		
	}

	// 특정 사용자 일정 전부 삭제
	public void planDeleteAll(String user_id) {
		
		int cnt = dao.planDeleteAll(user_id);
		
		if (cnt == 0) {
			logger.info("전체 일정 삭제 실패");
		} else {
			logger.info("전체 일정 삭제 성공");

		}

	}

	// 특정 사용자의 일정 전부 조회
	public ArrayList<PlanVO> planSelectAll() {
		
		UserVO loginVO = (UserVO) session.getAttribute("loginVO");
		ArrayList<PlanVO> planList = dao.planSelectAll(loginVO.getUser_id());
		
		return planList;
	}
}
