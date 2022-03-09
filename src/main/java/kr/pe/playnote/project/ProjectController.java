package kr.pe.playnote.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProjectController {
    
    private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

    /* 작성일 : 2022-03-09 
     * 작성자 : 이응규
     * windRider 메인
     * */
    @RequestMapping(value = "/project/windRider", method = {RequestMethod.GET, RequestMethod.POST})
    public String getMember(Locale locale, Model model, HttpServletRequest request) {
        logger.info("project-windRider.", locale);

        String page = request.getParameter("page");
        String subMenu = request.getParameter("subMenu");
        
        System.out.println("page==>"+page);
        System.out.println("subMenu==>"+subMenu);
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        
        String formattedDate = dateFormat.format(date);
        model.addAttribute("serverTime", formattedDate );
        model.addAttribute("subMenu", subMenu );
        
        return "/project/windrider/"+page;
        
    }
}