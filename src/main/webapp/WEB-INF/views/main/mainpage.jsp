<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>ajax refactoring</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
        body{
            background-color: #adc0b7;

        }
        #form-div{
            align-self: center;
            background-color: #6BBD99;
            border: 2px solid #46A094;
        }
        #detailDiv{
            align-self: center;
            background-color: #46A094;
            border: 2px solid #46A094;
        }
        Button{
            display: inline-block;
            padding: 1.5em 2.6em;
            border-radius: 0;
            color: #b2876f;
            margin-top:2rem;
            font-weight: bold;
            font-size: 0.8rem;
            letter-spacing: 1px;
            text-transform: uppercase;
            text-decoration: none;
            position: relative;
            transition: all 250ms ease;
        }
        #contents{
            width: 100%;
        }
    </style>
</head>
<body>
<h1 align="center">멤버 리스트 조회</h1>

<div id="contents" align="center">
    <div id="tableDiv">
    </div>



    <div id="detailDiv">
        <hr>
        <table id="detailTable" width="40%" border="1">
            <tr>
                <td>사용자의 ID : <c:out value="${member.id}"></c:out></td>
                <td>사용자의 이름 : <c:out value="${member.name}"></c:out></td>
                <td>사용자의 나이 : <c:out value="${member.age}"></c:out></td>
                <td>사용자의 전화번호 : <c:out value="${member.phone}"></c:out></td>
            </tr>
        </table>


        <button type="button" onclick="location.href='http://localhost:8080/modify?id=${member.id}&name=${member.name}&age=${member.age}&phone=${member.phone}'">수정</button>
        <button type="button" id="toMainBtn">수정하지 않고 목록으로</button>
    </div>


    <div id="form-div">
        <div id="hide-form">
            <hr>
            <h4>새 정보 입력</h4>
            <h6>각각 폼에 맞는 정보를 입력하세요.</h6>
            아이디 : <input type="text" id="id"><br>
            이름 : <input type="text" id="name"><br>
            나이 : <input type="text" id="age"><br>
            전화번호 : <input type="text" id="phone"><br>

            <div id="buttonDiv">
                <button type="submit" onclick="" value="저장" id="saveMember">저장</button>
                <button type="reset" id="resetBtn">저장하지 않고 창 닫기</button>
            </div>

        </div>
    </div>

    <hr>
    <button type="button" id="goAddMamber">
        addMember
    </button>
    <button type="button" id="goDetailMamber">
        Show Member Detail
    </button>
</div>


<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script>

    $(function(){
        Mainlist();

        $("#form-div").hide();
        $("#detailDiv").hide();
    });

    function Mainlist(){

        $.ajax({
            url:"./main/list",
            type:"get",
            dataType:"json",

            success:function(result){
                console.log(result)

                let ListTable = $('<table/>');
                $("ListTable").html("<tr><th>아이디</th><th>이름</th><th>나이</th><th>전화번호</th></tr>");

                $.each(result, function(index, item){
                    let tr = $('<tr>', {
                        class : 'table_tr'
                    });

                    let td_id =$('<td/>',{
                        text : item.id
                    });

                    let td_name =$('<td/>',{
                        text : item.name
                    });

                    let td_age =$('<td/>',{
                        text : item.age
                    });

                    let td_phone =$('<td/>',{
                        text : item.phone
                    });

                    tr.append(td_id)
                    tr.append(td_name)
                    tr.append(td_age)
                    tr.append(td_phone)

                    ListTable.append(tr);
                });

                $('#tableDiv').append(ListTable);
                $('#ListTable').css({
                    width:"100%", border:"1"
                })
            }
        });
    }

    $("#goAddMamber").click(function(){
        $("#form-div").show();
        $("#goAddMamber").hide();
        $("#goDetailMamber").hide();
    })

    $("#goDetailMamber").click(function(){
        $("#detailDiv").show();
        $("#goAddMamber").hide();
        $("#goDetailMamber").hide();


    })

    $("#toMainBtn").click(function(){
        $("#detailDiv").hide();
        $("#goAddMamber").show();
        $("#goDetailMamber").show();

        // Mainlist.preventdefault(); // 지금 그냥 띄우면 수정하지 않고 목록을 누를 때 계속 Mainlist가 실행됨. 이걸 고치려면 기본행동 취소를 하거나, 새로 페이지를 불러와야 하는데 이건 비동기 통신이 아니다.

    })

    $("#resetBtn").click(function(){
        $("#form-div").hide();
        console.log("resetBtn 클릭됨. 저장하지 않고 addMember 폼 닫힘. ");
        $("#goAddMamber").show();
        $("#goDetailMamber").show();
    })


    $("#saveMember").click(function(){

        $("#form-div").hide();
        let id = $("#id").val();
        let name = $("#name").val();
        let age = $("#age").val();
        let phone = $("#phone").val();

        console.log(id, name, age, phone);

        let member ={
            id, name, age, phone
        }

        $.ajax({
            url:"./main/add",
            type:"post",
            dataType:"json",
            contentType:"application/json;charset=UTF-8",
            async : false,
            data: { "id" : member.id,
                    "name" : member.name,
                    "age" : member.age,
                    "phone" : member.phone},
            success :function(id, name, age, phone){
                console.log(id);
                alert("입력값 아이디만 확인"+id);
                $("#goAddMamber").show();
                $("#goDetailMamber").show();
                },
            error:function(error){
                alert('데이터 값이 확인되지 않음'+error);
                $("#goAddMamber").show();
                $("#goDetailMamber").show();
            }
        });
    });



</script>
</body>
</html>
