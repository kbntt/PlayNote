package kr.pe.playnote.main;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import kr.pe.playnote.com.Code;
import kr.pe.playnote.com.ComService;
import kr.pe.playnote.com.MultiFiles;
import kr.pe.playnote.com.PageMaker;
import kr.pe.playnote.com.UtilFile;
import kr.pe.playnote.dto.AttachFileDto;
import kr.pe.playnote.dto.BoardDto;
import kr.pe.playnote.dto.MemberDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
    private MainService boardService;

	@Autowired
    private ComService memberService;
	
	@Autowired
    private ComService comService;
	
    @Autowired SessionLocaleResolver localeResolver; 
    @Autowired MessageSource messageSource;

	@Autowired
	private UtilFile utilFile;
	
    /* 작성일 : 2021-04-13
     * 작성자 : 이응규
     * 회원저장
     * */
	@RequestMapping(value = "/main/memberSave", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberSave(Locale locale, Model model, HttpServletRequest request, MemberDto dto) {
		
		String email      = dto.getEmail();
		String password = dto.getPassword();
		String username = dto.getUsername();
		String uuid =  UUID.randomUUID().toString();
		
		dto.setUuid(uuid);
		dto.setCreateUser(email);
		
		logger.info("email["+email+"]  password["+password+"]  username["+username+"]  ");
		
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("EMAIL", email);
		
		int result = memberService.memberSave(dto);
		String msgCode = "";
		String msgContent = "";
		
		if( result == 1) {
			
			msgCode = "SUCCESS";
			MemberDto memberDto = memberService.detail(paramMap);
			HttpSession session = request.getSession(true);
			session.setAttribute(Code.SESSION_INFO, memberDto);
			
		
		}else {
            msgCode = "FAIL";
            msgContent = messageSource.getMessage("mag_004", null, "default text", locale);
        }
		
        JSONObject jsonObject1 = new JSONObject(); // 중괄호에 들어갈 속성 정의 { "a" : "1", "b" : "2" }
        JSONArray jsonArray1 = new JSONArray(); // 대괄호 정의 [{ "a" : "1", "b" : "2" }]
        JSONObject finalJsonObject1 = new JSONObject(); // 중괄호로 감싸 대괄호의 이름을 정의함 { "c" : [{  "a" : "1", "b" : "2" }] }
        
        
        finalJsonObject1.put("msgCode", msgCode);
        finalJsonObject1.put("msgContent", msgContent);
        
        String json = finalJsonObject1.toString();

        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
		
	}
    
    /* 작성일 : 2021-04-12
     * 작성자 : 이응규
     * 이메일 중복 검사
     * */
	@RequestMapping(value = "/main/emailDuplicateCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String emailDuplicateCheck(Locale locale, Model model, HttpServletRequest request) {
		
		String email = request.getParameter("email");
		logger.info("email["+email+"]  ");
		
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("EMAIL", email);
		
		MemberDto dto = memberService.emailDuplicateCheck(paramMap);
		String msgCode = "";
		String msgContent = "";
		
		if( dto != null) {
			if("N".equals(dto.getEmailChk()) ) {
				msgCode = "SUCCESS";
				MemberDto memberDto = memberService.detail(paramMap);
				HttpSession session = request.getSession(true);
				session.setAttribute(Code.SESSION_INFO, memberDto);
				
			}else {
	            msgCode = "FAIL";
	            msgContent = messageSource.getMessage("mag_005", null, "default text", locale);
			}
		}else {
			msgCode = "FAIL";
			msgContent = messageSource.getMessage("mag_005", null, "default text", locale);
		}
		
        JSONObject jsonObject1 = new JSONObject(); // 중괄호에 들어갈 속성 정의 { "a" : "1", "b" : "2" }
        JSONArray jsonArray1 = new JSONArray(); // 대괄호 정의 [{ "a" : "1", "b" : "2" }]
        JSONObject finalJsonObject1 = new JSONObject(); // 중괄호로 감싸 대괄호의 이름을 정의함 { "c" : [{  "a" : "1", "b" : "2" }] }
        
        
        finalJsonObject1.put("msgCode", msgCode);
        finalJsonObject1.put("msgContent", msgContent);
        
        String json = finalJsonObject1.toString();

        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
		
	}
	
    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 회원가입 화면
     * */
	@RequestMapping(value = "/main/registerForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String registerForm(Locale locale, Model model,HttpServletRequest request) {
		
		return "main/registerForm";
		
	}
	
    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 홈화면
     * */
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model model,HttpServletRequest request) {
	    
	    logger.info("home locale.toString {}.", locale.toString());
	    HttpSession session = request.getSession();
	    String language = locale.getLanguage();
	    
	    session.setAttribute("language", language);
	    
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("BOARD_CODE", Code.BOARD_NOTICE);
		
		List<BoardDto> boardList = boardService.getBoardList(paramMap);
        model.addAttribute("noticeList", boardList);
        
        HashMap<String, Object> userMap =  new HashMap<String, Object>();
        userMap.put("BOARD_CODE", Code.BOARD_USER);
        List<BoardDto> userList = boardService.getBoardList(userMap);
        model.addAttribute("userList", userList);
        
		return "index";
	}

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 홈화면
     * */
	@RequestMapping(value = "/index", method = {RequestMethod.GET, RequestMethod.POST})
	public String index(Locale locale, Model model,HttpServletRequest request) {
	    
	    logger.info("home locale.toString {}.", locale.toString());
	    HttpSession session = request.getSession();
	    String language = locale.getLanguage();
	    
	    session.setAttribute("language", language);
	    
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("BOARD_CODE", Code.BOARD_NOTICE);
		
		List<BoardDto> boardList = boardService.getBoardList(paramMap);
        model.addAttribute("noticeList", boardList);
        
        HashMap<String, Object> userMap =  new HashMap<String, Object>();
        userMap.put("BOARD_CODE", Code.BOARD_USER);
        List<BoardDto> userList = boardService.getBoardList(userMap);
        model.addAttribute("userList", userList);
        
		return "index";
	}
	
    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 비밀번호 암호화 테스트
     * */
   @RequestMapping(value = "/main/passwordTest", method = {RequestMethod.GET, RequestMethod.POST})
   public String passwordTest(Locale locale, Model model,HttpServletRequest request) {
       
//	   String raw = "1111";
//	   MessageDigest md = MessageDigest.getInstance("SHA-256");
//	   md.update(raw.getBytes());
//	   String hex = String.format("%064x", new BigInteger(1, md.digest()));
//	   
//       logger.info("Welcome i18n! The client locale is {}.", locale); // localeResolver �κ��� Locale �� ����� ���ϴ�. 
//       logger.info("locale.toString {}.", locale.toString()); // localeResolver �κ��� Locale �� ����� ���ϴ�.
//       logger.info("Session locale is {}.", localeResolver.resolveLocale(request));
//       logger.info("site.title : {}", messageSource.getMessage("site.title", null, "default text", locale));
//       logger.info("site.count : {}", messageSource.getMessage("site.count", new String[] {"ù��°"}, "default text", locale));
//       logger.info("not.exist : {}", messageSource.getMessage("not.exist", null, "default text", locale)); //logger.info("not.exist �⺻�� ���� : {}", messageSource.getMessage("not.exist", null, locale)); 
//        
//       model.addAttribute("siteCount", messageSource.getMessage("msg.first", null, locale)); 
       return "index";

   }

   /* 작성일 : 2021-04-03
    * 작성자 : 이응규
    * 언어 바꾸기
    * */
    @RequestMapping(value = "/main/messageChange", method = {RequestMethod.GET, RequestMethod.POST})
    public String messageChange(Locale locale, Model model,HttpServletRequest request) {
        
        logger.info("Welcome i18n! The client locale is {}.", locale);  
        logger.info("locale.toString {}.", locale.toString());
        logger.info("Session locale is {}.", localeResolver.resolveLocale(request));
        logger.info("site.title : {}", messageSource.getMessage("site.title", null, "default text", locale));
        logger.info("site.count : {}", messageSource.getMessage("site.count", new String[] {""}, "default text", locale));
        logger.info("not.exist : {}", messageSource.getMessage("not.exist", null, "default text", locale)); 
         
        model.addAttribute("siteCount", messageSource.getMessage("msg.first", null, locale)); 
        return "redirect:/index";

    }
    
    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 공지사항 게시판
     * */
	@RequestMapping(value = "/main/boardNotice", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardNotice(Locale locale, Model model,HttpServletRequest request, BoardDto dto) {
		
		logger.info("dto.getBoardCode()["+dto.getBoardCode()+"]    ");
		
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("BOARD_CODE", dto.getBoardCode());
		paramMap.put("PAGE_LIMIT", Code.PAGE_LIMIT_10);
		
		List<BoardDto> totalCountList = boardService.getTotalCount(paramMap);
		int totalCount = 0;
		if( totalCountList != null) {
			BoardDto dto1 = new BoardDto();
			for(int i =0; i <totalCountList.size(); i++) {
				dto1 = totalCountList.get(i);
				totalCount = dto1.getTotalCount();
			}
		}
		
		PageMaker pagemaker = new PageMaker();
		// Paging Calculation
        int cpagenum = 1;        
        
        if (request.getParameter("pagenum") != null)
        	cpagenum = Integer.parseInt(request.getParameter("pagenum"));
        pagemaker.setTotalcount(totalCount);
        pagemaker.setPagenum(cpagenum-1);
        pagemaker.setContentnum(Code.PAGE_LIMIT_10);
        pagemaker.setCurrentblock(cpagenum);
        pagemaker.setLastblock(pagemaker.getTotalcount());
        
        pagemaker.prevnext(cpagenum);
        pagemaker.setStartPage(pagemaker.getCurrentblock());
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        
		
		paramMap.put("PAGE_NUM", pagemaker.getPagenum()*10);
		paramMap.put("CONTENT_NUM", pagemaker.getContentnum());
		
		System.out.println("==== PAGE_NUM ===>"+pagemaker.getPagenum()*10);
		System.out.println("==== CONTENT_NUM ===>"+pagemaker.getContentnum());
		
		List<BoardDto> boardList = boardService.getPageList(paramMap);
		
        model.addAttribute("noticeList", boardList);
        model.addAttribute("page", pagemaker);
        model.addAttribute("boardCode", dto.getBoardCode());
		return "main/boardNotice";
		
	}

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 커뮤니티 게시판
     * */
	@RequestMapping(value = "/main/boardUser", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardUser(Locale locale, Model model,HttpServletRequest request, BoardDto dto) {
		
		logger.info("dto.getBoardCode()["+dto.getBoardCode()+"]    ");
		
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("BOARD_CODE", dto.getBoardCode());
		paramMap.put("PAGE_LIMIT", Code.PAGE_LIMIT_10);
		
		List<BoardDto> totalCountList = boardService.getTotalCount(paramMap);
		int totalCount = 0;
		if( totalCountList != null) {
			BoardDto dto1 = new BoardDto();
			for(int i =0; i <totalCountList.size(); i++) {
				dto1 = totalCountList.get(i);
				totalCount = dto1.getTotalCount();
			}
		}
		
		PageMaker pagemaker = new PageMaker();
		// Paging Calculation
        int cpagenum = 1;        
        
        if (request.getParameter("pagenum") != null)
        	cpagenum = Integer.parseInt(request.getParameter("pagenum"));
        pagemaker.setTotalcount(totalCount);
        pagemaker.setPagenum(cpagenum-1);
        pagemaker.setContentnum(Code.PAGE_LIMIT_10);
        pagemaker.setCurrentblock(cpagenum);
        pagemaker.setLastblock(pagemaker.getTotalcount());
        
        pagemaker.prevnext(cpagenum);
        pagemaker.setStartPage(pagemaker.getCurrentblock());
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        
		
		paramMap.put("PAGE_NUM", pagemaker.getPagenum()*10);
		paramMap.put("CONTENT_NUM", pagemaker.getContentnum());
		
		System.out.println("==== PAGE_NUM ===>"+pagemaker.getPagenum()*10);
		System.out.println("==== CONTENT_NUM ===>"+pagemaker.getContentnum());
		
		List<BoardDto> boardList = boardService.getPageList(paramMap);
		
        model.addAttribute("noticeList", boardList);
        model.addAttribute("page", pagemaker);
        model.addAttribute("boardCode", dto.getBoardCode());
		return "main/boardUser";
		
	}

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 공지사항 상세
     * */
	@RequestMapping(value = "/main/boardNoticeDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardNoticeDetail(Locale locale, Model model,HttpServletRequest request) {
		
		String uuid = request.getParameter("uuid");
		
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("UUID", uuid);
		
		BoardDto dto1 = boardService.getNoticeDetail(paramMap);//조회수 증가를 위한 데이타 조회
		int addHits = dto1.getHits()+1;
		paramMap.put("hits", addHits);
		boardService.updateHits(paramMap);//조회수 증가
		
		//상세조회
		BoardDto dto = boardService.getNoticeDetail(paramMap);
		
		HashMap<String, Object> attachParamMap =  new HashMap<String, Object>();
		attachParamMap.put("BOARD_UUID", uuid);
		//첨부파일 조회
		List<AttachFileDto> fileList = boardService.getAttachFile(attachParamMap);
		
        model.addAttribute("dto", dto);
        model.addAttribute("fileList", fileList);

		return "main/boardNoticeDetail";
		
	}

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 공지사항 작성폼
     * */
	@RequestMapping(value = "/main/boardNoticeWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardNoticeWrite(Locale locale, Model model,HttpServletRequest request, BoardDto dto) {
		
		logger.info("dto.getBoardCode()["+dto.getBoardCode()+"]    ");
		
        model.addAttribute("dto", dto);
        String url = "";
        if(comService.sessionChk(request)) {
        	url =  "main/boardNoticeWrite";
        }else {
        	
        	model.addAttribute("message", messageSource.getMessage("mag_007", null, "default text", locale));
        	url =  "comm/message";
        }
        
		return url;
		
	}
	
    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 공지사항 저장
     * */
	@RequestMapping(value = "/main/boardNoticeAddMult", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardNoticeAddMult(MultiFiles multiFiles,Model model,HttpServletRequest request,Locale locale) {
		
		logger.info("===== 공지사항 저장 =====");
		
				
		//로그인 체크
		if(!comService.sessionChk(request)) {
	        model.addAttribute("message", messageSource.getMessage("mag_007", null, "default text", locale));
	        return "comm/message";
		}
		
		//==== 공지사항 저장    공지사항 저장    공지사항 저장    공지사항 저장 ====
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
		
        HttpSession session = request.getSession(true);
		MemberDto sessionInfo = (MemberDto)session.getAttribute("SESSION_INFO");
	    
	    String userUuid = "";
	    if( sessionInfo != null){ 
	    	userUuid = (String)sessionInfo.getUuid();
	    }
	    
		String boardUuid =  UUID.randomUUID().toString();
		 Date today = new Date ();
		 
		BoardDto boardDto = new BoardDto();
        boardDto.setUuid(boardUuid);
        boardDto.setBoardCode(Code.BOARD_NOTICE);
        boardDto.setUserId(userUuid);
        boardDto.setSubject(subject);
        boardDto.setContents(content);
        boardDto.setCreateDatetime(today);
        boardDto.setCreateUser(userUuid);
        boardDto.setUpdateDatetime(today);
        boardDto.setUpdateUser(userUuid);
        
        
		HashMap<String, BoardDto> paramMap =  new HashMap<String, BoardDto>();
		paramMap.put("BOARD", boardDto);
		
		boardService.insertBoard(paramMap);
		
		//==== 공지사항 저장    공지사항 저장    공지사항 저장    공지사항 저장 ====
		
		//==== 첨부파일 저장    첨부파일 저장    첨부파일 저장    첨부파일 저장 ====
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDir = root+Code.PATH_NOTICE;
		
		System.out.println("=== saveDir ===>"+saveDir);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Set<Map.Entry<String,MultipartFile>> set = multipartRequest.getFileMap().entrySet(); 
	    Iterator<Map.Entry<String, MultipartFile>> i = set.iterator(); 
	    
	    
        while(i.hasNext()) { 
            Map.Entry<String, MultipartFile> me = (Map.Entry<String, MultipartFile>)i.next(); 
            String fileName = (String)me.getKey();
            MultipartFile file = (MultipartFile)me.getValue();
            System.out.println("Original fileName - " + file.getOriginalFilename());
            System.out.println("fileName - " + fileName);
            HashMap<String, String> map = utilFile.fileUpload(saveDir, file);
            
            String attachFileUuid =  UUID.randomUUID().toString();
            AttachFileDto attachFileDto = new AttachFileDto();
            attachFileDto.setUuid(attachFileUuid);          
            attachFileDto.setBoardUuid(boardUuid);     
            attachFileDto.setOrgFileName(file.getOriginalFilename());   
            attachFileDto.setStoredFileName(map.get("newFilename"));
            attachFileDto.setFileDirectory(map.get("path")); 
            attachFileDto.setFileSize(file.getSize());      
            attachFileDto.setCreateDatetime(today);
            attachFileDto.setCreateUser((String)sessionInfo.getUuid());    
            attachFileDto.setUpdateDatetime(today);
            attachFileDto.setUpdateUser((String)sessionInfo.getUuid()); 
            
            HashMap<String, AttachFileDto> attachParamMap =  new HashMap<String, AttachFileDto>();
            attachParamMap.put("ATTACH_FILE", attachFileDto);
    		
    		int result = boardService.insertAttachFile(attachParamMap);
    		logger.info("result - " + result);
        }
        //==== 첨부파일 저장    첨부파일 저장    첨부파일 저장    첨부파일 저장 ====
        
        //==== 메세지 세팅    메세지 세팅    메세지 세팅    메세지 세팅    ====  
        String msgCode = "SUCCESS";
		JSONObject jsonObject = new JSONObject(); // 중괄호로 감싸 대괄호의 이름을 정의함 { "c" : [{  "a" : "1", "b" : "2" }] }
		jsonObject.put("msgCode", msgCode);
		String json = jsonObject.toString();
		request.setAttribute("data", json);		
        //==== 메세지 세팅    메세지 세팅    메세지 세팅    메세지 세팅    ====
        
		return "comm/json";
		
	}

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 로그인폼 화면
     * */
	@RequestMapping(value = "/main/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(Locale locale, Model model, HttpServletRequest request) {
		
	    System.out.println("main/loginForm");
		return "main/loginForm";
		
	}

	/* 작성일 : 2021-08-03 
     * 작성자 : 이응규
     * 로그아웃
     * */
	@RequestMapping(value = "/main/loginOut", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginOut(Locale locale, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		session.removeAttribute(Code.SESSION_INFO);
		String msgCode = "";
		String msgContent = "";
		msgCode = "SUCCESS";

		msgContent =  messageSource.getMessage("mag_006", null, "default text", locale);
		
        JSONObject jsonObject1 = new JSONObject(); // 중괄호에 들어갈 속성 정의 { "a" : "1", "b" : "2" }
        JSONArray jsonArray1 = new JSONArray(); // 대괄호 정의 [{ "a" : "1", "b" : "2" }]
        JSONObject finalJsonObject1 = new JSONObject(); // 중괄호로 감싸 대괄호의 이름을 정의함 { "c" : [{  "a" : "1", "b" : "2" }] }
        
        
        finalJsonObject1.put("msgCode", msgCode);
        finalJsonObject1.put("msgContent", msgContent);
        
        System.out.println(finalJsonObject1);
        
        String json = finalJsonObject1.toString();

        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
		
	}
	
    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 로그인
     * */
	@RequestMapping(value = "/main/signIn", method = {RequestMethod.GET, RequestMethod.POST})
	public String signIn(Locale locale, Model model, HttpServletRequest request) {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("email["+email+"]   password["+password+"]   ");
		
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("EMAIL", email);
		paramMap.put("PASSWORD", password);
		
		MemberDto dto = memberService.loginChk(paramMap);
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
		
        JSONObject jsonObject1 = new JSONObject(); // 중괄호에 들어갈 속성 정의 { "a" : "1", "b" : "2" }
        JSONArray jsonArray1 = new JSONArray(); // 대괄호 정의 [{ "a" : "1", "b" : "2" }]
        JSONObject finalJsonObject1 = new JSONObject(); // 중괄호로 감싸 대괄호의 이름을 정의함 { "c" : [{  "a" : "1", "b" : "2" }] }
        
        
        finalJsonObject1.put("msgCode", msgCode);
        finalJsonObject1.put("msgContent", msgContent);
        
        System.out.println(finalJsonObject1);
        
        String json = finalJsonObject1.toString();

        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
		
	}
	
	@RequestMapping(value = "/mysqlTest", method = RequestMethod.GET)
	public String mysqlTest(Locale locale, Model model) {

		return "mysqlTest";
	}
	
	
}