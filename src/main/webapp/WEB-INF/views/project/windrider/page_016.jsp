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
	          
	          <h2 class="sub-header">Project > windRider > MyLife Add</h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <h2 class="blog-post-title">MyLife Add</h2>
		            <p class="blog-post-meta">April 7, 2022 by <a href="#">Wind Rider</a></p>
		            <iframe width="840" height="472" src="https://www.youtube.com/embed/6KYIYjBmK0M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            <hr>
		            
                    <h3>* github url</h3>
                    <p><a href="https://github.com/kbntt/windrider-api.git">https://github.com/kbntt/windrider-api.git</a></p>
                    <p><a href="https://github.com/kbntt/windrider-react.git">https://github.com/kbntt/windrider-react.git</a></p>  
                    <hr>
                    </br>
                    
                    <h3>* Business.js 수정</h3>
                    <h5>
                    <pre>                  
... 
    
import TextareaAutosize from '@mui/material/TextareaAutosize';
import TextField from '@mui/material/TextField';

...

... 
  const [title, setTitle] = useState('null');
  const [contents, setContents] = useState(null);
...

... 
  const saveMyLife = (event) =&gt; {

    const fd = new FormData();
    fd.append('file', selectedFile, selectedFile.name);
    fd.append('contents', contents);
    fd.append('title', title);

    axios
      .post('/myLife/saveMyLife', fd, {
        onUploadProgress: (ProgressEvent) =&gt; {
          console.log(
            'Upload Progress: ' +
              Math.fround((ProgressEvent.loaded / ProgressEvent.total) * 100) +
              '%'
          );
        },
      })
      .then((res) =&gt; {
        console.log(res);
        console.log('res.data.imgUrl==&gt;' + res.data.imgUrl);
      });
  };
...

... 
    &lt;Box sx={{ width: '100%' }}&gt;
        &lt;CssBaseline /&gt;
        &lt;Stack spacing={2} direction="row"&gt;
          &lt;TextField
            id="title"
            name="title"
            variant="outlined"
            onChange={(e) =&gt; setTitle(e.target.value)}
            label="*Title"
            margin="dense"
            fullWidth
          /&gt;
          &lt;Button variant="contained" onClick={saveMyLife}&gt;
            Save
          &lt;/Button&gt;
        &lt;/Stack&gt;
      &lt;/Box&gt;
      &lt;br /&gt;
      &lt;Box sx={{ pb: 7 }}&gt;
        &lt;CssBaseline /&gt;
        &lt;TextareaAutosize
          onChange={(e) =&gt; setContents(e.target.value)}
          maxRows={20}
          minRows={20}
          aria-label="maximum height"
          placeholder="Maximum 200 rows"
          defaultValue={contents}
          style={{ width: '100%' }}
        /&gt;
      &lt;/Box&gt;
...

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



