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
    </style>
    <title>test</title>
</head>


<h1 align="center">DB에 있는 값을 조회</h1>


<%--DB에 있는 값을 조회해서 뿌려주는 테이블 태그--%>
<table width="100%" border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>name</th>
            <th>age</th>
            <th>전화번호</th>
        </tr>
    </thead>
    <tbody>


<%--DB에 있던 값을 뿌려주는 반복문. jstl 문법이다.--%>
    <c:forEach var="member" items="${members}">
        <tr>
            <td><c:out value="${member.id}"></c:out></td>
            <td><c:out value="${member.name}"></c:out></td>
            <td><c:out value="${member.age}"></c:out></td>
            <td><c:out value="${member.phone}"></c:out></td>
        </tr>
    </c:forEach>


    </tbody>
</table>

<%--버튼으로 다른 페이지 이동, <button>태그 사용함. location에는 http의 주소가 들어감</button>--%>
<%--<button type="button" onclick="location.href='http://localhost:8080/test/form'">등록 페이지로 이동</button>
<a href="/test/form"/>create</a><br>
<jsp:forward page="form.jsp" />--%>
<button type="button" onclick="location.href='http://localhost:8080/form'">등록 페이지로 이동</button>
<button type="button" onclick="location.href='http://localhost:8080/modify'">수정 페이지로 이동</button>
<%--지금의 주소를 반환하는 메서드. 근데 패키지 단위로 출력된다. 바로 찍어서 볼 수 있는 서블릿 태그임. (MVC 패턴에 적합한가?)
<%= request.getRequestURI() %>--%>

    </body>
</html>

