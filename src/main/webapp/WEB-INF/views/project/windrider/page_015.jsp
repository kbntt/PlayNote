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
		            <iframe width="840" height="472" src="https://www.youtube.com/embed/CTtBeytZ2Ao" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            <hr>
		            
                    <h3>* github url</h3>
                    <p><a href="https://github.com/kbntt/windrider-api.git">https://github.com/kbntt/windrider-api.git</a></p>
                    <p><a href="https://github.com/kbntt/windrider-react.git">https://github.com/kbntt/windrider-react.git</a></p>  
                    <hr>
                    </br>
   
                    <h3>* ATTACH_FILE 테이블 생성</h3>
                    <p>File 저장용 테이블 신규 생성</p>
                    <h5>
                    <pre>                  

CREATE TABLE ATTACH_FILE
(
    `UUID`              VARCHAR(36)     NOT NULL    COMMENT '테이블 ID', 
    `BOARD_UUID`        VARCHAR(36)     NOT NULL    COMMENT '게시판 ID', 
    `STORED_FILE_NAME`  VARCHAR(50)     NOT NULL    COMMENT '저장된파일 이름', 
    `ORG_FILE_NAME`     VARCHAR(250)    NOT NULL    COMMENT '원본파일 이름', 
    `FILE_EXTENSION`    VARCHAR(36)     NOT NULL    COMMENT '파일확장자', 
    `FILE_DIRECTORY`    VARCHAR(400)    NOT NULL    COMMENT '저장 디렉토리', 
    `FILE_SIZE`         INT(11)         NOT NULL    COMMENT '파일크기', 
    `FILE_TYPE`         VARCHAR(10)     NULL        COMMENT '파일종류', 
    `UPDATE_USER`       VARCHAR(36)     NULL        COMMENT '수정자', 
    `UPDATE_DATE`       DATETIME        NULL        COMMENT '수정일', 
    `CREATE_USER`       VARCHAR(36)     NOT NULL    COMMENT '생성자', 
    `CREATE_DATE`       DATETIME        NOT NULL    COMMENT '생성일', 
     PRIMARY KEY (UUID)
);

ALTER TABLE ATTACH_FILE COMMENT '첨부파일';      
                    </pre>
                    </h5>
                    <hr>
                    </br>   
                              
                    <h3>* AttachFileVo.java 생성</h3>
                    <h5>
                    <pre>                  
package kr.co.windrider.vo;

import java.util.Date;

public class AttachFileVo {

    private String uuid;
    private String boardUuid;
    private String orgFileName;
    private String fileDirectory;
    private long   fileSize;
    private String fileType;
    private String storedFileName;
    private String fileExtension;
    private String updateUser;
    private Date   updateDate;
    private String createUser;
    private Date   createDate;

    
    public String getStoredFileName() {
        return storedFileName;
    }

    public void setStoredFileName(String storedFileName) {
        this.storedFileName = storedFileName;
    }

    public String getFileExtension() {
        return fileExtension;
    }

    public void setFileExtension(String fileExtension) {
        this.fileExtension = fileExtension;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getBoardUuid() {
        return boardUuid;
    }

    public void setBoardUuid(String boardUuid) {
        this.boardUuid = boardUuid;
    }

    public String getOrgFileName() {
        return orgFileName;
    }

    public void setOrgFileName(String orgFileName) {
        this.orgFileName = orgFileName;
    }

    public String getFileDirectory() {
        return fileDirectory;
    }

    public void setFileDirectory(String fileDirectory) {
        this.fileDirectory = fileDirectory;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

}    
                    </pre>
                    </h5>
                    <hr>
                    </br>   
                                 
                    <h3>* Comm.xml 파일 생성</h3>
                    <h5>
                    <pre>                  

&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt; 
    
&lt;mapper namespace="kr.co.windrider.comm"&gt;
    &lt;insert id = "saveAttachFile" parameterType = "kr.co.windrider.vo.AttachFileVo"&gt;
    /* kr.co.windrider.comm.saveAttachFile */
        INSERT INTO ATTACH_FILE (
             UUID
            ,BOARD_UUID
            ,STORED_FILE_NAME
            ,ORG_FILE_NAME
            ,FILE_EXTENSION
            ,FILE_DIRECTORY
            ,FILE_SIZE
            ,FILE_TYPE
            ,UPDATE_USER
            ,UPDATE_DATE
            ,CREATE_USER
            ,CREATE_DATE
        )
        VALUES(
             &#35;{uuid}
            ,&#35;{boardUuid}
            ,&#35;{storedFileName}
            ,&#35;{orgFileName}
            ,&#35;{fileExtension}
            ,&#35;{fileDirectory}
            ,&#35;{fileSize}
            ,&#35;{fileType}
            ,&#35;{updateUser}
            ,&#35;{updateDate}
            ,&#35;{createUser}
            ,&#35;{createDate}
        )
    &lt;/insert&gt;
    
&lt;/mapper&gt;      
                    </pre>
                    </h5>
                    <hr>
                    </br>        
                                 
                    <h3>* FileStorageService.java 수정</h3>
                    <h5>
                    <pre>                  
...
    public void upload(MultipartFile file, String uploadPath, String fileUuid);
    public int saveAttachFile(MultipartFile file, String boardUuid);
...
                    </pre>
                    </h5>
                    <hr>
                    </br>   
                         
                    <h3>* FileStorageServiceImple.java 수정</h3>
                    <h5>
                    <pre>                  
...
    @Autowired
    private SqlSession sqlSession;
    
    private String namespace = "kr.co.windrider.comm";
...

...
    @Override
    public void upload(MultipartFile file, String uploadPath, String fileName ) {
        try {
            String path = springUploadPath+uploadPath;
            Path root = Paths.get(path);
            if(!Files.exists(root)) {
                init(path);
            }
            try(InputStream inputStream = file.getInputStream()){
                Files.copy(inputStream, root.resolve(fileName),StandardCopyOption.REPLACE_EXISTING);
            }
        }catch(Exception e) {
            throw new RuntimeException("Could not store the file. Error: "+e.getMessage());
        }
    }
...

...
    @Override
    public int saveAttachFile(MultipartFile file, String boardUuid) {
        
        if(file.isEmpty()) {
            return 0;
        }
        String originalFilename = file.getOriginalFilename();
        long fileSize = file.getSize();
        String fileType = file.getContentType();
        String uuid = UUID.randomUUID().toString();
        Date date = new Date();
        String uploadPath = FilePath.MYLIFE_PATH;
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String storedFileName = boardUuid+extension;
        
        AttachFileVo attachFileVo = new AttachFileVo();
        attachFileVo.setUuid(uuid);
        attachFileVo.setBoardUuid(boardUuid);
        attachFileVo.setOrgFileName(originalFilename);
        attachFileVo.setFileDirectory(uploadPath);
        attachFileVo.setFileSize(fileSize);
        attachFileVo.setFileType(fileType);
        attachFileVo.setFileExtension(extension);
        attachFileVo.setStoredFileName(storedFileName);
        attachFileVo.setCreateDate(date);
        attachFileVo.setCreateUser("windRider");
        
        String sqlId = ".saveAttachFile";
        
        int result = sqlSession.insert(namespace+sqlId, attachFileVo);
        if( 0 < result) { 
            upload(file, uploadPath, storedFileName); 
        }
        
        return result;
    }
...    
                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* MyLifeController.java 수정</h3>
                    <h5>
                    <pre>                  
... 
    @PostMapping("/myLife/saveMyLife")
    public HashMap&lt;String, Object&gt; saveMyLife(HttpServletRequest request,MultipartFile file) {
        System.out.println("saveMyLife");
        
        String uuid = UUID.randomUUID().toString();
        String title = request.getParameter("title");
        String contents = request.getParameter("contents");
        
        System.out.println("contents ======&gt;" + contents);
        System.out.println("title ======&gt;" + title);
        
        Date date = new Date();
        MyLifeVo myLifeVo = new MyLifeVo();
        myLifeVo.setUuid(uuid);
        myLifeVo.setTitle(title);
        myLifeVo.setContents(contents);
        myLifeVo.setCreateUser("windRider");
        myLifeVo.setCreateDate(date);
        
        HashMap&lt;String, Object&gt; map = new HashMap&lt;String, Object&gt;();
        map.put("myLifeVo", myLifeVo);
        
        int result = myLifeService.saveMyLife(map,file);
        
        HashMap&lt;String, Object&gt; resultMap = new HashMap&lt;String, Object&gt;();
        if( 0 &lt; result  ) {
            resultMap.put("msg", "SUCCESS");
        }
        else { resultMap.put("msg", "FAIL");}
        
        return resultMap;
    }
...

...
    @PostMapping("/myLife/fileUploadTest")
    public void fileUploadTest(MultipartFile file) throws Exception{
        String fileUuid = UUID.randomUUID().toString();
        String filePath = FilePath.MYLIFE_PATH;
        System.out.println(filePath);
        fileStorageService.upload(file, filePath, fileUuid);
        
    }
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



