package kr.pe.playnote.java.base;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	@Autowired
	private SqlSession sqlSession;
	

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * JAVA base 호출
     * */
	@RequestMapping("/java/base")
	public String base(HttpServletRequest request, Model model,Locale locale) {
		logger.info("java-base.", locale);
		
		String page = request.getParameter("page");
		String subMenu = request.getParameter("subMenu");
		
		System.out.println("page==>"+page);
		System.out.println("subMenu==>"+subMenu);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("subMenu", subMenu );
		
		
		return "/java/base/"+page;
	}
	
}
