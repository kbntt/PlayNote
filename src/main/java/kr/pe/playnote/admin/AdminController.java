package kr.pe.playnote.admin;


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
import javax.servlet.http.HttpServletRequestWrapper;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import kr.pe.playnote.com.Code;
import kr.pe.playnote.com.MultiFiles;
import kr.pe.playnote.com.PageMaker;
import kr.pe.playnote.com.ServletUtils;
import kr.pe.playnote.com.UtilFile;
import kr.pe.playnote.dto.AttachFileDto;
import kr.pe.playnote.dto.BoardDto;
import kr.pe.playnote.dto.MemberDto;
import kr.pe.playnote.main.MainService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    
    @Autowired
    private MainService mainService;
    
	@Autowired
    private AdminService adminService;
	
	@Autowired
	private UtilFile utilFile;
	
	// 다국어
	@Autowired SessionLocaleResolver localeResolver; 
	@Autowired MessageSource messageSource;
	
	
	

    /* 작성일 : 2021-08-22 
     * 작성자 : 이응규
     * 사용자 관리화면
     * */
	@RequestMapping(value = "/admin/getMember", method = {RequestMethod.GET, RequestMethod.POST})
	public String getMember(Locale locale, Model model, HttpServletRequest request) {
		if( !ServletUtils.aliveSession(request)){ 
            return "admin/index";
        }
		
		List<MemberDto> memberList = adminService.getMemberList(request);
		 
        model.addAttribute("memberList", memberList);
        
	    System.out.println("admin/memberManagement");
		return "admin/memberManagement";
		
	}
	
    /* 작성일 : 2021-08-22 
     * 작성자 : 이응규
     * 사용자 관리화면
     * */
	@RequestMapping(value = "/admin/memberManagement", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberManagement(Locale locale, Model model, HttpServletRequest request) {
		
	    System.out.println("admin/memberManagement");
		return "admin/memberManagement";
		
	}
	
    /* 작성일 : 2021-08-22 
     * 작성자 : 이응규
     * 관리자 메인 화면
     * */
	@RequestMapping(value = "/admin/index", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(Locale locale, Model model, HttpServletRequest request) {
		
	    System.out.println("admin/index");
		return "admin/index";
		
	}
	
    /* 작성일 : 2021-08-21 
     * 작성자 : 이응규
     * 관리자 로그인폼 화면
     * */
	@RequestMapping(value = "/admin/adminLoginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminLoginForm(Locale locale, Model model, HttpServletRequest request) {
		
	    System.out.println("admin/adminLoginForm");
		return "admin/adminLoginForm";
		
	}

    /* 작성일 : 2021-08-21 
     * 작성자 : 이응규
     * 로그인
     * */
	@RequestMapping(value = "/admin/signIn", method = {RequestMethod.GET, RequestMethod.POST})
	public String signIn(Locale locale, Model model, HttpServletRequest request) {
		
		HashMap<String, Object> hashMap = adminService.adminLoginChk(request,locale);
		String msgCode = (String)hashMap.get("msgCode");
		String msgContent = (String)hashMap.get("msgContent");
		
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
     * 공지사항 리스트
     * */
    @RequestMapping(value = "/admin/noticeList", method = {RequestMethod.GET, RequestMethod.POST})
    public String noticeList(Locale locale, Model model, HttpServletRequest request) {
        
        if( !ServletUtils.aliveSession(request)){ 
            return "index";
        }
        
        
        HashMap<String, Object> paramMap =  new HashMap<String, Object>();
        paramMap.put("BOARD_CODE", Code.BOARD_NOTICE);
        paramMap.put("PAGE_LIMIT", Code.PAGE_LIMIT_10);
        
        List<BoardDto> totalCountList = mainService.getTotalCount(paramMap);
        int totalCount = 0;
        if( totalCountList != null) {
            BoardDto dto = new BoardDto();
            for(int i =0; i <totalCountList.size(); i++) {
                dto = totalCountList.get(i);
                totalCount = dto.getTotalCount();
            }
        }
        
        PageMaker pagemaker = new PageMaker();
        // Paging Calculation
        int cpagenum = 1;        
        
        if (request.getParameter("pagenum") != null)
            cpagenum = Integer.parseInt(request.getParameter("pagenum"));

        /*---------페이지 객체에 새로운 정보 다시 지정해주는 부분------------------*/
		pagemaker.setTotalcount(totalCount);//전체 게시글 개수 지정한다
		pagemaker.setPagenum(cpagenum-1);//현재 페이지를 페이지 객체에 다시 지정해준다//몇번 페이지인지 PageMaker에 세팅한다
		pagemaker.setContentnum(Code.PAGE_LIMIT_10);//한 페이지에 몇개씩 보여줄지 세팅한다
		pagemaker.setCurrentblock(cpagenum);//현재 페이지블록이 몇번인지 현재 페이지 번호를 통해서 지정한다
		pagemaker.setLastblock(pagemaker.getTotalcount());//마지막 블록 번호를 전체 게시글 수를 통해서 정한다
		/*---------페이지 객체에 새로운 정보 다시 지정해주는 부분------------------*/
		pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표 나타낼지 결정한다
		pagemaker.setStartPage(pagemaker.getCurrentblock());//시작페이지 번호를 현재 페이지 블록으로 정한다
		pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
		//현재 블록 번호와 마지막 블록 번호를 보내서 대조하고 페이지 블록의 마지막 번호를 지정한다
        
        
        paramMap.put("PAGE_NUM", pagemaker.getPagenum()*10);
        paramMap.put("CONTENT_NUM", pagemaker.getContentnum());
        
        System.out.println("==== PAGE_NUM ===>"+pagemaker.getPagenum()*10);
        System.out.println("==== CONTENT_NUM ===>"+pagemaker.getContentnum());
        
        List<BoardDto> boardList = mainService.getPageList(paramMap);
        
        model.addAttribute("noticeList", boardList);
        model.addAttribute("page", pagemaker);//페이지 번호 객체 .jsp페이지로 전달
       
        return "admin/noticeList";
        
    }

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 공지사항 삭제
     * */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/admin/boardNoticeListDelete", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardNoticeDelete(Locale locale, Model model, HttpServletRequest request, BoardDto dto) {
        
        if( !ServletUtils.aliveSession(request)){ 
            return "index";
        }
        
        HashMap<String, List<String>> paramMap =  new HashMap<String, List<String>>();
        paramMap.put("list", dto.getListUuid());
        mainService.deleteList(paramMap);
        
        HashMap<String, Object> hm = new HashMap<String, Object>();
        hm.put("msgCode", Code.SUCCESS);
        hm.put("msgContent", messageSource.getMessage("mag_003", null, "default text", locale));
        
        JSONArray jsonArray = new JSONArray();
        jsonArray.add(new JSONObject(hm));
        
        JSONObject finalJsonObject1 = new JSONObject();
        finalJsonObject1.put("msgArray", jsonArray);
        
        String json = finalJsonObject1.toString();
	    request.setAttribute("data", json);
		return "comm/json";
        
    }

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 공지사항추가 화면
     * */
	@RequestMapping(value = "/admin/boardNoticeAddForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardNoticeAddForm(Locale locale, Model model, HttpServletRequest request) {
		
	    System.out.println("admin/boardNoticeAddForm");
		return "admin/boardNoticeAddForm";
		
	}

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 공지사항추가
     * */
	@RequestMapping(value = "/admin/boardNoticeAdd", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardNoticeAdd(@RequestParam("attach_file") MultipartFile uploadFile,
            MultipartHttpServletRequest request,Locale locale) throws Exception{

		return "comm/json";
		
		
	}

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 첨부파일추가
     * */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/admin/boardNoticeAddMult", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardNoticeAddMult(MultiFiles multiFiles,Model model,HttpServletRequest request,Locale locale) throws Exception{
		
		logger.info("=== /admin/boardNoticeAddMult ===>");

        String userUuid = request.getParameter("userUuid");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        
        
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDir = root+Code.PATH_NOTICE;
		
		logger.info("=== saveDir ===>"+saveDir);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Set<Map.Entry<String,MultipartFile>> set = multipartRequest.getFileMap().entrySet(); 
	    Iterator<Map.Entry<String, MultipartFile>> i = set.iterator(); 
	    String boardUuid =  UUID.randomUUID().toString();
        
        Date today = new Date ();
        
        while(i.hasNext()) { 
            Map.Entry<String, MultipartFile> me = (Map.Entry<String, MultipartFile>)i.next(); 
            String fileName = (String)me.getKey();
            MultipartFile file = (MultipartFile)me.getValue();
            logger.info("Original fileName - " + file.getOriginalFilename());
            logger.info("fileName - " + fileName);
            
            HashMap<String, String> map = utilFile.fileUpload(saveDir, file);
            
            String attachFileUuid =  UUID.randomUUID().toString();
            AttachFileDto attachFileDto = new AttachFileDto();
            attachFileDto.setUuid(attachFileUuid);          
            attachFileDto.setBoardUuid(boardUuid);     
            attachFileDto.setOrgFileName(file.getOriginalFilename());   
            attachFileDto.setStoredFileName(map.get("newFilename"));
            attachFileDto.setFileDirectory(map.get("path")); 
            attachFileDto.setFileSize(1);      
            attachFileDto.setCreateDatetime(today);
            attachFileDto.setCreateUser(userUuid);    
            attachFileDto.setUpdateDatetime(today);
            attachFileDto.setUpdateUser(userUuid); 
            
            HashMap<String, AttachFileDto> paramMap =  new HashMap<String, AttachFileDto>();
    		paramMap.put("ATTACH_FILE", attachFileDto);
    		
    		int result = 1;//mainService.insertAttachFile(paramMap);
    		logger.info("result - " + result);
         }
		

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
        int result = 1;//mainService.insertBoard(paramMap);
        logger.info("result - " + result);
        
        //////////////////////////////////////////////////////////////////////////

        JSONObject finalJsonObject1 = new JSONObject();
        finalJsonObject1.put("msgCode", Code.SUCCESS);
        finalJsonObject1.put("msgContent",  messageSource.getMessage("mag_003", null, "default text", locale));
        
        System.out.println(finalJsonObject1);
        String json = finalJsonObject1.toString();

        System.out.println(json);
	    request.setAttribute("data", json);
		return "comm/json";
		
	}

	

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 다국어
     * */
	@RequestMapping(value = "/admin/message", method = RequestMethod.GET) 
	public String i18n(Locale locale, HttpServletRequest request, Model model) {
	    
	    // RequestMapingHandler로 부터 받은 Locale 객체를 출력해 봅니다. 
	    logger.info("Welcome i18n! The client locale is {}.", locale); // localeResolver 로부터 Locale 을 출력해 봅니다. 
	    logger.info("Session locale is {}.", localeResolver.resolveLocale(request));
	    logger.info("site.title : {}", messageSource.getMessage("site.title", null, "default text", locale));
	    logger.info("site.count : {}", messageSource.getMessage("site.count", new String[] {"첫번째"}, "default text", locale));
	    logger.info("not.exist : {}", messageSource.getMessage("not.exist", null, "default text", locale)); //logger.info("not.exist 기본값 없음 : {}", messageSource.getMessage("not.exist", null, locale)); 
	    // JSP 페이지에서 EL 을 사용해서 arguments 를 넣을 수 있도록 값을 보낸다. 
	    model.addAttribute("siteCount", messageSource.getMessage("msg.first", null, locale)); 
	    return "admin/message";
	}

}