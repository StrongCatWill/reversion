
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ajax testing page</title>
</head>
<body>
    <h1>POST 방식의 요청</h1>
    <button type="button"> POST 방식으로 요청 보내기</button>
    <p id="text"></p>



</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

    function goDetail(id){
        $.ajax({
            url:"/detail",
            type:"post",
            data: {"id": id},
            dataType: "text",
            success :function (result){
                document.getElementById("text").innerHTML = result;
            }
        });
        /*콘솔은 개발자 도구에서 확인 가능. */
        console.log(id);
    }
</script>
<%--<script>


    /*얘를 바닐라 js라고 부른다. 같은 내용을 fetch api로 보낼 수 있음.*/
    function sendRequest(){
        var httpRequest = new XMLHttpRequest();

        /*GET 방식
        httpRequest.open("GET", "request_ajax.jsp?city=Seoul&zipcode=88855", true);
        httpRequest.send();*/

        /*Post 방식*/
        httpRequest.open("POST", "request_ajax.jsp", true);

        //encoding은 암호화
        httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        //send 메소드에 인수 전달
        httpRequest.send("city=Seoul&zipcode=55775");

        httpRequest.onreadystatechange = function (){
            //요청과 응답에 성공했을 때
            if(httpRequest.readyState==XMLHttpRequest.DONE && httpRequest.status==200){
                //응답 값을 받아온다.
                document.getElementById("text").innerHTML = httpRequest.responseText;
            }
        }
    }
</script>--%>
</html>
