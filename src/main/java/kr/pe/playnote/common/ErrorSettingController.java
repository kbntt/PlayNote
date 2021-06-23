package kr.pe.playnote.common;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorSettingController {
    
  //  private static Logger LOGGER = (Logger) LoggerFactory.getLogger(ErrorSettingController.class);
    
    @RequestMapping("/error404")
    public String Error404(HttpServletResponse res, Model model) {
//        LOGGER.warn("========== ERROR 404 PAGE ==========");
        model.addAttribute("code", "ERROR_404");
        return "error/404";
    }
    
    @RequestMapping("/error500")
    public String Error500(HttpServletResponse res, Model model) {
//        LOGGER.warn("========== ERROR 500 PAGE ==========");
        model.addAttribute("code", "ERROR_500");
        return "error/500";
    }
}
