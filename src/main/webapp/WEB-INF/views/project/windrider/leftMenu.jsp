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
            case "A5" :
                $("#A5").attr('class','active');
                break;
            case "A6" :
                $("#A6").attr('class','active');
                break;
            case "A7" :
                $("#A7").attr('class','active');
                break;
            case "A8" :
                $("#A8").attr('class','active');
                break;
            case "A9" :
                $("#A9").attr('class','active');
                break;
            case "A10" :
                $("#A10").attr('class','active');
                break;
            case "A11" :
                $("#A11").attr('class','active');
                break;
            case "A12" :
                $("#A12").attr('class','active');
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
                <li id="A7" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A7','page_007');">GitHub 연동</a></li>
                <li id="A5" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A5','page_005');">React MUI 적용</a></li>
                <li id="A6" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A6','page_006');">Markdown 렌더링</a></li>
                <li id="A8" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A8','page_008');">React Router 적용</a></li>
                <li id="A9" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A9','page_009');">axios 적용</a></li>
                <li id="A10" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A10','page_010');">MyLife 작업 01</a></li>
                <li id="A11" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A11','page_011');">MyLife 작업 02</a></li>
                <li id="A12" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','A12','page_012');">저장 Test</a></li>
	          </ul>
	          <!--
	          <ul class="nav nav-sidebar">
	            <li id="B1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B1');">21</a></li>
	            <li id="B2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B2');">22</a></li>
	            <li id="B3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B3');">23</a></li>
	            <li id="B4" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B4');">24</a></li>
	            <li id="B5" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B5');">25</a></li>
                <li id="B6" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B1');">26</a></li>
                <li id="B7" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B2');">27</a></li>
                <li id="B8" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B3');">28</a></li>
                <li id="B9" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B4');">29</a></li>
                <li id="B10" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B5');">30</a></li>
                <li id="B11" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B1');">31</a></li>
                <li id="B12" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B2');">32</a></li>
                <li id="B13" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B3');">33</a></li>
                <li id="B14" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B4');">34</a></li>
                <li id="B15" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B5');">35</a></li>
                <li id="B16" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B1');">36</a></li>
                <li id="B17" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B2');">37</a></li>
                <li id="B18" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B3');">38</a></li>
                <li id="B19" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B4');">39</a></li>
                <li id="B20" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','B5');">40</a></li>
	          </ul>
	          <ul class="nav nav-sidebar">
	            <li id="C1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C1');">41</a></li>
	            <li id="C2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C2');">42</a></li>
	            <li id="C3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C3');">43</a></li>
                <li id="C1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C1');">44</a></li>
                <li id="C2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C2');">45</a></li>
                <li id="C3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C3');">46</a></li>
                <li id="C1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C1');">47</a></li>
                <li id="C2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C2');">48</a></li>
                <li id="C3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C3');">49</a></li>
                <li id="C1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C1');">50</a></li>
                <li id="C2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C2');">51</a></li>
                <li id="C3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C3');">52</a></li>
                <li id="C1" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C1');">53</a></li>
                <li id="C2" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C2');">54</a></li>
                <li id="C3" class=""><a href="javascript:topMenuGo('PROJECT_WIND_RIDER','C3');">55</a></li>
	          </ul>
	            -->
	          
	        </div>