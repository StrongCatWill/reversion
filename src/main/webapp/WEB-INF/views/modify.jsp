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
    <title>Modify detail</title>
</head>
<body>

<h1>회원 정보 수정</h1>

    <form method="post" action="/modify2" >
        아이디는 수정할 수 없습니다 : <input type="text" name="id" autocomplete="on" placeholder="이전 아이디 : " value="<c:out value="${member.id}"></c:out>" ><br>
        수정할 이름 : <input type="text" name="nm" autocomplete="off" placeholder="이전 이름 : " value="<c:out value="${member.name}"></c:out>" ><br>
        수정할 나이 : <input type="text" name="age" autocomplete="off" placeholder="이전 나이 : " value="<c:out value="${member.age}"></c:out>" ><br>
        수정할 전화번호 : <input type="text" name="phone" autocomplete="off" placeholder="이전 전화번호 : " value="<c:out value="${member.phone}"></c:out>" ><br>

        <button type="submit" onclick="" value="저장" >저장</button><br><br>
        <input type="reset" value="목록" onclick="location.href='http://localhost:8080/list'">
    </form>
</body>
</html>
