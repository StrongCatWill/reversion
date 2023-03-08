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
            /*font-family: Impact, Charcoal, sans-serif;*/
            border: 3px dotted #1f2029;
        }
        table{
            border: 3px solid #1f2029;
        }
        .select{
            background-color: #46A094;
            border: 0.5px solid black;
        }
        #outMemberCodeNum, #outMemberID, #outMemberName, #outMemberPhone, #outMemberGender, #outMemberBirth{
            font-size: 18px;
            color: #333333;
        }
        .update{
            font-weight: bold;
            font-size: large;
        }
    </style>
</head>
<body>
<h1 align="center">Member List Table</h1>

<div id="contents" align="center">

    <div id="tableDiv">
        <table id="listTable" width="70%">
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
        <form>
            <input type="hidden" value="" id="mode">
            <table id="detailTable" width="70%" border="1">
                <thead>
                <tr>
                    <td>사용자의 memberCodeNum : </td>
                    <td class="outMemberCodeNum"> </td>
                    <td class="update">수정할 정보 입력</td>
                    <td class="update_input">memberCode는 수정할 수 없습니다.</td>
                </tr>
                <tr>
                    <td>사용자의 ID : </td>
                    <td class="outMemberID"> </td>
                    <td class="update">수정할 ID 입력</td>
                    <td class="update_input"><input type="text" id="updateID" width="100%" height="100%"></td>
                </tr>
                <tr>
                    <td>사용자의 이름 : </td>
                    <td class="outMemberName"></td>
                    <td class="update">수정할 이름 입력</td>
                    <td class="update_input"><input type="text" id="updateName" width="100%" height="100%"></td>
                </tr>
                <tr>
                    <td>사용자의 전화번호 : </td>
                    <td class="outMemberPhone"> </td>
                    <td class="update">수정할 전화번호 입력</td>
                    <td class="update_input"><input type="text" id="updatePhone" width="100%" height="100%"></td>
                </tr>
                <tr>
                    <td>사용자의 성별 : </td>
                    <td class="outMemberGender"></td>
                    <td class="update"></td>
                    <td class="update_input">성별은 수정할 수 없습니다.</td>
                </tr>
                <tr>
                    <td>사용자의 생일 : </td>
                    <td class="outMemberBirth"></td>
                    <td class="update"></td>
                    <td class="update_input">생일은 수정할 수 없습니다.</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </form>


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
            아이디는 수정할 수 없습니다 : <input type="text" name="id" autocomplete="on"  value="<c:out value="${member.id}"></c:out>" ><br>
            수정할 이름 : <input type="text" name="nm" autocomplete="off" placeholder="이전 이름 : " value="<c:out value="${member.name}"></c:out>" ><br>
            수정할 나이 : <input type="text" name="age" autocomplete="off" placeholder="이전 나이 : " value="<c:out value="${member.age}"></c:out>" ><br>
            수정할 전화번호 : <input type="text" name="phone" autocomplete="off" placeholder="이전 전화번호 : " value="<c:out value="${member.phone}"></c:out>" ><br>

            <button type="submit" id="saveBtnUpdateForm">사용자 정보 수정</button>
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
    <br><br>
    <button type="button" id="goAddMamber">
        addMember
    </button>
    <button type="button" id="toTopButn">
        To page top
    </button>
    <button type="button" id="goDetail">
        Detail Member
    </button>
</div>


<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</body>
<script>

    $(function() {
        Mainlist();
        $("#form-div").hide();
        $("#detailDiv").hide();
        $("#updateMember").hide();
    });

    function Mainlist(){

        $.ajax({
            url:"./main/list",
            type:"get",
            dataType:"json",

            success:function(result){
                console.log(result)

                $.each(result, function(index, item){

                    let tr = $('<tr/>', {
                        class : 'target',
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


    $("#goAddMamber").click(function(){
        $("#form-div").show();
        $("#goAddMamber").hide();
    });



    $("#goDetail").click(function detail(e){
        $("#detailDiv").show();

        //detail에서 타고 넘어가야 하는 수정 관련 클래스와 버튼들.
        $("#toMainBtn").hide();
        $(".update").hide();
        $(".update_input").hide();

        $(".target").bind({
            mouseenter : function addSelect(){
                $(this).addClass("select");
                //버블링 멈추고 싶은데 밖에서 따로 제어하는 법을 모른다.
                // if($(this).click){
                //     if($("#toUpdateMemberBtn").click){
                //         if($("#toMainBtn").click){
                //             addSelect().stop();
                //         }
                //     }
                // }

            },  mouseleave : function(){
                $(this).removeClass("select");
            },  click : function(){


                const data01 = $(this).children().eq(0).text(); //memberCodeNum
                // alert(data01);
                const data02 = $(this).children().eq(1).text(); //memberID
                const data03 = $(this).children().eq(2).text(); //memberName
                const data04 = $(this).children().eq(3).text(); //memberPhone
                const data05 = $(this).children().eq(4).text(); //memberGender
                const data06 = $(this).children().eq(5).text(); //memberBirth

                getDetail(data01, data02, data03, data04, data05, data06);
            }
        })

        // update member(수정 버튼) 클릭한 경우, 여기서는 데이터베이스와 통해야 함. 위에서 선언한 데이터를 그대로 사용하기 위해 여기다가 선언했다
        $("#toUpdateMemberBtn").click(function(){
            // $("#updateMember").show(); //따로 만든 폼이었는데, 이거 없이 표 안에서 수정해보려고 주석 처리해줌.
            $(".update").show();    //update용 td 출력
            $(".update_input").show(); //update input 태그가 담기거나, 안내사항 출력
            $("#toMainBtn").show(); //수정하지 않고 목록으로 버튼 보여주기, 그냥 디테일만 조회할 때는 수정에 관한 로직이 끼어들면 안되니까 이렇게 처리

            const data01 =$("#outMemberCodeNum").text();
            const data02 = $("#outMemberID").text();
            const data03 = $("#outMemberName").text();
            const data04 = $("#outMemberPhone").text();

            //같은 updateMember 버튼을 쓰고 있었다. 같은 버튼에서 기능을 가르는 방법으로 만든 분기문.
            if( $("#mode").val() === "" ){
                $("#mode").val( "A" );
            }else{
                //updateMember 처리를 여기서 함.
                updateMember(data01, data02, data03, data04);
            }
        });
    })

    //클릭한 멤버 값 받아서 detail 창에 띄워주는 기능. ajax call X
    function getDetail(data01, data02, data03, data04, data05, data06){

        let memberCodeNum = data01;
        let memberID = data02;
        let memberName = data03;
        let memberPhone = data04;
        let memberGender = data05;
        let memberBirth = data06;


        $(".outMemberCodeNum").text(memberCodeNum);
        $(".outMemberID").text(memberID);
        $(".outMemberName").text(memberName);
        $(".outMemberPhone").text(memberPhone);
        $(".outMemberGender").text(memberGender);
        $(".outMemberBirth").text(memberBirth);
    }


    //getDetail 후, 수정 눌렀을 때 ajax 콜, 컨트롤러 처리를 위한 함수.
    function updateMember(data01, data02, data03, data04){
        console.log(data01);
        data01 = $(".outMemberCodeNum").text();
        let outMemberCodeNum = data01;

        let preID = data02; //바꿀 거랑 비교해줘야 하니까 여기 따로 변수 선언함. 얘들도 null로 들어왔을 가능성 농후함.
        let preName = data03;
        let prephone = data04;

        //update할 때, memberCodeNum을 PK로 잡고 들어가서 수정하는데, 그게 안 넘어가서 SQL 에러가 나는 것 같음
        // alert(outMemberCodeNum);
        let updateID = $("#updateID").val().trim();
        let updateName = $("#updateName").val().trim();
        let updatePhone = $("#updatePhone").val().trim();

        let data = {
            "memberCodeNum" : outMemberCodeNum,
            "memberID" : (updateID!=null) ? updateID : preID,
            "memberName" : (updateName!=null) ? updateName : preName,
            "memberPhone" : (updatePhone!=null) ? updatePhone
                            :(updatePhone.length()!=11) ? updatePhone : alert("11자리 전화번호 입력하세요. ")

        }

            $.ajax({
                url:"/main/update",
                type:"post",
                data: JSON.stringify(data),
                dataType:"json",
                contentType:"application/json",
                async : false,

                success :function(data, response){
                    console.log("data.updateID ------------------------------>"+data.memberID);

                    $(".update").hide();
                    $(".update_input").hide();

                    $('#tableDiv').empty();
                    $("mode").val("");
                    Mainlist();
                }
            })
    }

    $("#toMainBtn").click(function(){
        //시작 버튼으로 눌렀으니까, 멤버 호출하는 건 그만해주기.

        //입력되어있던 input값 지워주기.
        $("#updateID").val("");
        $("#updateName").val("");
        $("#updatePhone").val("");
        $("#mode").val("");

        $("#detailDiv").hide();
        $("#goAddMamber").show();

    })

    $("#resetBtn").click(function(){

        //입력한 값 지워주기.
        $("#memberID").val("");
        $("#memberName").val("");
        $("#memberPhone").val("");
        $("#memberGender").val("");
        $("#memberBirth").val("");

        $("#form-div").hide();

        console.log("resetBtn 클릭됨. 저장하지 않고 addMember 폼 닫힘. ");
        $("#goAddMamber").show();
    })


    //create member용
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
                                alert("Gender must be M or F"),
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

                console.log(data);
                $('#tableDiv').empty();
                $("#tableDiv").show();
                Mainlist();

                $("#goAddMamber").show();
            },
            error:function(error){
                alert('데이터 값이 확인되지 않음'+error);
                $("#goAddMamber").show();
            }
        });
    });

    //맨 처음으로 이동하는 함수.
    $("#toTopButn").click(function(){
        window.scrollTo(0,0);
        $("html, body").animate({
            scrollTop:0
        }, 500);
    });
</script>
</html>
