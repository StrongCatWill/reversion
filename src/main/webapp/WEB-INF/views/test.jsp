<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.reversion.model.Member" %>
<%@ page import="com.example.reversion.service.MemberService" %>

<%@ page import="java.util.List" %>
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
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>CreateDate</th>
    </tr>
    <c:forEach var="post" items="${posts}">
        <tr>
            <td>${post.id}</td>
            <td><a href="/post/${post.id}">${post.title}</a></td>
            <td>${post.createDate}</td>
        </tr>
    </c:forEach>

    <%
        MemberService dao = new MemberService();
        List<Member>list = (List<Member>) dao.getMember();

        for(Member dto:list){
    %>
    <tr>
        <td><%=dto.getId()%></td>
        <td><%=dto.getName()%></td>
        <td><%=dto.getAge()%></td>
        <td><%=dto.getPNum()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>


<%--
    <tbody>


    <%--
    <c:forEach var="result" items="${memberList}" varStatus="status">
    <tr>
        <td><t:out value="${result.id}"/></td>
        <td><t:out value="${result.name}"/> </td>
        <td><t:out value="${result.age}"/> </td>
        <td><t:out value="${result.PNum}"/> </td>
    </tr>
    </c:forEach>

    </tbody>
--%>

</body>
</html>

