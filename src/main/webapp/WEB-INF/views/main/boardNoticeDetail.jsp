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
    
  </head>
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
        

        function fileDownload(uuid){            
            
            url = "${pageContext.request.contextPath}/com/downloadFile?uuid="+uuid; 
            
            document.form.action  = url;                                                   
            document.form.method = "POST";
            document.form.submit();
        
        }
        
        function goBoardList(){            
            
            url = "${pageContext.request.contextPath}/main/boardNotice?boardCode=BOARD_NOTICE&pagenum=1&contentnum=0";
            
            document.form.action  = url;                                                   
            document.form.method = "POST";
            document.form.submit();
        
        }
        
        
        		
    </script>
  <body>
  <form name="form" method="post">
        <!--/ TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU         -->
        <jsp:include page="../topMenu.jsp" flush="true"/>
        <!--/ TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU     TOP MENU         -->
        
        <div class="container-fluid">
          <div class="row">
            <!--/ LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU         -->
            <div class="col-sm-3 col-md-2 sidebar">
              <ul class="nav nav-sidebar">
                <li class="active"><a href="javascript:go_it('BOARD_NOTICE');"><spring:message code="notice" text="default text" /><span class="sr-only">(current)</span></a></li>
                <li><a href="javascript:go_it('BOARD_USER');"><spring:message code="community" text="default text" /></a></li>
            </div>
            <!--/ LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU         -->
            
            <!--/ BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY          -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
              <h1 class="page-header">Play Note  <img src="${pageContext.request.contextPath}/resources/image/icons_note_01_256.png" width="50" height="50" border="1" alt=""></h1>
              
              <h2 class="sub-header">공지사항</h2>
              
              
            <!--/ ============================================================================================================================================ -->
            <!--/ <div class="container"> -->
            
            <div class="table-responsive">
		        <input type="hidden" name="pageNum" value="pageNum">
		        <input type="hidden" name="articleNumber" value="article.articleNumber">
		         
		        <table class="table table-striped table-bordered">
		          <thead>
		            <tr>
		              <th width="15%" >글쓴이</th>
		              <td width="20%">${dto.createUserNm}</td>
                      <th width="15%" >작성일</th>
                      <td width="20%">${dto.createDatetimeStr}</td>
                      <th width="10%" >조회수</th>
                      <td width="20%">${dto.hits}</td>
		            </tr>
		            <tr>
		              <th>제목</th>
		              <td colspan="5">${dto.subject}</td>
		                    
		            </tr>
		          </thead>
		          <tbody>
		            <tr>
		              <td colspan="6">
		                <textarea class="form-control" rows="20" name="content" >${dto.contents}</textarea>
		              </td>
		            </tr>
		            <c:forEach items="${fileList}" var="list">
                        <tr>
	                      <th>첨부파일</th>
	                      <td colspan="5">
	                        <a href="javascript:fileDownload( '${list.uuid}'  );">
	                             ${list.storedFileName}
	                        </a>
	                      </td>
	                    </tr>
                    </c:forEach>
		          </tbody>
		        </table>
		      <div class="btn-group btn-group-sm" role="group" aria-label="...">
		        <input type="submit" class="btn btn-default" value="수정하기">
		        <input type="button" class="btn btn-default" value="목록" onclick="javascript:go_it('BOARD_NOTICE');">
		        
		      </div>
		    </div>
		           
            <!--/ ============================================================================================================================================ -->

              
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
  </body>
</html>



