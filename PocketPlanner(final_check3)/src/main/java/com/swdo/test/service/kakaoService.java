package com.swdo.test.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParser;
import com.swdo.test.vo.UserVO;

@Service
public class kakaoService {

	
	private static final Logger logger = LoggerFactory.getLogger(kakaoService.class);
	
	public UserVO getAccessToken_Join(String code) {
		
		  
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=bc06ebf0c4b328321307be20bd770c5a");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8882/user/kakao_join");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode(토큰) : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            
            JSONParser parser = new JSONParser();
            JSONObject element = (JSONObject) parser.parse(result);

            access_Token = (String) element.get("access_token");
            refresh_Token = (String) element.get("refresh_token");

            //System.out.println("access_token : " + access_Token);
            //System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        UserVO data = getUserProfile(access_Token);
        
        return data;

        //return access_Token;
        
	}
	
	public UserVO getAccessToken(String code) {
		
  
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=bc06ebf0c4b328321307be20bd770c5a");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8882/user/kakao");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode(토큰) : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            
            JSONParser parser = new JSONParser();
            JSONObject element = (JSONObject) parser.parse(result);

            access_Token = (String) element.get("access_token");
            refresh_Token = (String) element.get("refresh_token");

            //System.out.println("access_token : " + access_Token);
            //System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        UserVO data = getUserProfile(access_Token);
        
        return data;

        //return access_Token;
        
	}
	
	public UserVO getUserProfile(String access_Token) {
		
		UserVO data = new UserVO();
		
	     //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            int responseCode = conn.getResponseCode();
            
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JSONParser parser = new JSONParser();
            JSONObject element = (JSONObject) parser.parse(result);
            
            //id 추출용(long타입)
            JSONObject jObject = new JSONObject(element);
            Long id = (Long) jObject.get("id");
            String id_str = (String.valueOf(id));
            System.out.println(id_str);
            
            JSONObject properties = (JSONObject) element.get("properties");
            //JSONObject kakao_account = (JSONObject) element.get("kakao_account");

            //System.out.println(id);
            String nickname = (String) properties.get("nickname");
            //String email = (String) kakao_account.get("email");
            
            //System.out.println(nickname);
            //System.out.println(email);

            userInfo.put("nickname", nickname);
            //userInfo.put("email", email);
            
            
            data.setUser_id(id_str.substring(0, id_str.length()/2));
            data.setUser_nm(nickname);
            data.setUser_pw(id_str.substring(id_str.length()/2, id_str.length()));
            
            
           
            

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        //return userInfo;
        return data;
        
		
	}
	
}
