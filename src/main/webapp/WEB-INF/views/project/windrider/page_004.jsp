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
	          
	          <h2 class="sub-header">Project > windRider > MySql 연동</h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <h2 class="blog-post-title">MySql 연동</h2>
		            <p class="blog-post-meta">March 25, 2022 by <a href="#">Wind Rider</a></p>
		            <iframe width="840" height="472" src="https://www.youtube.com/embed/l2D-ymIOjFw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            <hr>
		            
                    
                    <h3>* github url</h3>
                    <p><a href="https://github.com/kbntt/windrider-api.git">https://github.com/kbntt/windrider-api.git</a></p>
                    <p><a href="https://github.com/kbntt/windrider-react.git">https://github.com/kbntt/windrider-react.git</a></p>  
                    <hr>
                    </br>
                    
		            <h3>* HomeController.java 파일 생성</h3>
                    <h5>
                    <pre>
                    
package kr.co.windrider.home;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import kr.co.windrider.vo.BlogVo;

@RestController
public class HomeController {
    
    @Autowired
    public HomeService homeService;

    /* github test*/
    @GetMapping("/home/getTest")
    public List<BlogVo> getTest() {
        System.out.println("getTest");
        List<BlogVo> listBlogVo = homeService.getTest();
        return listBlogVo;
        
    }    
}                   
                    </pre>
                    <h5>
                    <hr>
                    </br>
		            
		            
                    <h3>* BlogVo.java 파일 생성</h3>
                    <h5>
                    <pre>
      package kr.co.windrider.vo;

import java.util.Date;

public class BlogVo {
    
    private String uuid       ;
    private String imgUrl     ;
    private String title      ;
    private String contents   ;
    private String deleteYn   ;
    private String updateUser ;
    private Date   updateDate ;
    private String createUser ;
    private Date   createDate ;
    
    public String getUuid() {
        return uuid;
    }
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    public String getImgUrl() {
        return imgUrl;
    }
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContents() {
        return contents;
    }
    public void setContents(String contents) {
        this.contents = contents;
    }
    public String getDeleteYn() {
        return deleteYn;
    }
    public void setDeleteYn(String deleteYn) {
        this.deleteYn = deleteYn;
    }
    public String getUpdateUser() {
        return updateUser;
    }
    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }
    public Date getUpdateDate() {
        return updateDate;
    }
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    public String getCreateUser() {
        return createUser;
    }
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    
}

                    </pre>
                    <h5>
                    <hr>
                    </br>
                    
                    
                    <h3>* application.properies 파일</h3>
                    <h5>
                    <pre>
server.port=8083

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/windrider?serverTimezone=UTC&characterEncoding=UTF-8
spring.datasource.username=windrider
spring.datasource.password=adminpwd

mybatis.mapper-locations=mybatis-mapper/*.xml

                    </pre>
                    <h5>
                    <hr>
                    </br>
                    
                    <h3>* pom.xml 파일에 mybatis관련 dependency 추가</h3>
                    <h5>
                    <pre>
                    
                    
        &lt;dependency&gt; 
            &lt;groupId&gt;org.mybatis.spring.boot&lt;/groupId&gt; 
            &lt;artifactId&gt;mybatis-spring-boot-starter&lt;/artifactId&gt; 
            &lt;version&gt;2.1.3&lt;/version&gt; 
        &lt;/dependency&gt;

                    </pre>
                    <h5>
                    <hr>
                    </br>
                    
                    
                    
                    <h3>* HomeService.java 파일 생성</h3>
                    <h5>
                    <pre>
                    package kr.co.windrider.home;

import java.util.List;

import kr.co.windrider.vo.BlogVo;

public interface HomeService {
    public List<BlogVo> getTest();
}

                    </pre>
                    <h5>
                    <hr>
                    </br>
                    
                    <h3>* HomeServiceImple.java 파일 생성</h3>
                    <h5>
                    <pre>
package kr.co.windrider.home;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.windrider.vo.BlogVo;

@Service
public class HomeServiceImple implements HomeService{

    @Autowired
    private SqlSession sqlSession;
    
    private String namespace = "kr.co.windrider.home";
    
    @Override
    public List<BlogVo> getTest() {
        String sqlId = ".getTest";
        List<BlogVo> listBlog = sqlSession.selectList(namespace+sqlId, null);
        return listBlog;
    }
    
}


                    </pre>
                    <h5>
                    <hr>
                    </br>
                    
                    <h3>* Home.xml 파일 생성</h3>
                    <h5>
                    <pre>

&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;
    
&lt;mapper namespace="kr.co.windrider.home"&gt;
    &lt;!-- test --&gt;
    &lt;select id = "getTest" parameterType = "java.util.HashMap" resultType = "kr.co.windrider.vo.BlogVo"&gt;
        /* kr.co.windrider.home.getTest */
        SELECT  UUID     
               ,IMG_URL  
               ,TITLE    
               ,CONTENTS    
               ,DELETE_YN   
               ,UPDATE_USER 
               ,UPDATE_DATE 
               ,CREATE_USER 
               ,CREATE_DATE 
        FROM    blog
    &lt;/select&gt;
                    </pre>
                    <h5>
                    <hr>
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



