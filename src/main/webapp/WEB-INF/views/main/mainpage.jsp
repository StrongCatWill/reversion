<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>ajax refactoring</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
    #hide-form{
        /*display: none;*/
    }
</style>
</head>
<body>
<h1 align="center">멤버 리스트 조회</h1>

<div id="tableDiv">
</div>



<div id="select-table">
</div>

<div id="form-div">
    <div id="hide-form">
        <hr>
        <h4>새 정보 입력</h4>
        <h6>각각 폼에 맞는 정보를 입력하세요.</h6>
        아이디 : <input type="text" name="id"><br>
        이름 : <input type="text" name="name"><br>
        나이 : <input type="text" name="age"><br>
        전화번호 : <input type="text" name="phone"><br>

        <button type="submit" onclick="" value="저장" id="saveMember">저장</button><br><br>
    </div>
</div>

<hr>
<button type="button" id="goAddMamber">
    addMember
</button>
<button id="showTest">
    show testing
</button>

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script>

    $(function(){
        Mainlist();

        $("#form-div").hide();
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
            }
        });
    }

    // $("#goAddMamber").click(function(){
    //     $.ajax({
    //         url:"/main/add",
    //         type:"get",
    //         success:function(){
    //             console.log('sssss');
    //             $("form-div").append(document.html("짠"));
    //             $("#hide-form").css("display","show");
    //         }
    //     })
    // })

    $("#goAddMamber").click(function(){
        $("#form-div").show();
    })


    $("#saveMember").click(function(){
        $("#form-div").hide();

        var id = $("#id").serialize();
        var name = $("#name").serialize();
        var age = $("#age").serialize();
        var phone = $("#phone").serialize();

        $.ajax({
            url:"./main/add",
            type:"post",
            dataType:"json",

        })
    })

</script>
</body>
</html>
