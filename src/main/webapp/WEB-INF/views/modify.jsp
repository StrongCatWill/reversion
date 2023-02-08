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
    <form method="post">
        <label style="align-self: center">수정할 ID 입력</label><br>
        아이디 : <input type="text" name="id" value="${post.id}"><br>
        확인된 정보 :
        <button type="submit" onclick="" value="확인" id="submit">ID 확인</button><br><br>
        <input type="reset" value="목록" onclick="location.href='http://localhost:8080/list'">
    </form>

</body>
</html>
