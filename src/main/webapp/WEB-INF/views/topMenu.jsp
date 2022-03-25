<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.Locale" %>
<%@ page import="kr.pe.playnote.dto.MemberDto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
    String language = request.getParameter("language");
	MemberDto sessionInfo = (MemberDto)session.getAttribute("SESSION_INFO");
	
	String uuid = "";
	String username = "";
	String email = "";
	String logInYn = "N";
	if( sessionInfo != null){ 
	    uuid = (String)sessionInfo.getUuid();
	    username = (String)sessionInfo.getUsername();
	    email = (String)sessionInfo.getEmail();
	    logInYn = "Y";
	}
	
%>
<!-- scope 속성은 선택적이며 page로 기본 설정되어 있다.page, request, session, application -->
<c:set  var="language"  value="<%=language %>" scope="page" />
<c:set  var="logInYn"  value="<%=logInYn %>" scope="page" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
	   
        function topMenuGo(url,subMenu,page){
            switch (url){
                case "HOME" :
                    url = "/index";
                    break;
                case "BOARD_NOTICE" :
                    url = "/main/boardNotice?pagenum=1&contentnum=0";
                    break;
                case "BOARD_USER" :
                    url = "/main/boardUser";
                    break;
                case "LOGIN" :
                    url = "/main/loginForm";
                    break;
                case "LOGIN_OUT" :
                    url = "/main/loginOut";
                    break;
                case "ADMIN_NOTICE_LIST" :
                    url = "/admin/noticeList";
                    break;
                case "PROJECT_WIND_RIDER" :
                    url = "/project/windRider?page="+page+"&subMenu="+subMenu;
                    break;
                case "WEB_FRAME_VUE_MAIN" :
                    url = "/webFrame/vueMain";
                    break;
                case "JAVA_BASE_MAIN" :
                    url = "/java/base?page="+page+"&subMenu="+subMenu;
                    break;    
                    
                default :
                    url = "/";
            }
            location.href="${pageContext.request.contextPath}"+url;
        }  
        
        function topMenuLanguage(language){
        	var url = "/main/messageChange?lang="+language;
            document.topform.action  = url;                                            
            document.topform.method = "POST";
            document.topform.submit();
        }  

        //로그아웃
        function topMenu_LogOut(){
        	var data = "";
        	
             $.ajax({
                 type : "POST", //전송방식을 지정한다 (POST,GET)
                 url : "/main/loginOut",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
                 data: data, 
                 async: true,
                 dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
                 success : function(data) { 
                     console.log("========================================");
                     console.log("==== data ==>"+data);
                     console.log("==== data.msgCode ==>"+data.msgCode);
                     console.log("==== data.msgContent ==>"+data.msgContent);
                     if( data.msgCode == "SUCCESS"){
                      
                         var modal = document.getElementById("alertModalTop");
                         modal.style.display = "block";
                         $("p").text(data.msgContent);
                         setTimeout(topMenuGo, 2000,'/','');
                     }else{
                        
                         var modal = document.getElementById("alertModalTop");
                         modal.style.display = "block";
                         $("p").text(data.msgContent);
                     }
                  }, 
                  error: function(jqXHR, textStatus, errorThrown) { 
                      var modal = document.getElementById("alertModalTop");
                      modal.style.display = "block";
                      $("p").text("ajax  error");  
                  }                  
             });
        }  
        
    </script>
    <style> 
        #language_btn1{ margin-right:4px; margin-left:3px; margin-top:4px; padding: 10px 2px;}
        #language_btn2{ margin-right:4px; margin-left:3px; margin-top:4px; padding: 10px 2px;}
    </style>

    <style>
        body {
          padding-top: 40px;
          padding-bottom: 40px;
          background-color: #eee;
        }
        .div-signin {
          max-width: 330px;
          padding: 15px;
          margin: 0 auto;
        }
        .div-signin .div-signin-heading,
        .div-signin .checkbox {
          margin-bottom: 10px;
        }
        .div-signin .checkbox {
          font-weight: normal;
        }
        .div-signin .div-control {
          position: relative;
          height: auto;
          -webkit-box-sizing: border-box;
             -moz-box-sizing: border-box;
                  box-sizing: border-box;
          padding: 10px;
          font-size: 16px;
        }
        .div-signin .div-control:focus {
          z-index: 2;
        }
        .div-signin input[type="email"] {
          margin-bottom: -1px;
          border-bottom-right-radius: 0;
          border-bottom-left-radius: 0;
        }
        .div-signin input[type="password"] {
          margin-bottom: 10px;
          border-top-left-radius: 0;
          border-top-right-radius: 0;
        }
    </style>
    <form name="topform" method="post">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="javascript:topMenuGo('HOME','');">Play Note</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-left">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">HOME <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:topMenuGo('BOARD_NOTICE','');"><spring:message code="notice" text="default text" /></a></li>
                <li><a href="javascript:topMenuGo('BOARD_USER','');"><spring:message code="community" text="default text" /></a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">JAVA <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:topMenuGo('JAVA_BASE_MAIN','','page_001');">BASE</a></li>
                <li><a href="#">GUI</a></li>
                <li><a href="#">JSP</a></li>
              </ul>
            </li>
            <li><a href="#">Android</a></li>
            <li><a href="#">C#</a></li>
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Project <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','','page_001');">windRider</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">WEB FRAME<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:topMenuGo('WEB_FRAME_VUE_MAIN','');">Vue</a></li>
                <li><a href="#">React</a></li>
              </ul>
            </li>
			
          </ul>
          <ul class="nav navbar-nav navbar-right">
	            <c:if test="${language eq 'ko'}">
	                <li><button type="submit"  class="btn .btn-default" id="language_btn1" onclick="topMenuLanguage('en')">ENG</button></li>
	                <li><button type="submit"  class="btn btn-success" id="language_btn2" onclick="topMenuLanguage('ko')">KOR</button></li>
	            </c:if>
	            <c:if test="${language eq 'en'}">
		            <li><button type="submit" class="btn btn-success" id="language_btn1" onclick="topMenuLanguage('en')">ENG</button></li>
		            <li><button type="submit" class="btn .btn-default" id="language_btn2" onclick="topMenuLanguage('ko')">KOR</button></li>
	            </c:if>
            <li>
                <c:if test="${logInYn eq 'Y'}">
                    <a href="javascript:topMenu_LogOut()">LogOut</a>
                </c:if>
                <c:if test="${logInYn eq 'N'}">
                    <a href="javascript:topMenuGo('LOGIN','');">LogIn</a>
                </c:if>
            </li>
          </ul>
          <!-- Modal 창 block -->
          <div id="alertModalTop"class="alert alert-warning alert-dismissible fade in" style="display:none;">
            <a href="javascript:close();" class="close" aria-label="close"></a>
            <strong></strong><p></p>
          </div>
      </div>
    </nav>
    </form>