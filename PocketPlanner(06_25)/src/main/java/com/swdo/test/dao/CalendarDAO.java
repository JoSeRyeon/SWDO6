package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.PlanVO;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSession session;

	// 일정 추가
	public int planInsert(PlanVO plan) {

		int cnt = 0;
		try {
			CalendarMapper mapper = session.getMapper(CalendarMapper.class);
			cnt = mapper.planInsert(plan);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;

	}

	// 특정 사용자 일정 전부 삭제
	public int planDeleteAll(String user_id) {
		
		int cnt = 0;
		try {
			CalendarMapper mapper = session.getMapper(CalendarMapper.class);
			cnt = mapper.planDeleteAll(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}

	// 특정 사용자의 일정 전부 조회
	public ArrayList<PlanVO> planSelectAll(String user_id){
		
		ArrayList<PlanVO> planList = null;
		
		try {
			CalendarMapper mapper = session.getMapper(CalendarMapper.class);
			planList = mapper.planSelectAll(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return planList;
		
		
	}

}
