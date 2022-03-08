package kr.pe.playnote.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import kr.pe.playnote.com.Code;
import kr.pe.playnote.com.ComService;
import kr.pe.playnote.dto.BoardDto;
import kr.pe.playnote.dto.MemberDto;
import kr.pe.playnote.main.MainService;

@Service
public class AdminServiceImple  implements AdminService{

	@Autowired
	private SqlSession sqlSession;

	@Autowired
    private ComService memberService;

    @Autowired 
    MessageSource messageSource;
    
	private String memberSpace = "kr.pe.playnote.com.dao.IMemberdDao";
    

    /* 작성일 : 2021-08-23
     * 작성자 : 이응규
     * 멤버 리스트
     * */
    @Override
    public List<MemberDto> getMemberList( HttpServletRequest request ) {
        
        String selectAuth = request.getParameter("selectAuth");
        String selectGubun = request.getParameter("selectGubun");
        String gubunInput = request.getParameter("gubunInput");
        String dateStart = request.getParameter("dateStart");
        String dateEnd = request.getParameter("dateEnd");
        String selectDel = request.getParameter("selectDel");
        
        
        HashMap<String, Object> paramMap =  new HashMap<String, Object>();
        //권한
        if( selectAuth != null) {
            if( !"ALL".equals(selectAuth) ) { paramMap.put("AUTH", selectAuth);  }
            else {}
        }
        //구분
        if( selectGubun != null && !"".equals(gubunInput) ) {
            if( "USERNAME".equals(selectGubun)  ) { paramMap.put("USERNAME", gubunInput);  }
            else if( "EMAIL".equals(selectGubun) ) { paramMap.put("EMAIL", gubunInput);  }
            else if( "PHONE".equals(selectGubun) ) { paramMap.put("PHONE", gubunInput);  }
        }
        //등록일
        if( dateStart != null && dateEnd != null && !"".equals(dateStart) &&  !"".equals(dateEnd) ) {
            paramMap.put("DATE_START", dateStart);
            paramMap.put("DATE_END", dateEnd);
        }
        //등록일
        if( selectDel != null  && !"".equals(selectDel)  && !"ALL".equals(selectDel)  ) {
            paramMap.put("DELETE_YN", selectDel);
        }
        
        String sqlId = ".list";
        String sql = sqlSession.getConfiguration().getMappedStatement(memberSpace+sqlId).getBoundSql(paramMap).getSql();
        System.out.println("==== getBoardList ====");
        System.out.println(sql);
        
       
        
        List<MemberDto> listDto = sqlSession.selectList(memberSpace+sqlId, paramMap);
        for(int i =0; i < listDto.size(); i++) {
        	MemberDto dto = listDto.get(i);
        	System.out.println("==== Email ===="+dto.getEmail());
        }
        return listDto;
    }
	
    /* 작성일 : 2021-08-21 
     * 작성자 : 이응규
     * 로그인 체크
     * */
	@Override
    public HashMap<String, Object> adminLoginChk(HttpServletRequest request, Locale locale) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("EMAIL", email);
		paramMap.put("PASSWORD", password);
		
		String sqlId = ".adminLoginChk";
		String sql = sqlSession.getConfiguration().getMappedStatement(memberSpace+sqlId).getBoundSql(paramMap).getSql();
		System.out.println("==== adminLoginChk ====");
	    System.out.println(sql);	    
	    MemberDto dto = sqlSession.selectOne(memberSpace+sqlId, paramMap);
	    HashMap<String, Object> hashMap =  loginDetail(request, paramMap, dto, locale);
	    
       return hashMap;
    }

    /* 작성일 : 2021-08-21 
     * 작성자 : 이응규
     * 로그인 체크
     * */
	@Override
    public HashMap<String, Object> loginDetail( HttpServletRequest request, HashMap<String, Object> paramMap, MemberDto dto, Locale locale  ) {
    	
    	String msgCode = "";
    	String msgContent = "";
    	
    	if( dto != null) {
    		if("Y".equals(dto.getEmailChk()) && "Y".equals(dto.getLoginChk())) {
    			msgCode = "SUCCESS";
    			MemberDto memberDto = memberService.detail(paramMap);
    			HttpSession session = request.getSession(true);
    			session.setAttribute(Code.SESSION_INFO, memberDto);
    			
    		}else if("Y".equals(dto.getEmailChk()) && "N".equals(dto.getLoginChk())) {
    		    msgCode = "FAIL";
    		    msgContent =  messageSource.getMessage("mag_001", null, "default text", locale);
    		}else {
                msgCode = "FAIL";
                msgContent = messageSource.getMessage("mag_002", null, "default text", locale);
    		}
    	}else {
    		msgCode = "FAIL";
    		msgContent = messageSource.getMessage("mag_002", null, "default text", locale);
    	}
    	HashMap<String, Object> returnMap =  new HashMap<String, Object>();
    	returnMap.put("msgCode", msgCode);
    	returnMap.put("msgContent", msgContent);
		return returnMap;
	}
}
