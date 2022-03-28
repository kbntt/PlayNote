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
	          
	          <h2 class="sub-header">Project > windRider > axios 적용</h2>
	          <div class="table-responsive">
	            <table class="table table-striped">
	              <h2 class="blog-post-title">axios 적용</h2>
		            <p class="blog-post-meta">March 28, 2022 by <a href="#">Wind Rider</a></p>
		            <iframe width="840" height="472" src="https://www.youtube.com/embed/uzq20OqNeKU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            <hr>
		            
		            <h3>* axios 사이트</h3>
                    <p><a href="https://axios-http.com/">https://axios-http.com/</a></p>
                    </br>
                    
                    <h3>* axios을 install</h3>
                    <p>yarn add axios</p>
                    </br>
                    
                    <h3>* package.json 파일 추가</h3>
                    <p>"proxy": "http://localhost:8083"</p>
                    </br>
                    
                    <h3>* MENU 테이블 생성</h3>
                    </br>
                    <h5>
                    <pre>

CREATE TABLE MENU
(
    `UUID`          VARCHAR(36)     NOT NULL    COMMENT '테이블 ID',
    `CODE`          VARCHAR(30)     NOT NULL    COMMENT '코드', 
    `CODE_NAME`     VARCHAR(100)    NOT NULL    COMMENT '코드명', 
    `PARENTS_CODE`  VARCHAR(30)     NULL        COMMENT '부모코드', 
    `MENU_LINK`      VARCHAR(300)   NULL        COMMENT '메뉴링크', 
    `AUTH`          VARCHAR(30)     NULL        COMMENT '권한', 
    `LIST_ORDER`    INT(2)          NULL        COMMENT '정렬순서', 
    `COMMENT`       VARCHAR(200)    NULL        COMMENT '코맨트', 
    `DELETE_YN`     VARCHAR(1)      NOT NULL    DEFAULT 'N' COMMENT 'Y,N',  
    `UPDATE_USER`   VARCHAR(36)     NULL        COMMENT '수정자', 
    `UPDATE_DATE`   DATETIME        NULL        COMMENT '수정일', 
    `CREATE_USER`   VARCHAR(36)     NOT NULL    COMMENT '생성자', 
    `CREATE_DATE`   DATETIME        NOT NULL    COMMENT '생성일', 
    CONSTRAINT PK_MENU PRIMARY KEY (UUID)
);

ALTER TABLE MENU COMMENT '메뉴';

                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* MENU 테이블에 데이타 입력</h3>
                    </br>
                    <h5>
                    <pre>
INSERT INTO MENU (
      UUID,           CODE,               CODE_NAME,    PARENTS_CODE,    MENU_LINK,    
      AUTH,           LIST_ORDER,         COMMENT,      DELETE_YN,       UPDATE_USER,
      UPDATE_DATE,    CREATE_USER,        CREATE_DATE
)
VALUES(        
      uuid(),         'HOME',             'Home',       'ROOT',          '/',         
      '01',           1,                  '홈',         'N',            NULL,         
      NULL,           'admin',             now()    
     );

INSERT INTO MENU (
      UUID,           CODE,               CODE_NAME,    PARENTS_CODE,    MENU_LINK,    
      AUTH,           LIST_ORDER,         COMMENT,      DELETE_YN,       UPDATE_USER,
      UPDATE_DATE,    CREATE_USER,        CREATE_DATE
)
VALUES(        
      uuid(),         'DESIGN',           'Design',       'ROOT',          '/blog',         
      '01',           1,                  '블로그',     'N',            NULL,         
      NULL,           'admin',             now()    
     );

INSERT INTO MENU (
      UUID,           CODE,               CODE_NAME,    PARENTS_CODE,    MENU_LINK,    
      AUTH,           LIST_ORDER,         COMMENT,      DELETE_YN,       UPDATE_USER,
      UPDATE_DATE,    CREATE_USER,        CREATE_DATE
)
VALUES(        
      uuid(),         'PROJECT',          'Project',    'ROOT',          '/project',         
      '01',           1,                  '프로젝트',   'N',            NULL,         
      NULL,           'admin',             now()    
     );
                    </pre>
                    </h5>
                    <hr>
                    </br>
		            
		            
                    <h3>* MenuVo.java 생성</h3>
                    </br>
                    <h5>
                    <pre>

                    package kr.co.windrider.vo;

import java.util.Date;

public class MenuVo {
    
    private String     uuid        ;
    private String     code        ;
    private String     codeName    ;
    private String     parentsCode ;
    private String     menuLink    ;
    private String     auth        ;
    private int        listOrder   ;
    private String     comment     ;
    private String     deleteYn    ;
    private String     updateUser  ;
    private Date       updateDate  ;
    private String     createUser  ;
    private Date       createDate  ;
    
    public String getUuid() {
        return uuid;
    }
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public String getCodeName() {
        return codeName;
    }
    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }
    public String getParentsCode() {
        return parentsCode;
    }
    public void setParentsCode(String parentsCode) {
        this.parentsCode = parentsCode;
    }
    public String getMenuLink() {
        return menuLink;
    }
    public void setMenuLink(String menuLink) {
        this.menuLink = menuLink;
    }
    public String getAuth() {
        return auth;
    }
    public void setAuth(String auth) {
        this.auth = auth;
    }
    public int getListOrder() {
        return listOrder;
    }
    public void setListOrder(int listOrder) {
        this.listOrder = listOrder;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
    public String getDeleteYn() {
        return deleteYn;
    }
    public void setDeleteYn(String deleteYn) {
        this.deleteYn = deleteYn;
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
                    
                    <h3>* Home.xml에 추가</h3>
                    </br>
                    <h5>
                    <pre>
                      &lt!-- Top Menu 조회 --&gt;
    &ltselect id = "getTopMenu" parameterType = "java.util.HashMap" resultType = "kr.co.windrider.vo.MenuVo"&gt;
        /* kr.co.windrider.home.getTopMenu */
        SELECT  UUID         AS uuid                             
               ,CODE         AS code                             
               ,CODE_NAME    AS codeName                        
               ,PARENTS_CODE AS parentsCode                     
               ,MENU_LINK    AS menuLink                        
               ,AUTH         AS auth                             
               ,LIST_ORDER   AS listOrder                       
               ,COMMENT      AS comment                          
               ,DELETE_YN    AS deleteYn                        
               ,UPDATE_USER  AS updateUser                      
               ,UPDATE_DATE  AS updateDate                      
               ,CREATE_USER  AS createUser                      
               ,CREATE_DATE  AS createDate                      
        FROM MENU;
    &lt/select&gt;
                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* HomeServiceImple.java에 추가</h3>
                    </br>
                    <h5>
                    <pre>
   @Override
    public List&lt;MenuVo&gt; getTopMenu() {
        String sqlId = ".getTopMenu";
        List&lt;MenuVo&gt; listMenu = sqlSession.selectList(namespace+sqlId, null);
        return listMenu;
    }

                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* HomeService.java에 추가</h3>
                    </br>
                    <h5>
                    <pre>
    public List&lt;MenuVo&gt; getTopMenu();
                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* HomeController.java에 추가</h3>
                    </br>
                    <h5>
                    <pre>

                        @GetMapping("/home/getTopMenu")
    public List&lt;MenuVo&gt; getTopMenu() {
        System.out.println("getTopMenu");
        List&lt;MenuVo&gt; list = homeService.getTopMenu();
        return list;
    }
                    </pre>
                    </h5>
                    <hr>
                    </br>
                    
                    <h3>* Blog.js 추가,수정</h3>
                    </br>
                    <h5>
                    <pre>
import React, { useState, useEffect } from 'react';
...
  const [sections, setSections] = useState(null);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(false);

  useEffect(() =&gt; {
    const fetchDataList = async () =&gt; {
      try {
        setError(null);
        setSections(null);
        setLoading(true);
        const response = await axios.get('/home/getTopMenu');
        console.log(response.data);
        setSections(response.data);
      } catch (e) {
        setError(e);
      }
      setLoading(false);
    };
    fetchDataList();
  }, []);

  if (loading) return &lt;div&gt;로딩중...&lt;/div&gt;;
  if (error) return &lt;div&gt;에러가 발생했습니다.&lt;/div&gt;;
  if (!sections) return null;
                    </pre>
                    </h5>
                    <hr>
                    </br>
  
                    <h3>* Header.js 추가,수정</h3>
                    </br>
                    <h5>
                    <pre>
  ...
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



