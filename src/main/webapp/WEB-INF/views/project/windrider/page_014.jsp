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
	          
	          <h2 class="sub-header">Project > windRider > 파일업로드 react</h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <h2 class="blog-post-title">파일업로드 react 작업</h2>
		            <p class="blog-post-meta">April 6, 2022 by <a href="#">Wind Rider</a></p>
		            <iframe width="840" height="472" src="https://www.youtube.com/embed/300C_x5-y_8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            
		            <hr>
		            
                    <h3>* github url</h3>
                    <p><a href="https://github.com/kbntt/windrider-api.git">https://github.com/kbntt/windrider-api.git</a></p>
                    <p><a href="https://github.com/kbntt/windrider-react.git">https://github.com/kbntt/windrider-react.git</a></p>  
                    <hr>
                    </br>
   
                    <h3>* Business.js 파일에 파일업로드 기능 구현</h3>
                    <h5>
                    <pre>                  

import React, { useState, useRef } from 'react';
import Divider from '@mui/material/Divider';
import Box from '@mui/material/Box';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import List from '@mui/material/List';
import Card from '@mui/material/Card';
import axios from 'axios';
import { CardMedia } from '@mui/material';

const Business = () =&gt; {
  const [imageFile, setImageFile] = useState('');
  const [selectedFile, setSelectedFile] = useState(null);
  const fileInput = useRef();

  const saveImageFile = (event) =&gt; {
    console.log('saveImageFile');
    console.log('URL =&gt;' + URL.createObjectURL(event.target.files[0]));
    setImageFile(URL.createObjectURL(event.target.files[0]));
    setSelectedFile(event.target.files[0]);
  };

  const deleteImageFile = () =&gt; {
    console.log('deleteImageFile');
    URL.revokeObjectURL(imageFile);
    setImageFile('');
    fileInput.current.value = '';
  };

  const uploadImageFile = () =&gt; {
    console.log('uploadImageFile selectedFile =&gt;' + selectedFile);
    console.log('uploadImageFile selectedFile.name =&gt;' + selectedFile.name);

    const fd = new FormData();
    fd.append('file', selectedFile, selectedFile.name);
    axios.post('/myLife/fileUploadTest', fd).then((res) =&gt; {
      console.log(res);
    });
  };

  return (
    &lt;&gt;
      &lt;br /&gt;
      &lt;Divider /&gt;
      &lt;Box sx={{ width: '100%' }}&gt;
        &lt;Stack spacing={2} direction="row"&gt;
          &lt;input
            name="imgUpload"
            type="file"
            accept="image/*"
            ref={fileInput}
            onChange={saveImageFile}
          /&gt;
          &lt;Button variant="contained" onClick={deleteImageFile}&gt;
            DELETE
          &lt;/Button&gt;
          &lt;Button variant="contained" onClick={uploadImageFile}&gt;
            UPLOAD
          &lt;/Button&gt;
        &lt;/Stack&gt;
      &lt;/Box&gt;
      &lt;Box sx={{ pb: 7 }}&gt;
        &lt;CssBaseline /&gt;
        &lt;List&gt;
          &lt;Card key={0} sx={{ maxWidth: 400 }}&gt;
            &lt;CardMedia component="img" image={imageFile} /&gt;
          &lt;/Card&gt;
        &lt;/List&gt;
      &lt;/Box&gt;
    &lt;/&gt;
  );
};

export default Business;           
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



