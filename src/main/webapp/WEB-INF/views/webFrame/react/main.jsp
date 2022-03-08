<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>React Test</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


<script crossorigin src="https://unpkg.com/react@16.13.1/umd/react.development.js"></script>
<script crossorigin src="https://unpkg.com/react-dom@16.13.1/umd/react-dom.development.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
<script type="text/babel" src="${pageContext.request.contextPath}/resources/react/components/Component.jsx"></script>
<script type="text/babel" src="${pageContext.request.contextPath}/resources/react/components/ImportTest.jsx"></script>
<script type="text/babel" src="${pageContext.request.contextPath}/resources/react/components/App.jsx"></script>


<script type="text/babel">
            $( document ).ready(function() {
                ReactDOM.render( <Component/>, document.getElementById('mydiv'));
            });
</script>
<script type="text/babel">
            $( document ).ready(function() {
                ReactDOM.render( <ImportTest/>, document.getElementById('mydiv1'));
            });
</script>
<script type="text/babel">
            $( document ).ready(function() {
                ReactDOM.render( <App/>, document.getElementById('mydiv2'));
            });
</script>

</head>
<body>
   react Main jsp
   <div id="mydiv"></div>
   111==================111
   <div id="mydiv1"></div>
   222==================222
   <div id="mydiv2"></div>
   333==================333
   
</body>
</html>



