<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
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

        td, th{
            border: 1px dotted #1f2029;
            padding: 20px;
            margin: 100px;
        }
        thead{
            border: 3px dotted #1f2029;
        }
        table{
            border: 3px solid #1f2029;
        }

        .select{
            background-color: #46A094;
            border: 0.5px solid black;
        }
    </style>
</head>
<body>
<h1 align="center">Member List Table</h1>

<div id="contents" align="center">

    <div id="tableDiv">
        <table id="listTable">
            <thead>
<%--                <tr>--%>
                <th>memberCodeNum</th>
                <th>memberID</th>
                <th>memberName</th>
                <th>memberPhone</th>
                <th>memberGender</th>
                <th>memberBirth</th>
<%--                </tr>--%>
            </thead>
            <tbody id="tbody" class="test">
            </tbody>
        </table>
    </div>
    <div>
        <br><br><br><br>
    </div>



    <div id="detailDiv">
        <br><br><br>
        <h5><br>선택한 사용자의 세부 정보입니다. <br> 수정 버튼을 누르면 사용자 정보를 수정합니다. </h5>
        <hr>
        <table id="detailTable" width="50%" border="1">
            <thead>
                <tr>
                    <td>사용자의 memberCodeNum : </td>
                    <td id="outMemberCodeNum"> </td>
                </tr>
                <tr>
                    <td>사용자의 ID : </td>
                    <td id="outMemberID"> </td>
                </tr>
                <tr>
                    <td>사용자의 이름 : </td>
                    <td id="outMemberName"></td>
                </tr>
                <tr>
                    <td>사용자의 전화번호 : </td>
                    <td id="outMemberPhone"> </td>
                </tr>
                <tr>
                    <td>사용자의 성별 : </td>
                    <td id="outMemberGender"></td>
                </tr>
                <tr>
                    <td>사용자의 생일 : </td>
                    <td id="outMemberBirth"></td>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>


        <button type="button" id="toUpdateMemberBtn">수정</button>
        <button type="button" id="toMainBtn">수정하지 않고 목록으로</button>
        <button type="button" id="DeleteMemberBtn">선택한 사용자 삭제</button><br><br>
        <br><br>
    </div>


    <div id="updateMember">
        <br>
        <h4>회원 정보 수정</h4>
        <hr><br><br>
        <form id="updateForm" >
            아이디는 수정할 수 없습니다 : <input type="text" name="id" autocomplete="on" placeholder="이전 아이디 : " value="<c:out value="${member.id}"></c:out>" ><br>
            수정할 이름 : <input type="text" name="nm" autocomplete="off" placeholder="이전 이름 : " value="<c:out value="${member.name}"></c:out>" ><br>
            수정할 나이 : <input type="text" name="age" autocomplete="off" placeholder="이전 나이 : " value="<c:out value="${member.age}"></c:out>" ><br>
            수정할 전화번호 : <input type="text" name="phone" autocomplete="off" placeholder="이전 전화번호 : " value="<c:out value="${member.phone}"></c:out>" ><br>

            <button type="submit" id="saveBtnUpdateForm">수정</button>
            <button type="reset" id="goMainFromUpdate">수정하지 않고 메인으로 이동</button>
<%--            <button type="button" id="DeleteMemberBtn">선택한 사용자 삭제</button><br><br>--%>
        </form>
    </div>


    <div id="form-div">
        <div id="hide-form">
            <br>
            <hr>
            <h4>새 정보 입력</h4>
            <h6>각각 폼에 맞는 정보를 입력하세요.</h6>
            memberID : <input type="text" id="memberID"><br>
            memberName : <input type="text" id="memberName"><br>
            memberPhone : <input type="text" id="memberPhone"><br>
            memberGender : <input type="text" id="memberGender" placeholder="F or M"><br>
            memberBirth : <input type="text" id="memberBirth" placeholder="YYYY-MM-DD"><br>

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
    <button type="button" id="toTopButn">
        To page top
    </button>
</div>


<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script>

    $(function() {
        Mainlist();
        $("#form-div").hide();
        $("#detailDiv").hide();
        $("#updateMember").hide();

        // $("#tbody > tr").on("mouseover", 'tr', function(){
        //
        // })

        $("tbody > tr").click(function(){
            $(this).addClass("select");
            console.log('this -----------------> this : ',$(this) );
            //여기는 선택된 셀 앞에서 클릭을 했을 때, 수정 페이지로 넘어가는 화면. 이건 숨긴 데이터를 보여주는 걸로 만들어야 함.
            $(".select").click(function (data){

                // getDetagil();
                $("#detailDiv").show();
                $("#goAddMamber").hide();

            });
        })


    });


    function Mainlist(){

        //$("#tableDiv").show();

        $.ajax({
            url:"./main/list",
            type:"get",
            dataType:"json",

            success:function(result){
                console.log(result)

                $.each(result, function(index, item){


                    let tr = $('<tr/>', {
                        class : 'table_tr',
                        // class : null
                    });
                    let td_memberCodeNum =$('<td/>',{
                        text : item.memberCodeNum,
                    });

                    let td_memberID =$('<td/>',{
                        text : item.memberID,
                    });

                    let td_memberName =$('<td/>',{
                        text : item.memberName,
                    });

                    let td_memberPhone =$('<td/>',{
                        text : item.memberPhone,
                    });

                    let td_memberGender =$('<td/>',{
                        text : item.memberGender,
                    });

                    let td_memberBirth =$('<td/>',{
                        text : item.memberBirth,
                    });

                    tr.append(td_memberCodeNum);
                    tr.append(td_memberID);
                    tr.append(td_memberName);
                    tr.append(td_memberPhone);
                    tr.append(td_memberGender);
                    tr.append(td_memberBirth);

                    $('#tbody').append(tr);
                });
            }
        });


    }



    $("tr").mouseleave(function (e) {
        $(this).removeClass("select");
    });


    $("#goAddMamber").click(function(){
        $("#form-div").show();

        $("#goAddMamber").hide();

    });


    //클릭한 멤버 값 받아주는 것.
    function getDetail(){

        let memberCodeNum = $(this).memberCodeNum.val();
        let memberID = $(this).memberID.val();
        let memberName = $(this).memberName.val();
        let memberPhone = $(this).memberPhone.val();
        let memberGender = $(this).memberGender.val();
        let memberBirth = $(this).memberBirth.val();

        // let data = {
        //     "memberCodeNum" :memberCodeNum,
        //     "memberID" :memberID,
        //     "memberName" :memberName,
        //     "memberPhone" : memberPhone,
        //     "memberGender" :memberGender,
        //     "memberBirth" :memberBirth
        // }

        $("#outMemberCodeNum").text(memberCodeNum);
        $("#outMemberID").text(memberID);
        $("#outMemberName").text(memberName);
        $("#outMemberPhone").text(memberPhone);
        $("#outMemberGender").text(memberGender);
        $("#outMemberBirth").text(memberBirth);

    }

    $("#toMainBtn").click(function(){
        $("#detailDiv").hide();
        $("#goAddMamber").show();


    })

    $("#resetBtn").click(function(){
        $("#form-div").hide();
        console.log("resetBtn 클릭됨. 저장하지 않고 addMember 폼 닫힘. ");
        $("#goAddMamber").show();
    })


    $("#saveMember").click(function(){

        $("#form-div").hide();

        let memberID = $("#memberID").val();
        let memberName = $("#memberName").val();
        let memberPhone = $("#memberPhone").val();
        let memberGender = $("#memberGender").val();
        let memberBirth = $("#memberBirth").val();

        console.log(memberID, memberName, memberPhone, memberGender, memberBirth);

        let data = {
            "memberID" : memberID,
            "memberName" : memberName,
            "memberPhone" : memberPhone,
            "memberGender" :    (memberGender== "M") ?  memberGender :
                                (memberGender == "F" )? memberGender :
                                    alert("조건에 맞게 젠더를 입력하세용"),
            "memberBirth" :memberBirth
        }

        console.log(data);

        $.ajax({
            url:"/main/add",
            type:"post",
            //form 데이터로 받아오면서, bad request를 던져주게 만든 요인이 요있었음.
            data: JSON.stringify(data),
            dataType:"json",
            contentType:"application/json",
            async : false,
            success :function(data, response){

                console.log(response);
                alert("입력값 아이디만 확인"+data.memberID);
                $('#tableDiv').empty();
                Mainlist();
                $("#goAddMamber").show();

                },
            error:function(error){
                alert('데이터 값이 확인되지 않음'+error);
                $("#goAddMamber").show();
            }
        });
    });

    //테이블 클릭하면 디테일 보여주고 그걸 show member detail 페이지로 띄워주는 걸 만들려고 함. td의 text나 area가 클릭 가능하게 바뀌어야 한다.
    function tableClick(){
        alert("클릭됨");
    }

    //맨 처음으로 이동하는 함수.
    $("#toTopButn").click(function(){
        window.scrollTo(0,0);
        $("html, body").animate({
            scrollTop:0
        }, 500);
    });









</script>
</body>
</html>
