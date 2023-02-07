<%--
  Created by IntelliJ IDEA.
  User: ssy
  Date: 2023-02-07
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SubMitPage</title>
</head>
<body>
<h1 align="center">새로운 row 등록</h1>

<%--&lt;%&ndash;지금의 주소를 반환하는 메서드. 근데 패키지 단위로 출력된다. 바로 찍어서 볼 수 있는 서블릿 태그임. (MVC 패턴에 적합한가?)
<%= request.getRequestURI() %>--%>

<button type="button" onclick="location.href='http://localhost:8080/test'">이전 페이지로 이동</button>

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
    </tbody>

    <h2>각각 폼에 맞는 정보를 입력하세요.</h2>
        <tr>
            <th><input type="text" name="Id"></th>
            <th><input type="text" name="name"></th>
            <th><input type="text" name="age"></th>
            <th><input type="text" name="pNum"></th>
        </tr>
</table>

<label>저장 버튼을 누르면 데이터 베이스 값이 업데이트</label>
<button type="submit" value="저장">저장</button>

<label>취소 버튼을 누르면 현재 입력 창이 초기화</label>
<button type="reset" value="취소">취소</button>

        </body>
</html>
