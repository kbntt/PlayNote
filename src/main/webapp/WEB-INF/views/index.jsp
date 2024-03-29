<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.Locale" %>
<%@ page import="kr.pe.playnote.dto.MemberDto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${pageContext.request.contextPath}/resources/docs/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript">
	
	    function go_it(url){
	        switch (url){
		        case "HOME" :
	                url = "/";
	                break;
	            case "BOARD_NOTICE" :
	                url = "/main/boardNotice?boardCode=BOARD_NOTICE&pagenum=1&contentnum=0";
	                break;
	            case "BOARD_USER" :
	                url = "/main/boardUser?boardCode=BOARD_USER&pagenum=1&contentnum=0";
	                break;

	            case "PASSWORD_TEST" :
	                url = "/main/passwordTest";
	                break;
	            default :
	                url = "/";
	        }
	        //alert(url);
	        document.form.action  = url;                                                   
	        document.form.method = "POST";
	        document.form.submit();
	    }  
	    
	</script>
	
  </head>
      
        <!--/ TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU         -->
	    <jsp:include page="topMenu.jsp" flush="true">
		     <jsp:param name="language" value="<%= language %>"/>
		</jsp:include>
	    <!--/ TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU         -->
	    
        <form name="form" method="post">
	    <div class="container-fluid">
	      <div class="row">
	        <!--/ LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU         -->
	        <div class="col-sm-3 col-md-2 sidebar">
	          <ul class="nav nav-sidebar">
	            <li class=""><a href="javascript:go_it('BOARD_NOTICE');"><spring:message code="notice" text="default text" /></a></li>
                <li><a href="javascript:go_it('BOARD_USER');"><spring:message code="community" text="default text" /></a></li>
                <li><a href="javascript:go_it('PASSWORD_TEST');">비밀번호테스트</a></li>
	        </div>
	        <!--/ LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU         -->
	        
	        <!--/ BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY          -->
	        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	          <h1 class="page-header">Play Note  <img src="${pageContext.request.contextPath}/resources/image/icons_note_01_256.png" width="50" height="50" border="1" alt=""></h1>
	          
	          <div class="jumbotron" style="background-image: URL(${pageContext.request.contextPath}/resources/image/header_bg.jpg) ;">
		        <h1>My life is a wind.</h1>
		        <p>Come empty, return empty. I only exist in people's memories.</p>
		      </div>
	          <h2 class="sub-header"><a href="javascript:go_it('BOARD_NOTICE');"><spring:message code="notice" text="default text" /></a></h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th><spring:message code="number" text="default text" /></th>
	                  <th><spring:message code="writer" text="default text" /></th>
	                  <th><spring:message code="title" text="default text" /></th>
	                  <th><spring:message code="hit" text="default text" /></th>
	                  <th><spring:message code="create_date" text="default text" /></th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${noticeList}" var="dto">
						<tr>
							<td>${dto.rnum}</td>
							<td>${dto.createUserNm}</td>
							<td>${dto.subject}</td>
							<td>${dto.hits}</td>
							<td>${dto.createDatetimeStr}</td>
						</tr>
					</c:forEach>
	              </tbody>
	            </table>
	          </div>
	          
	          <h2 class="sub-header"><a href="javascript:go_it('BOARD_USER');"><spring:message code="community" text="default text" /></a></h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <thead>
	                <tr>
                      <th><spring:message code="number" text="default text" /></th>
                      <th><spring:message code="writer" text="default text" /></th>
                      <th><spring:message code="title" text="default text" /></th>
                      <th><spring:message code="hit" text="default text" /></th>
                      <th><spring:message code="create_date" text="default text" /></th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${userList}" var="dto">
						<tr>
							<td>${dto.rnum}</td>
							<td>${dto.createUserNm}</td>
							<td>${dto.subject}</td>
							<td>${dto.hits}</td>
							<td>${dto.createDatetimeStr}</td>
						</tr>
					</c:forEach>
	              </tbody>
	            </table>
	          </div>
	          
	        </div>
	        <!--/ BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY          -->
	        
	      </div>
	    </div>
    </form>
    <!--  ============================= Bootstrap core JavaScript  ============================= -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/docs/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/docs/assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resources/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</html>



