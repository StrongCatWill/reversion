<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        body{
            font-weight: 300;
            font-size: 15px;
            line-height: 1.7;
            color: #c4c3ca;
            background-color: #1f2029;
            overflow-x: hidden;
        }
        a{
            cursor: pointer;
            transition: all 200ms linear;
        }
        a:hover{
            text-decoration: none;
        }
        p{
            font-weight: 500;
            font-size: 14px;
            line-height: 1.7;
        }
        h4{
            font-weight: 600;
        }
        h6 span{
            padding: 0 20px;
            text-transform: uppercase;
            font-weight: 700;
        }

    </style>
    <title>Detail page</title>
</head>
<body>
<h2>선택한 값을 조회</h2>

<%--
<ul>
    <li>Member : ${member}</li>
</ul>
--%>

<li> 선택된 사용자의 ID : <c:out value="${member.id}"></c:out></li>
<li> 선택된 사용자의 이름 : <c:out value="${member.name}"></c:out></li>
<li> 선택된 사용자의 나이 : <c:out value="${member.age}"></c:out></li>
<li> 선택된 사용자의 전화번호 : <c:out value="${member.phone}"></c:out></li>


<button type="button" onclick="location.href='http://localhost:8080/list'">리스트 페이지로 이동</button>
<button type="button" onclick="location.href='http://localhost:8080/modify'">수정 페이지로 이동</button>

</body>
</html>

<%--
<script type="js">
    function getInputValue()

</script>--%>
