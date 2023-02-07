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
    <form method="post">
        아이디 : <input type="text" name="id" value="${post.id}"><br>
        이름 : <input type="text" name="name" value="${post.name}"><br>
        나이 : <input type="text" name="age" value="${post.age}"><br>
        전화번호 : <input type="text" name="phone" value="${post.phone}"><br>
        <button type="submit" onclick="" value="저장" id="submit">저장</button><br><br>
        <input type="reset" value="목록" onclick="location.href='http://localhost:8080/list'">
    </form>

</body>
</html>
