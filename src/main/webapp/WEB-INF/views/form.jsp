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
    <title>Insert info</title>
</head>
<body>

<%--    값을 넘겨받는 post 쓰려고 form 태그 사용함. input 태그는 그대로고, tr과 th는 테이블에 맞는 규격 지시. --%>
    <form  method="post" >
            <h1>새 정보 입력</h1>
            <h2>각각 폼에 맞는 정보를 입력하세요.</h2>
                아이디 : <input type="text" name="id"><br>
                이름 : <input type="text" name="name"><br>
                나이 : <input type="text" name="age"><br>
                전화번호 : <input type="text" name="phone"><br>
            <button type="submit" onclick="" value="저장" id="submit">저장</button><br><br>
            <input type="reset" value="목록" onclick="location.href='http://localhost:8080/list'">
        </form>
    </body>
</html>
