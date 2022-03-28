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
	          
	          <h2 class="sub-header">Project > windRider > React Router 적용</h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <h2 class="blog-post-title">React Router 적용</h2>
		            <p class="blog-post-meta">March 28, 2022 by <a href="#">Wind Rider</a></p>
		            <iframe width="840" height="472" src="https://www.youtube.com/embed/n1rfXTtRe1E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            <hr>
		            
		            <h3>* React-router 사이트</h3>
                    <p><a href="https://reactrouter.com/">https://reactrouter.com/</a></p>
                    </br>
                    
                    <h3>* react-router-dom을 install</h3>
                    <p>yarn add react-router-dom</p>
                    </br>
                    
                    <h3>* index.js 파일에 react-router-dom 적용</h3>
                    <p>import { BrowserRouter } from 'react-router-dom';</p>
                    <p>&lt;BrowserRouter&gt;</p>
                    </br>
                    <h5>
                    <pre>
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import { BrowserRouter } from 'react-router-dom';

ReactDOM.render(
  &lt;BrowserRouter&gt;
    &lt;App /&gt;
  &lt;/BrowserRouter&gt;,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* Header.js</h3>
                    <p>&lt;Link&gt;</p>
                    <p>&lt;Routes&gt;</p>
                    <p>&lt;Route path="/" element={&lt;Home /&gt;}&gt;&lt;/Route&gt;</p>
                    <p>&lt;/Routes&gt;</p>
                    </br>
                    <h5>
                    <pre>

import * as React from 'react';
import PropTypes from 'prop-types';
import Toolbar from '@mui/material/Toolbar';
import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import SearchIcon from '@mui/icons-material/Search';
import Typography from '@mui/material/Typography';
import Link from '@mui/material/Link';
import { Routes, Route } from 'react-router-dom';
import Home from './../pages/Home';
import Design from './../pages/Design';
import Culture from './../pages/Culture';
import Business from './../pages/Business';
import Politics from './../pages/Politics';
import Opinion from './../pages/Opinion';
import Science from './../pages/Science';
import Health from './../pages/Health';
import Style from './../pages/Style';
import Travel from './../pages/Travel';


function Header(props) {
  const { sections, title } = props;
  return (
    &lt;React.Fragment&gt;
      &lt;Toolbar sx={{ borderBottom: 1, borderColor: 'divider' }}&gt;
        &lt;Button size="small"&gt;Subscribe&lt;/Button&gt;
        &lt;Typography
          component="h2"
          variant="h5"
          color="inherit"
          align="center"
          noWrap
          sx={{ flex: 1 }}
        &gt;
          {title}
        &lt;/Typography&gt;
        &lt;IconButton&gt;
          &lt;SearchIcon /&gt;
        &lt;/IconButton&gt;
        &lt;Button variant="outlined" size="small"&gt;
          Sign up
        &lt;/Button&gt;
      &lt;/Toolbar&gt;
      &lt;Toolbar
        component="nav"
        variant="dense"
        sx={{ justifyContent: 'space-between', overflowX: 'auto' }}
      &gt;
        {sections.map((section) =&gt; (
          &lt;Link
            color="inherit"
            noWrap
            key={section.uuid}
            variant="body2"
            href={section.menuLink}
            sx={{ p: 1, flexShrink: 0 }}
          &gt;
            {section.codeName}
          &lt;/Link&gt;
        ))}
      &lt;/Toolbar&gt;
      &lt;Routes&gt;
        &lt;Route path="/" element={&lt;Home /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/myLife" element={&lt;MyLife /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/design" element={&lt;Design /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/culture" element={&lt;Culture /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/business" element={&lt;Business /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/politics" element={&lt;Politics /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/opinion" element={&lt;Opinion /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/science" element={&lt;Science /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/health" element={&lt;Health /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/style" element={&lt;Style /&gt;}&gt;&lt;/Route&gt;
        &lt;Route path="/travel" element={&lt;Travel /&gt;}&gt;&lt;/Route&gt;
      &lt;/Routes&gt;
    &lt;/React.Fragment&gt;
  );
}

Header.propTypes = {
  sections: PropTypes.arrayOf(
    PropTypes.shape({
      codeName: PropTypes.string.isRequired,
      menuLink: PropTypes.string.isRequired,
    })
  ).isRequired,
  title: PropTypes.string.isRequired,
};

export default Header;
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



