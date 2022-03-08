package kr.pe.playnote.pne;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PneController {

    /* 작성일 : 2021-11-09 
     * 작성자 : 이응규
     * 원익PNE 테스트 - 사업장 정보 조회  
     * */
	@RequestMapping(value = "/api/site/getSiteListJson", method = {RequestMethod.GET, RequestMethod.POST})
	public String getSiteListJson(Locale locale, Model model, HttpServletRequest request) {
		
		JSONObject json1 = new JSONObject();
		JSONObject json2 = new JSONObject();
		JSONObject json3 = new JSONObject();
		JSONObject json4 = new JSONObject();
		JSONObject json5 = new JSONObject();
		JSONObject json6 = new JSONObject();
		JSONArray jsonarr = new JSONArray();
		JSONArray jsonarr1 = new JSONArray();
		JSONArray jsonarr2 = new JSONArray();
		JSONArray jsonarr3 = new JSONArray();
		JSONArray jsonarr4 = new JSONArray();
		JSONArray jsonarr5 = new JSONArray();

        json1.put("success", true);
        json1.put("count", 4);
        
        json2.put("site_name",  "청주사업장");
        json2.put("reg_date",  "2020-07-17");
        json2.put("mod_id",  "admin");
        json2.put("site_seq",  1);
        json2.put("address2",  "LG화학 청주 사업장");
        json2.put("address1",  "충청북도 청주시 흥덕구 백봉로 39");
        json2.put("mod_date","2020-07-17 16:08:04");
        json2.put("tel","043-261-7114");
        json2.put("comment","");
        json2.put("reg_id","admin");
        json2.put("status","Y");
        jsonarr.add(json2);

        json3.put("site_name","대산사업장");
        json3.put("reg_date","2020-07-17");
        json3.put("mod_id","admin");
        json3.put("site_seq",2);
        json3.put("address2","LG화학 대산 사업장");
        json3.put("address1","충청남도 서산시 대산읍 독곶1로 54");
        json3.put("mod_date","2020-07-17 16:09:24");
        json3.put("tel","041-661-2114");
        json3.put("comment","");
        json3.put("reg_id","admin");
        json3.put("status","Y");
        jsonarr.add(json3);
        
        json4.put("site_name","여수사업장");
        json4.put("reg_date","2020-09-03");
        json4.put("mod_id","admin");
        json4.put("site_seq",11);
        json4.put("address2","LG화학");
        json4.put("address1","전남 여수시 여수산단2로 55");
        json4.put("mod_date","2020-09-03 11:00:08");
        json4.put("tel","061-680-1114");
        json4.put("comment","");
        json4.put("reg_id","admin");
        json4.put("status","Y");
        jsonarr.add(json4);

        json5.put("site_name","서울테스트사업장");
        json5.put("reg_date","2020-09-03");
        json5.put("mod_id","admin");
        json5.put("site_seq",12);
        json5.put("address2","LG화학");
        json5.put("address1","전남 여수시 여수산단2로 55");
        json5.put("mod_date","2020-09-03 11:00:08");
        json5.put("tel","061-680-1114");
        json5.put("comment","");
        json5.put("reg_id","admin");
        json5.put("status","Y");
        jsonarr.add(json5);
        json1.put("list", jsonarr);
        
        String json = json1.toString();
        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
		
	}
	
    /* 작성일 : 2021-11-09
     * 작성자 : 이응규
     * 공장 정보
     * /api/area/getFactoryList?site_seq=01
     * */
	@RequestMapping(value = "/api/area/getFactoryList", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String getFactoryList(@RequestBody Map<String, String> map, HttpServletRequest request) {
		
		String site_seq = map.get("site_seq");

		JSONObject json  = new JSONObject();
		JSONObject json1 = new JSONObject();
		JSONObject json2 = new JSONObject();
		JSONObject json3 = new JSONObject();
		JSONObject json4 = new JSONObject();
		JSONObject json5 = new JSONObject();
		JSONObject json6 = new JSONObject();
		JSONArray jsonarr1 = new JSONArray();
		JSONArray jsonarr2 = new JSONArray();
		JSONArray jsonarr3 = new JSONArray();
		JSONArray jsonarr4 = new JSONArray();
		JSONArray jsonarr5 = new JSONArray();
		JSONArray jsonarr6 = new JSONArray();
		
        if ( "1".equals(site_seq)) {
        	
            json1.put("factory_seq",  "1");
            json1.put("factory_name",  "A동");
            jsonarr1.add(json1);
            
            json2.put("factory_seq",  "2");
            json2.put("factory_name",  "B동");
            jsonarr1.add(json2);
            
            json3.put("factory_seq",  "3");
            json3.put("factory_name",  "C동");
            jsonarr1.add(json3);
            
            json4.put("factory_seq",  "4");
            json4.put("factory_name",  "D동");
            jsonarr1.add(json4);

            json.put("list", jsonarr1);
            
        }else if( "2".equals(site_seq)) {

            json1.put("factory_seq",  "5");
            json1.put("factory_name",  "1동");
            jsonarr1.add(json1);
            
            json2.put("factory_seq",  "6");
            json2.put("factory_name",  "2동");
            jsonarr1.add(json2);
            
            json3.put("factory_seq",  "7");
            json3.put("factory_name",  "3동");
            jsonarr1.add(json3);
            
            json4.put("factory_seq",  "8");
            json4.put("factory_name",  "4동");
            jsonarr1.add(json4);

            json.put("list", jsonarr1);
        }else if( "11".equals(site_seq)) {

            json1.put("factory_seq",  "14");
            json1.put("factory_name",  "1공장");
            jsonarr1.add(json1);
            
            json2.put("factory_seq",  "15");
            json2.put("factory_name",  "2공장");
            jsonarr1.add(json2);
            
            json.put("list", jsonarr1);
        }else  if( "12".equals(site_seq)) {

            json1.put("factory_seq",  "16");
            json1.put("factory_name",  "A동");
            jsonarr1.add(json1);
            
            json2.put("factory_seq",  "17");
            json2.put("factory_name",  "테스트동");
            jsonarr1.add(json2);

            json2.put("factory_seq",  "20");
            json2.put("factory_name",  "정현 공장");
            jsonarr1.add(json2);
            
            json2.put("factory_seq",  "21");
            json2.put("factory_name",  "박공장");
            jsonarr1.add(json2);
            
            json.put("list", jsonarr1);
        }

        String jsonStr = json.toString();
        System.out.println(jsonStr);
	    request.setAttribute("data", jsonStr);
		return "comm/json";
	}

    /* 작성일 : 2021-11-09
     * 작성자 : 이응규
     * 공장 정보
     * */
	@RequestMapping(value = "/api/area/getAreaCombo", method = {RequestMethod.GET, RequestMethod.POST})
	public String getAreaCombo(Locale locale, Model model, HttpServletRequest request) {

		String factory_seq = request.getParameter("factory_seq");

		JSONObject json  = new JSONObject();
		JSONObject json1 = new JSONObject();
		JSONObject json2 = new JSONObject();
		JSONObject json3 = new JSONObject();
		JSONObject json4 = new JSONObject();
		JSONObject json5 = new JSONObject();
		JSONObject json6 = new JSONObject();
		JSONObject json7 = new JSONObject();
		JSONObject json8 = new JSONObject();
		JSONObject json9 = new JSONObject();
		JSONObject json10 = new JSONObject();
		JSONObject json11 = new JSONObject();
		JSONObject json12 = new JSONObject();
		JSONObject json13 = new JSONObject();
		JSONObject json14 = new JSONObject();
		JSONObject json15 = new JSONObject();
		JSONObject json16 = new JSONObject();
		JSONObject json17 = new JSONObject();
		JSONObject json18 = new JSONObject();
		JSONObject json19 = new JSONObject();
		JSONObject json20 = new JSONObject();
		JSONObject json21 = new JSONObject();
		JSONObject json22 = new JSONObject();
		JSONObject json23 = new JSONObject();
		JSONObject json24 = new JSONObject();
		JSONObject json25 = new JSONObject();
		JSONObject json26 = new JSONObject();
		JSONObject json27 = new JSONObject();
		JSONObject json28 = new JSONObject();
		JSONObject json29 = new JSONObject();
		JSONArray jsonarr1 = new JSONArray();

        if ( "1".equals(factory_seq)) {
        	
            json1.put("area_seq",  1);
            json1.put("area_name",  "A구역");
            jsonarr1.add(json1);
            
            json2.put("area_seq",  3);
            json2.put("area_name",  "C구역");
            jsonarr1.add(json2);
            
            json3.put("area_seq",  4);
            json3.put("area_name",  "D구역");
            jsonarr1.add(json3);
            
            json4.put("area_seq",  56);
            json4.put("area_name",  "E구역");
            jsonarr1.add(json4);

            json5.put("area_seq",  90);
            json5.put("area_name",  "123");
            jsonarr1.add(json5);

            json.put("list", jsonarr1);
            
        }else if( "5".equals(factory_seq)) {

            json1.put("area_seq",  26);
            json1.put("area_name",  "A구역");
            jsonarr1.add(json1);
            
            json2.put("area_seq",  27);
            json2.put("area_name",  "B구역");
            jsonarr1.add(json2);
            
            json3.put("area_seq",  28);
            json3.put("area_name",  "C구역");
            jsonarr1.add(json3);
            
            json4.put("area_seq",  29);
            json4.put("area_name",  "D구역");
            jsonarr1.add(json4);

            json.put("list", jsonarr1);

        }else if( "14".equals(factory_seq)) {

            json1.put("area_seq",  55);
            json1.put("area_name",  "A구역");
            jsonarr1.add(json1);
            
            json.put("list", jsonarr1);

        }else  if( "16".equals(factory_seq)) {

            json1.put("area_seq",  58);
            json1.put("area_name",  "201");
            jsonarr1.add(json1);

            json2.put("area_seq",  59);
            json2.put("area_name",  "301");
            jsonarr1.add(json2);

            json3.put("area_seq",  60);
            json3.put("area_name",  "102");
            jsonarr1.add(json3);
        
            json4.put("area_seq",  61);
            json4.put("area_name",  "103");
            jsonarr1.add(json4);

            json5.put("area_seq",62);  
            json5.put("area_name","104");
            jsonarr1.add(json5);
            
            json6.put("area_seq",63);  
            json6.put("area_name","105");
            jsonarr1.add(json6);

            json7.put("area_seq",64);  
            json7.put("area_name","106");
            jsonarr1.add(json7);

            json8.put("area_seq",65);  
            json8.put("area_name","107");
            jsonarr1.add(json8);

            json9.put("area_seq",66);  
            json9.put("area_name","108");
            jsonarr1.add(json9);

            json10.put("area_seq",67);  
            json10.put("area_name","109");
            jsonarr1.add(json10);

            json11.put("area_seq",68);  
            json11.put("area_name","110");
            jsonarr1.add(json11);

            json12.put("area_seq",70);  
            json12.put("area_name","203");
            jsonarr1.add(json12);

            json13.put("area_seq",71);  
            json13.put("area_name","204");
            jsonarr1.add(json13);

            json14.put("area_seq",72);  
            json14.put("area_name","205");
            jsonarr1.add(json14);

            json15.put("area_seq",73);  
            json15.put("area_name","206");
            jsonarr1.add(json15);

            json16.put("area_seq",74);  
            json16.put("area_name","207");
            jsonarr1.add(json16);

            json17.put("area_seq",75);  
            json17.put("area_name","208");
            jsonarr1.add(json17);

            json18.put("area_seq",76);  
            json18.put("area_name","209");
            jsonarr1.add(json18);

            json19.put("area_seq",77);  
            json19.put("area_name","210");
            jsonarr1.add(json19);

            json20.put("area_seq",78);  
            json20.put("area_name","211");
            jsonarr1.add(json20);

            json21.put("area_seq",79);  
            json21.put("area_name","212");
            jsonarr1.add(json21);

            json22.put("area_seq",81);  
            json22.put("area_name","303");
            jsonarr1.add(json22);

            json23.put("area_seq",82);  
            json23.put("area_name","304");
            jsonarr1.add(json23);

            json24.put("area_seq",83);  
            json24.put("area_name","305");
            jsonarr1.add(json24);

            json25.put("area_seq",84);  
            json25.put("area_name","306");
            jsonarr1.add(json25);

            json26.put("area_seq",91);  
            json26.put("area_name","101");
            jsonarr1.add(json26);

            json27.put("area_seq",200); 
            json27.put("area_name","101");
            jsonarr1.add(json27);

            json28.put("area_seq",201); 
            json28.put("area_name","202");
            jsonarr1.add(json28);

            json29.put("area_seq",202); 
            json29.put("area_name","302");
            jsonarr1.add(json29);
            
            json.put("list", jsonarr1);
        }

        String jsonStr = json.toString();
        System.out.println(jsonStr);
	    request.setAttribute("data", jsonStr);
		return "comm/json";
	}

    /* 작성일 : 2021-11-09
     * 작성자 : 이응규
     * 에이전트 등록
     * */
	@RequestMapping(value = "/api/agent/resAgent", method = {RequestMethod.GET, RequestMethod.POST})
	public String resAgent(Locale locale, Model model, HttpServletRequest request) {
		
		JSONObject inner = new JSONObject();
        inner.put("name",  "송요시"); // key는 "name", value는 "송요시"
        inner.put("gender", "여자"); // key는 "gender", value는 "여자"
        inner.put("age", "25"); // key는 "age", value는 "25"
        inner.put("address", "서울"); // key는 "address", value는 "서울"
        

        JSONObject outer = new JSONObject();
        outer.put("inf", inner);
        
        String json = outer.toString();
        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
	}

    /* 작성일 : 2021-11-09
     * 작성자 : 이응규
     * 파일 다운로드
     * */
	@RequestMapping(value = "/api/version/download", method = {RequestMethod.GET, RequestMethod.POST})
	public String download(Locale locale, Model model, HttpServletRequest request) {
		
		JSONObject inner = new JSONObject();
        inner.put("name",  "송요시"); // key는 "name", value는 "송요시"
        inner.put("gender", "여자"); // key는 "gender", value는 "여자"
        inner.put("age", "25"); // key는 "age", value는 "25"
        inner.put("address", "서울"); // key는 "address", value는 "서울"
        

        JSONObject outer = new JSONObject();
        outer.put("inf", inner);
        
        String json = outer.toString();
        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
	}

    /* 작성일 : 2021-11-09
     * 작성자 : 이응규
     * Agent Version 파일 정보
     * */
	@RequestMapping(value = "/api/version/selectTargetFile", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectTargetFile(Locale locale, Model model, HttpServletRequest request) {
		
		JSONObject inner = new JSONObject();
        inner.put("name",  "송요시"); // key는 "name", value는 "송요시"
        inner.put("gender", "여자"); // key는 "gender", value는 "여자"
        inner.put("age", "25"); // key는 "age", value는 "25"
        inner.put("address", "서울"); // key는 "address", value는 "서울"
        

        JSONObject outer = new JSONObject();
        outer.put("inf", inner);
        
        String json = outer.toString();
        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
	}

    /* 작성일 : 2021-11-09
     * 작성자 : 이응규
     * SBC List 가져오기
     * */
	@RequestMapping(value = "/getSBCList", method = {RequestMethod.GET, RequestMethod.POST})
	public String getSBCList(Locale locale, Model model, HttpServletRequest request) {
		
		JSONObject inner = new JSONObject();
        inner.put("name",  "송요시"); // key는 "name", value는 "송요시"
        inner.put("gender", "여자"); // key는 "gender", value는 "여자"
        inner.put("age", "25"); // key는 "age", value는 "25"
        inner.put("address", "서울"); // key는 "address", value는 "서울"
        

        JSONObject outer = new JSONObject();
        outer.put("inf", inner);
        
        String json = outer.toString();
        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
	}

    /* 작성일 : 2021-11-09
     * 작성자 : 이응규
     * 업데이트 리스트
     * */
	@RequestMapping(value = "/agent/updateLis", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateLis(Locale locale, Model model, HttpServletRequest request) {
		
		JSONObject inner = new JSONObject();
        inner.put("name",  "송요시"); // key는 "name", value는 "송요시"
        inner.put("gender", "여자"); // key는 "gender", value는 "여자"
        inner.put("age", "25"); // key는 "age", value는 "25"
        inner.put("address", "서울"); // key는 "address", value는 "서울"
        

        JSONObject outer = new JSONObject();
        outer.put("inf", inner);
        
        String json = outer.toString();
        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
	}
	
	
}
