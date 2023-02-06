<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.reversion.model.Member" %>
<%@ page import="com.example.reversion.service.MemberService" %>

<%@ page import="java.util.List" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: ssy
  Date: 2023-02-03
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>test</title>
</head>
<body>

<h1>Demo Page__test.jsp</h1>


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

     <%--단일 리스트 내보내기
        <tr>
            <td><c:out value="${member.id}"></c:out></td>
            <td><c:out value="${member.name}"></c:out></td>
            <td><c:out value="${member.age}"></c:out></td>
            <td><c:out value="${member.PNum}"></c:out></td>
        </tr>--%>



    <c:forEach var="member" items="${members}">
        <tr>
            <td><c:out value="${member.id}"></c:out></td>
            <td><c:out value="${member.name}"></c:out></td>
            <td><c:out value="${member.age}"></c:out></td>
            <td><c:out value="${member.PNum}"></c:out></td>
        </tr>
    </c:forEach>


    </tbody>
</table>




</body>
</html>

