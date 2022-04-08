<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.Locale" %>
<%@ page import="kr.pe.playnote.dto.MemberDto" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
    String language = (String)session.getAttribute("language");
    MemberDto sessionInfo = (MemberDto)session.getAttribute("SESSION_INFO");
    
    String uuid = "";
    if( sessionInfo != null){ uuid = (String)sessionInfo.getUuid();}
    
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/image/icons_note_01_256.png">

    <title>Play Note</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/dist/css/bootstrap.min.css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/docs/examples/dashboard/dashboard.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/docs/examples/blog/blog.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${pageContext.request.contextPath}/resources/docs/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <form name="form" method="post">
        <!--/ TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU         -->
	    <jsp:include page="../../topMenu.jsp" flush="true">
		     <jsp:param name="language" value="<%= language %>"/>
		</jsp:include>
	    <!--/ TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU         -->
	    
	
	    <div class="container-fluid">
	      <div class="row">
	        <!--/ LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU         -->
	        <jsp:include page="leftMenu.jsp" flush="true">
	            <jsp:param name="language" value="<%= language %>"/>
		    </jsp:include>
	        <!--/ LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU         -->
	        
	        
	        <!--/ BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY          -->
	        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	          
	          <h2 class="sub-header">Project > windRider > 파일업로드 Spring Boot</h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <h2 class="blog-post-title">파일업로드 Spring Boot 작업</h2>
		            <p class="blog-post-meta">April 6, 2022 by <a href="#">Wind Rider</a></p>
		            <iframe width="840" height="472" src="https://www.youtube.com/embed/uC3WHQhi8H0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            <hr>
		            
                    <h3>* github url</h3>
                    <p><a href="https://github.com/kbntt/windrider-api.git">https://github.com/kbntt/windrider-api.git</a></p>
                    <p><a href="https://github.com/kbntt/windrider-react.git">https://github.com/kbntt/windrider-react.git</a></p>  
                    <hr>
                    </br>
                    
                    <h3>* github url</h3>
                    <p><a href="https://github.com/kbntt/windrider-api.git">https://github.com/kbntt/windrider-api.git</a></p>
                    <p><a href="https://github.com/kbntt/windrider-react.git">https://github.com/kbntt/windrider-react.git</a></p>  
                    <hr>
                    </br>
   
                    <h3>* 전체화면 새로고침 수정</h3>
                    <h5>
                    <pre>                  
//import Link from '@mui/material/Link';
import { Routes, Route, Link } from 'react-router-dom';              
                    </pre>
                    </h5>
                    <hr>
                    </br>

   
                    <h3>* Link 수정</h3>
                    <h5>
                    <pre>                  
          &lt;Link
            color="inherit"
            key={section.uuid}
            variant="body2"
            to={section.menuLink}
            sx={{ p: 1, flexShrink: 0 }}
          &gt;
            {section.codeName}
          &lt;/Link&gt;
                    </pre>
                    </h5>
                    <hr>
                    </br>


                    <h3>* Spring Boot 참고 사이트</h3>
                    <p><a href="https://hello-bryan.tistory.com/343">https://hello-bryan.tistory.com/343</a></p>
                    </br>
                    
                    <h3>* application.properties 파일에 파일관련 설정 추가</h3>
                    <h5>
                    <pre>                  
# upload file
spring.servlet.multipart.enabled=true
spring.servlet.multipart.file-size-threshold=2KB
spring.servlet.multipart.max-file-size=50MB
spring.servlet.multipart.max-request-size=50MB
spring.servlet.multipart.location=D:/Develop/project_windRider/windrider-api/workspace/windrider/src/main/resources/static/
                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* FileStorageService.java 파일 생성</h3>
                    <h5>
                    <pre>                  
package kr.co.windrider.comm.file;

import org.springframework.web.multipart.MultipartFile;

public interface FileStorageService {
    void init(String uploadPath);
    void upload(MultipartFile file, String uploadPath);
}              
                    </pre>
                    </h5>
                    <hr>
                    </br>     
                              
                    <h3>* FileStorageServiceImple.java 파일 생성</h3>
                    <h5>
                    <pre>                  
package kr.co.windrider.comm.file;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileStorageServiceImple implements FileStorageService {
    
    @Value(&quot;&#36;{spring.servlet.multipart.location}&quot;)
    private String springUploadPath;
    
    @Override
    public void init(String uploadPath) {
        try {
            Files.createDirectories(Paths.get(uploadPath));
        }catch(IOException e) {
            throw new RuntimeException("Could not create upload folder!");
        }
    }

    @Override
    public void upload(MultipartFile file, String uploadPath) {
        try {
            String path = springUploadPath+uploadPath;
            if(file.isEmpty()) {
                throw new Exception("ERROR : File is empty.");
            }
            Path root = Paths.get(path);
            if(!Files.exists(root)) {
                init(path);
            }
            try(InputStream inputStream = file.getInputStream()){
                Files.copy(inputStream, root.resolve(file.getOriginalFilename()),StandardCopyOption.REPLACE_EXISTING);
            }
        }catch(Exception e) {
            throw new RuntimeException("Could not store the file. Error: "+e.getMessage());
        }
        
    }

}
           
                    </pre>
                    </h5>
                    <hr>
                    </br>              
                              
                    <h3>* MyLifeController.java 파일에 파일업로드메소드 추가</h3>
                    <h5>
                    <pre>    
...

    @PostMapping("/myLife/fileUploadTest")
    public void fileUploadTest(MultipartFile file) throws Exception{
        String filePath = FilePath.MYLIFE_PATH;
        System.out.println(filePath);
        fileStorageService.upload(file, filePath);
        
    }
...          
                    </pre>
                    </h5>
                    <hr>
                    </br> 
    
                    <h3>* FilePath.java 파일 추가</h3>
                    <h5>
                    <pre>    
package kr.co.windrider.comm.file;

import java.io.File;

public class FilePath {
    public static final String MYLIFE_PATH = "file"+File.separator+"mylife"+File.separator;
}
         
                    </pre>
                    </h5>
                    <hr>
                    </br> 


                    <h3>* 파일저장 폴더 생성</h3>
                    <h5>
                    <pre>    
file\mylife          
                    </pre>
                    </h5>
                    <hr>
                    </br> 

                    <h3>Postman 에서 파일 업로드 테스트를 한다.</h3>
                    <hr>
                    <img src="${pageContext.request.contextPath}/resources/image/project/windRider/04.png"  alt="" border="10">
                    </br>
                                   
                                 
	            </table>
	          </div>
	        </div>
	        <!--/ BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY          -->
			
			<!--/ FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER               -->
		    <footer class="blog-footer">
		      <p>Blog template built for <a href="http://getbootstrap.com">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
		      <p>
		        <a href="#">Back to top</a>
		      </p>
		    </footer>
		    <!--/ FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER     FOOTER               -->
	      </div>
	    </div>
    </form>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/docs/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/docs/assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resources/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>



