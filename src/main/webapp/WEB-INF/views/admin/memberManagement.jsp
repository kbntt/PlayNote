<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script type="text/javascript">
    
	    $(document).ready(function() {
	    	
	        $("#memberModalPopup").click(function(){
	            getMember("uuid");
	        });
        });
	    
	    //멤버조회
	    function getMember(uuid){
	    	$("#memberModal").modal('show');
	    }
	    
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
        
        function search(){ 
        	var url = "/admin/getMember";
        	alert(url);
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
                <li class=""><a href="javascript:go_it('BOARD_NOTICE');">사용자관리</a></li>
            </div>
            <!--/ LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU     LEFT MENU         -->
            
            <!--/ BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY     BODY          -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            
                  권한 : &nbsp;&nbsp; 
                  <select name="selectAuth"  id="selectAuth" >
                      <option value="ALL" selected>--전체--</option>
                      <option value="AUTH_00">관리자</option>
                      <option value="AUTH_10">일반사용자</option>
                  </select>&nbsp;&nbsp;
                  구분 :&nbsp;&nbsp;
                  <select name="selectGubun" id="selectGubun"  class="selectpicker">
                      <option value="USERNAME" selected>이름</option>
                      <option value="EMAIL">이메일</option>
                      <option value="PHONE">전화번호</option>
                  </select>&nbsp;&nbsp;
                   
                 <input type="text" name="gubunInput"  id="gubunInput" value=""  placeholder=""  size="12" />&nbsp;&nbsp;
                 사용자 등록일 :&nbsp;&nbsp; 
                 <input type="text" name="dateStart" id="dateStart"  value=""  readonly  placeholder=""   size="12" />
                  <script>
                      $('#dateStart').datepicker({
                    	  format : "yyyy-mm-dd",
                    	  autoclose: true,
                    	  todayHighlight:true
                      });
                  </script>
                 &nbsp;&nbsp;~&nbsp;&nbsp; 
                 <input type="text"  name="dateEnd"  id="dateEnd" value=""  readonly placeholder=""  size="10" />
                  <script>
                      $('#dateEnd').datepicker({
                          format : "yyyy-mm-dd",
                          autoclose: true,
                          todayHighlight:true
                      });
                  </script>&nbsp;&nbsp;
                  
                  삭제 : &nbsp;&nbsp; 
                  <select name="selectDel"  id="selectDel" >
                      <option value="ALL" selected>--전체--</option>
                      <option value="Y">삭제</option>
                      <option value="N">사용</option>
                  </select>&nbsp;&nbsp;
                  
                 <button type="button"  onclick="search()" class="btn btn-primary"  btn-sm >조회</button>
                 
              <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th><spring:message code="number" text="default text" /></th><!--/ 번호 -->
                      <th><spring:message code="mag_009" text="default text" /></th><!--/ 이름 -->
                      <th><spring:message code="mag_010" text="default text" /></th><!--/ 이메일 -->
                      <th><spring:message code="mag_011" text="default text" /></th><!--/ 전화번호 -->
                      <th><spring:message code="mag_012" text="default text" /></th><!--/ 가입일 -->
                      <th><spring:message code="mag_013" text="default text" /></th><!--/ 권한 -->
                      <th><spring:message code="mag_014" text="default text" /></th><!--/ 삭제 -->
                      <th><spring:message code="mag_015" text="default text" /></th><!--/ 수정 -->
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${memberList}" var="dto">
                        <tr>
                            <td>${dto.rnum}</td>
                            <td>${dto.username}</td>
                            <td>${dto.email}</td>
                            <td>${dto.phone}</td>
                            <td>${dto.createDatetimeStr}</td>
                            <td>${dto.authName}</td>
                            <td>${dto.deleteYn}</td>
                            <td><button type="button"  name="memberModalPopup"  id= "memberModalPopup"  class="btn btn-primary" data-toggle="modal"  btn-sm><spring:message code="mag_015" text="default text" /></button></td>
                        </tr>
                    </c:forEach>    
                  </tbody>
                </table>
              </div>
		              
		  <!-- 사용자 상세,수정 -->
		  <div class="modal" id="memberModal">
		    <div class="modal-dialog modal-dialog-scrollable">
		      <div class="modal-content">
		      
		        <!-- Modal body -->
		        <div class="modal-body">
		          <div class="app-card-body">
                                <form class="settings-form">
                                    <table class="table table-dark table-hover">
									    <tbody>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">이름</label></td>
									        <td><input type="text"  id="username"  name="username"  value="" required></td>
									      </tr>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">별명</label></td>
									        <td><input type="text"  id="nickname"  name="nickname"   value="" required></td>
									      </tr>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">전화번호</label></td>
									        <td><input type="text"  id="phone"  name="phone"   value="" required></td>
									      </tr>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">이메일 인증</label></td>
									        <td><input type="text"  id="emailCert"  name="emailCert"   value="" required></td>
									      </tr>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">가입일</label></td>
									        <td><input type="text"  id="registerDatetime"  name="registerDatetime"   value="" required></td>
									      </tr>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">마지막 로그인</label></td>
									        <td><input type="text"  id="lastloginDatetime"  name="lastloginDatetime"   value="" required></td>
									      </tr>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">마지막 로그인 IP</label></td>
									        <td><input type="text"  id="lastloginIp"  name="lastloginIp"   value="" required></td>
									      </tr>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">권한</label></td>
									        <td><input type="text"  id="auth"  name="auth"   value="" required></td>
									      </tr>
									      <tr>
									        <td><label for="setting-input-1" class="form-label">삭제</label></td>
									        <td><input type="text"  id="deleteYn"  name="deleteYn"   value="" required></td>
									      </tr>
									    </tbody>
									  </table>
                                </form>
                        </div><!--//app-card-body-->
		                  
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		   <!-- The Modal -->
              
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



