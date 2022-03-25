<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<% 
    String subMenu = request.getParameter("subMenu");
    System.out.println("leftmenu.jsp subMenu ==>"+subMenu);    

%>
<!-- scope 속성은 선택적이며 page로 기본 설정되어 있다.page, request, session, application -->
<c:set  var="subMenu"  value="<%=subMenu %>" scope="page" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	$(document).ready(function(){
        var subMenu = '<c:out value="${subMenu}"/>';

        switch (subMenu){
	        case "A1" :
	        	$("#A1").attr('class','active');
	            break;
	        case "A2" :
	        	$("#A2").attr('class','active');
	            break;
	        case "A3" :
	        	$("#A3").attr('class','active');
	            break;
	        case "A4" :
	        	$("#A4").attr('class','active');
	            break;
            case "B1" :
                $("#B1").attr('class','active');
                break;
            case "B2" :
                $("#B2").attr('class','active');
                break;
            case "B3" :
                $("#B3").attr('class','active');
                break;
            case "B4" :
                $("#B4").attr('class','active');
                break;
            case "B5" :
                $("#B5").attr('class','active');
                break;
            case "C1" :
                $("#C1").attr('class','active');
                break;
            case "C2" :
                $("#C2").attr('class','active');
                break;
            case "C3" :
                $("#C3").attr('class','active');
                break;
	            
	        default :
	            
	    } 
	});
</script>
	        <div class="col-sm-3 col-md-2 sidebar">
	          <ul class="nav nav-sidebar">
	            <li id="A1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A1','page_001');">이프로젝트는...</a></li>
	            <li id="A2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A2','page_002');">Spring Boot 설치</a></li>
	            <li id="A3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A3','page_003');">MySql DB 생성</a></li>
	            <li id="A4" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A4','page_004');">MySql 연동</a></li>
	          </ul>
	          <!--
	          <ul class="nav nav-sidebar">
	            <li id="B1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B1');">21</a></li>
	            <li id="B2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B2');">22</a></li>
	            <li id="B3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B3');">23</a></li>
	            <li id="B4" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B4');">24</a></li>
	            <li id="B5" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B5');">25</a></li>
	          </ul>
	          <ul class="nav nav-sidebar">
	            <li id="C1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C1');">31</a></li>
	            <li id="C2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C2');">32</a></li>
	            <li id="C3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C3');">33</a></li>
	          </ul>
	            -->
	          
	        </div>