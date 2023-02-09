<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ajax 에서 요청을 받으면 띄워 줄 페이지</title>
</head>
<body>
  <%
      /*request객체에서 받아온 파라미터값 저장,*/
      /*아니 근데 이렇게 작성하면 mvc 모델에 위배되지 않나? 컨트롤러 안에 들어갈 로직은 jsp 단에서 빠져야 하잖아. 일단 ㄱ*/

      String city = request.getParameter("city");
      String zipcode = request.getParameter("zipcode");

      /*out 객체를 통해 응답*/
      out.println("도시: "+ city);
      out.println("우편주소: "+zipcode);
  %>

</body>
</html>
