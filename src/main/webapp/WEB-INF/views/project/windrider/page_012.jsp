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
	          
	          <h2 class="sub-header">Project > windRider > 저장 Test</h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <h2 class="blog-post-title">저장 Test</h2>
		            <p class="blog-post-meta">March 29, 2022 by <a href="#">Wind Rider</a></p>
		            <iframe width="840" height="472" src="https://www.youtube.com/embed/EInr2qIu2OE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            <hr>
		            
                    <h3>* github url</h3>
                    <p><a href="https://github.com/kbntt/windrider-api.git">https://github.com/kbntt/windrider-api.git</a></p>
                    <p><a href="https://github.com/kbntt/windrider-react.git">https://github.com/kbntt/windrider-react.git</a></p>  
                    <hr>
                    </br>
                    
                    <h3>* 포스트맨(postman) 사이트</h3>
                    <p><a href="https://www.postman.com/">https://www.postman.com/</a></p>
                    <hr>
                    </br>
   
                    <h3>* SQL 로그출력 참고 사이트</h3>
                    <p><a href="https://www.leafcats.com/45">https://www.leafcats.com/45</a></p>
                    <hr>
                    </br>

                    <h3>* Maven 사이트</h3>
                    <p><a href="https://mvnrepository.com/">https://mvnrepository.com/</a></p>
                    <h5>
                    <pre>                  
&lt;dependency&gt;
    &lt;groupId&gt;org.bgee.log4jdbc-log4j2&lt;/groupId&gt;
    &lt;artifactId&gt;log4jdbc-log4j2-jdbc4.1&lt;/artifactId&gt;
    &lt;version&gt;1.16&lt;/version&gt;
&lt;/dependency&gt;                 
                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* application.properties 수정</h3>
                    <p><a href="https://mvnrepository.com/">https://mvnrepository.com/</a></p>
                    <h5>
                    <pre>                  
server.port=8083

spring.datasource.url=jdbc:log4jdbc:mysql://localhost:3306/windrider?serverTimezone=UTC&characterEncoding=UTF-8
spring.datasource.username=windrider
spring.datasource.password=adminpwd
spring.datasource.driverClassName=net.sf.log4jdbc.sql.jdbcapi.DriverSpy

mybatis.mapper-locations=mybatis-mapper/*.xml                
                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* log4jdbc.log4j2.properties 파일 생성</h3>
                    <h5>
                    <pre>                  
log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator

log4jdbc.dump.sql.maxlinelength=0                
                    </pre>
                    </h5>
                    <hr>
                    </br>     
                              
                    <h3>* logback.xml 파일 생성</h3>
                    <h5>
                    <pre>                  
&lt;configuration&gt;
  &lt;appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender"&gt;
    &lt;encoder&gt;
      &lt;pattern&gt;%d{yyyyMMdd HH:mm:ss.SSS} [%thread] %-3level %logger{5} - %msg %n&lt;/pattern&gt;
    &lt;/encoder&gt;
  &lt;/appender&gt;
  
  &lt;logger name="jdbc" level="OFF"/&gt;
  
  &lt;logger name="jdbc.sqlonly" level="OFF"/&gt;
  &lt;logger name="jdbc.sqltiming" level="DEBUG"/&gt;
  &lt;logger name="jdbc.audit" level="OFF"/&gt;
  &lt;logger name="jdbc.resultset" level="OFF"/&gt;
  &lt;logger name="jdbc.resultsettable" level="OFF"/&gt;
  &lt;logger name="jdbc.connection" level="OFF"/&gt;
  
  &lt;root level="INFO"&gt;
    &lt;appender-ref ref="STDOUT" /&gt;
  &lt;/root&gt;
  
&lt;/configuration&gt;             
                    </pre>
                    </h5>
                    <hr>
                    </br>              
                              
                    <h3>* MyLife.xml 파일에 저장 Sql 추가</h3>
                    <h5>
                    <pre>    
...
    &lt;insert id = "saveMyLife" parameterType = "java.util.HashMap"&gt;
    /* kr.co.windrider.MyLife.saveMyLife */
        INSERT INTO MY_LIFE ( UUID    ,IMG_URL     ,TITLE       ,CONTENTS    ,DELETE_YN   ,UPDATE_USER ,UPDATE_DATE ,CREATE_USER ,CREATE_DATE )
        VALUES(              uuid()   ,'IMG_URL'   ,&#35;{myLifeVo.title}     ,'CONTENTS'  ,'N'         ,NULL        ,NULL        ,'admin'     ,now()       )
    &lt;/insert&gt;
...          
                    </pre>
                    </h5>
                    <hr>
                    </br> 
    
                    <h3>* MyLifeServiceImple.java 파일에 저장 메소드 추가</h3>
                    <h5>
                    <pre>    
...
    @Override
    public int saveMyLife(HashMap&lt;String, Object&gt; map) {
        String sqlId = ".saveMyLife";
        int result = sqlSession.insert(namespace+sqlId, map);
        return result;
    }
...          
                    </pre>
                    </h5>
                    <hr>
                    </br> 


                    <h3>* MyLifeService.java 파일에 저장 메소드 추가</h3>
                    <h5>
                    <pre>    
...
    public int saveMyLife(HashMap&lt;String, Object&gt; map);
...          
                    </pre>
                    </h5>
                    <hr>
                    </br> 

                    <h3>* MyLifeController.java 파일에 저장 메소드 추가</h3>
                    <h5>
                    <pre>    
...    
    @PostMapping("/myLife/saveMyLife")
    public HashMap&lt;String, Object&gt; saveMyLife(@RequestBody HashMap&lt;String, Object&gt; data) {
        System.out.println("saveMyLife");
        String title = (String) data.get("title");
        MyLifeVo myLifeVo = new MyLifeVo();
        myLifeVo.setTitle(title);
        
        HashMap&lt;String, Object&gt; map = new HashMap&lt;String, Object&gt;();
        map.put("myLifeVo", myLifeVo);
        
        int result = myLifeService.saveMyLife(map);
        
        HashMap&lt;String, Object&gt; resultMap = new HashMap&lt;String, Object&gt;();
        if( 0 &lt; result  ) { resultMap.put("msg", "SUCCESS");}
        else { resultMap.put("msg", "FAIL");}
        
        return resultMap;
    }
...          
                    </pre>
                    </h5>
                    <hr>
                    </br> 
                             
                    <h3>* Culture.js 파일 수정</h3>
                    <h5>
                    <pre>    
import React from 'react';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import axios from 'axios';

const Culture = () =&gt; {
  const saveMyLife = () =&gt; {
    axios
      .post('/myLife/saveMyLife', { title: 'title02' })
      .then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
  };

  return (
    &lt;Stack spacing={2} direction="row"&gt;
      &lt;Button variant="contained" onClick={saveMyLife}&gt;
        Contained
      &lt;/Button&gt;
    &lt;/Stack&gt;
  );
};

export default Culture;     
                    </pre>
                    </h5>
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



