<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ajax refactoring</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/3653c6eb7b.js" crossorigin="anonymous"></script>
    <style>
        body{
            background-color: #adc0b7;
        }
        #detailDiv, #form-div{
            align-self: center;
            background-color: #46A094;
            border: 2px solid #46A094;
        }
        input{
            width: 100%;
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

        .outMemberCodeNum, .outMemberID, .outMemberName, .outMemberPhone, .outMemberGender, .outMemberBirth{
            font-size: 18px;
            color: #333333;
        }

        div.paging{
            width: 100%;
            display: inline-flex;
            align-items: center;
            margin-top: 20px;
            justify-content: center;
        }

        div.paging>i,
        div.paging>div{
            font-size: 20px;
            margin: 0 10px;
        }

        div.paging>i,
        div.paging>div.pages>span{
            margin: 0 3px;
            cursor: pointer;
        }

        .pages>span{
            font-size: 20px;
            cursor: pointer;
            margin: 10px;
        }

        span.active{
            color: #b2876f;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1 align="center">Member List Table</h1><br><br>

<div id="contents" align="center">

    <div id="tableDiv">
        <table id="listTable" width="70%">
            <thead>
                <tr>
                <th>memberCodeNum</th>
                <th>memberID</th>
                <th>memberName</th>
                <th>memberPhone</th>
                <th>memberGender</th>
                <th>memberBirth</th>
                </tr>
            </thead>
            <tbody id="tbody" class="test">
            </tbody>
        </table>

        <div class="paging">
            <br><br>
            <i class="fa-solid fa-angles-left" id="first_page"></i>
            <i class="fa-solid fa-chevron-left" id="prev_page"></i>

            <div id="pages">

            </div>
            <i class="fa-solid fa-angle-right" id="next_page"></i>
            <i class="fa-solid fa-angles-right" id="last_page"></i>

            <select name="dataPerPage">
                <option value="5" selected>5개씩 보기</option>
                <option value="10">10개씩 보기</option>
                <option value="15">15개씩 보기</option>
            </select>
        </div>

    </div>
    <div>
        <br><br>
    </div>

    <div id="detailDiv">
        <br><br><br>
        <h5><br>선택한 사용자의 세부 정보입니다. <br> 수정 버튼을 누르면 사용자 정보를 수정합니다. </h5>
        <hr>
        <form id="detailForm">
            <input type="hidden" value="" class="mode">
            <table id="detailTable" width="70%" border="1">
                <thead>
                <tr>
                    <td id="guideMemberCodeNum">사용자의 memberCodeNum : </td>
                    <td class="outMemberCodeNum"> </td>
                </tr>
                <tr>
                    <td id="guideMemberID">사용자의 ID : </td>
                    <td class="outMemberID"> </td>
                </tr>
                <tr>
                    <td id="guideMemberName">사용자의 이름 : </td>
                    <td class="outMemberName"></td>
                </tr>
                <tr>
                    <td id="guideMemberPhone">사용자의 전화번호 : </td>
                    <td class="outMemberPhone"> </td>
                </tr>
                <tr>
                    <td id="guideMemberGender">사용자의 성별 : </td>
                    <td class="outMemberGender"></td>
                </tr>
                <tr>
                    <td id="guideMemberBirth">사용자의 생일 : </td>
                    <td class="outMemberBirth"></td>
                </tr>
                </thead>
            </table>
        </form>

        <form id="updateForm">
            <input type="hidden" value="" class="mode">
            <table id="updateTable" width="70%" border="1">
                <thead>
                <tr>
                    <td>memberCode는 수정할 수 없습니다.</td>
                    <td class="outMemberCodeNum2"> </td>
                </tr>
                <tr>
                    <td>수정할 ID 입력</td>
                    <td class="update_input"><input type="text" id="updateID" size="100%"></td>
                </tr>
                <tr>
                    <td>수정할 이름 입력</td>
                    <td class="update_input"><input type="text" size="100%" id="updateName"></td>
                </tr>
                <tr>
                    <td>수정할 전화번호 입력</td>
                    <td class="update_input"><input type="text" id="updatePhone" size="100%"></td>
                </tr>
                <tr>
                    <td>성별은 수정할 수 없습니다.</td>
                    <td class="outMemberGender"></td>
                </tr>
                <tr>
                    <td>생일은 수정할 수 없습니다.</td>
                    <td class="outMemberBirth"></td>
                </tr>
                </thead>
            </table>
        </form>


        <button type="button" id="toUpdateMemberBtn">수정</button>
        <button type="button" id="submitUpdate">수정</button>
        <button type="button" id="DeleteMemberBtn">선택한 사용자 삭제</button>
        <button type="button" id="closeDetailDiv">창 닫기</button><br><br>
        <br><br>
    </div>


    <div id="form-div">
        <h5>새 사용자 정보 입력</h5>
        <h6>각각 폼에 맞는 정보를 입력하세요.</h6><br>
        <hr>
        <table width="70%" border="1">
            <thead>
                <tr>
                    <td>사용자의 ID : </td>
                    <td><input type="text" id="memberID"></td>
                </tr>
                <tr>
                    <td>사용자의 이름 : </td>
                    <td><input type="text" id="memberName"></td>
                </tr>
                <tr>
                    <td>사용자의 전화번호 : </td>
                    <td><input type="text" id="memberPhone"></td>
                </tr>
                <tr>
                    <td>사용자의 성별 : </td>
                    <td><input type="text" id="memberGender" placeholder="F or M"></td>
                </tr>
                <tr>
                    <td>사용자의 생일 : </td>
                    <td><input type="text" id="memberBirth" placeholder="YYYY-MM-DD"></td>
                </tr>
            </thead>
        </table>
        <div id="buttonDiv">
            <button type="submit" onclick="" value="저장" id="saveMember">저장</button>
            <button type="reset" id="resetBtn">저장하지 않고 창 닫기</button>
        </div>
        <br>
    </div>

    <hr>
    <button type="button" id="goAddMamber">
        addMember
    </button>
    <br><br><br>
</div>


<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script>

    $(function() {
        initMember();
        $("#tbody").empty();
        $("#pages").empty();
        MainList(dataPerPage, globalCurrentPage);
        $("#form-div").hide();
        $("#detailDiv").hide();
        $("#updateForm").hide();
    });

    //------------------------전역변수 구역-----------------
    //delete와 update를 사용하기 위해서는 같은 변수가 여러번 사용된다. 먼저 전역변수로 선언해주고, 재할당해서 사용하기로 했다.
    //재할당하는 거니까, 검사 철저하게 해주기.
    let memberCodeNum = null;
    let memberID = null;
    let memberName = null;
    let memberPhone = null;
    let memberGender = null;
    let memberBirth = null;

    let totalData;                  //총 데이터 수, Mainlist에서 구해져서 떨어짐.(totalData.length로 써야 함.)
    let dataPerPage = $("select[name=dataPerPage]").val();      //한 페이지에 나타낼 멤버 row 수, 기본값으로 설정함.
    let pageCount;                  //페이징에 나타낼 페이지 수
    let globalCurrentPage =1;       //현재 페이지

    let offset = Math.abs(globalCurrentPage-1)*dataPerPage;
    let limit = dataPerPage;




    function MainList(dataPerPage, globalCurrentPage){


        $("#tbody").empty();
        initMember();
        $("#pages").empty();


        limit = dataPerPage;
        offset = Math.abs(globalCurrentPage-1)*dataPerPage;


        //전체 데이터를 불러오려고 만든 ajax get call
        $.ajax({

            url:"./main/whole",
            type:"get",
            dataType:"json",
            //전체 데이터 불러오는 ajax call
            success:function(result){

                // console.log("전체 데이터 불러온 것 :: "+result);     //뱉는 memberlist의 정보, 길이값. object의 형태로 들어온다.
                // console.log("받아온 dataPerPage :: "+dataPerPage);

                //페이징 처리를 위한 전체 데이터 값 반환
                totalData = Math.abs(result.length);
                pageCount = totalData/dataPerPage;

                //2로 시작해야 append 될 때 1부터 그려짐
                let PagingIndex = 2;

                //전체 데이터 길이를 한 페이지당 데이터 수로 나눈 값이 0일 때, PagingIndex는 1~몫까지 생성되어야 함.
                if((pageCount)===0){

                    for(PagingIndex; PagingIndex<pageCount+1; PagingIndex++){
                        let $pagesNum = $("<span> "+(PagingIndex-1)+" </span>");
                        $("#pages").append($pagesNum);
                    }
                    //전체 데이터 길이를 한 페이지당 데이터 수로 나눈 값이 0이 아닐 때 PagingIndex는 1~몫+1까지 생성되어야 함.
                }else{
                    for(PagingIndex; PagingIndex<pageCount+2;PagingIndex++){
                        let $pagesNum = $("<span> "+(PagingIndex-1)+" </span>");
                        $("#pages").append($pagesNum);
                    }   //for문 end
                }   //else문 end


                //현재 페이지에 css가 들어있는 Class 주기
                $("#pages span").removeClass("active");
                $TargetIndex = $("#pages span").eq(globalCurrentPage-1);
                $TargetIndex.addClass("active");
                return [totalData, pageCount];

                },  //whole url success end
            error:function(error){
                alert("failed whole url loading");
            }
        }); //whole url ajax call end

        $.ajax({

            url:"/main/list",
            type:"get",
            dataType:"json",
            data : {
                "limit" : dataPerPage,
                "offset" : Math.abs(globalCurrentPage-1)*dataPerPage
            },

            success:function(success){

                // console.log("1페이지에 출력하는 Array :: "+success)     //뱉는 memberlist의 정보, 길이값. object의 형태로 들어온다.

                $.each(success, function(index, item){

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

                }); //each문 끝


            }   //pagination success end
        })  //main url ajax call end
    }   //mainlist function end



    // crud 영역
    {
        $(document).on("mouseenter", ".target", function(){
            $(this).addClass("select");
        });

        $(document).on("mouseleave", ".select", function(){
            $(this).removeClass("select");
        });



        //선택된 값을 가지고 update를 하는 것.

        $(document).on("click", ".select", function(){

            $("#resetBtn").trigger("click");


            memberCodeNum = $(this).children().eq(0).text(); //memberCodeNum
            // alert(data01);
            memberID = $(this).children().eq(1).text(); //memberID
            memberName = $(this).children().eq(2).text(); //memberName
            memberPhone = $(this).children().eq(3).text(); //memberPhone
            memberGender = $(this).children().eq(4).text(); //memberGender
            memberBirth = $(this).children().eq(5).text(); //memberBirth

            // console.log("클릭한 멤버 이름 : "+memberName+", 클릭한 멤버 ID : "+memberID);

            $("#detailDiv").show();
            initDetailAndUpdate();

            getDetail(memberCodeNum, memberID, memberName, memberPhone, memberGender, memberBirth);

            $("#goAddMamber").hide();
            $("#toUpdateMemberBtn").show();
            $("#submitUpdate").hide();
        });

        //detailFrom을 닫고 update 폼을 여는 기능임. 선택한 멤버의 정보를 넘겨주는 것이 중요하다.
        $("#toUpdateMemberBtn").click(function(){

            // switchUpdateForm();
            $("#detailForm").hide();
            $("#updateForm").show();

            initMember();
            var newCodeNum = $(".outMemberCodeNum").text();
            // console.log(newCodeNum);

            $("#outMemberCodeNum2").text(newCodeNum); //아래 수정폼에 보이게 만드는 건데

            memberCodeNum =newCodeNum;
            memberID = $("#outMemberID").text();
            memberName = $("#outMemberName").text();
            memberPhone = $("#outMemberPhone").text();

            //같은 updateMember 버튼을 쓰고 있었다. 같은 버튼에서 기능을 가르는 방법으로 만든 분기문.
            if( $(".mode").val() === null ){
                $(".mode").val(" A ");
            }else{
                //수정하기 버튼 보여주고
                $("#submitUpdate").show();

                $("#toUpdateMemberBtn").hide();

                //수정 버튼을 눌렀을 때 수정 진행
                $("#submitUpdate").click(function(){

                    updateMember(memberCodeNum, memberID, memberName, memberPhone);

                    if($(".select").click){
                        $("#submitUpdate").hide();
                        $("#toUpdateMemberBtn").show();

                        $("#detailDiv").hide();
                        initDetailAndUpdate();
                    }
                })
            }
        });


        $("#DeleteMemberBtn").click(function(){

            initMember();
            memberCodeNum = $("#outMemberCodeNum").text();
            memberName = $("#outMemberName").text();

            deleteMemberConfirm();
        });


        $("#closeDetailDiv").click(function(){

            $("#toUpdateMemberBtn").show();
            $("#goAddMamber").show();
            $("#detailDiv").hide();
            initDetailAndUpdate();
            initUpdate();

        });

        $("#goAddMamber").click(function(){

            $("#form-div").show();
            $("#goAddMamber").hide();

        });

        //클릭한 멤버 값 받아서 detail 창에 띄워주는 기능. ajax call X
        function getDetail(memberCodeNum, memberID, memberName, memberPhone, memberGender, memberBirth){

            initMember();

            $(".outMemberCodeNum").text(memberCodeNum);
            $(".outMemberID").text(memberID);
            $(".outMemberName").text(memberName);
            $(".outMemberPhone").text(memberPhone);
            $(".outMemberGender").text(memberGender);
            $(".outMemberBirth").text(memberBirth);

            //여기에 delete로 넘겨줄 memberCodeNum가 있으니 delete의 실제적인 펑션을 넣어야 함.
        }


        //getDetail 후, 수정 눌렀을 때 ajax 콜, 컨트롤러 처리를 위한 함수.
        function updateMember(memberCodeNum, memberID, memberName, memberPhone){

            // console.log("updateMember------------------------------------------>"+memberCodeNum);

            memberName =  $(".outMemberName").text();

            let preID = memberID; //바꿀 거랑 비교해줘야 하니까 여기 따로 변수 선언함. 얘들도 null로 들어왔을 가능성 농후함.
            let preName = memberName;
            let prephone = memberPhone;

            //update할 때, memberCodeNum을 PK로 잡고 들어가서 수정하는데, 그게 안 넘어가서 SQL 에러가 나는 것 같음
            let updateID = $("#updateID").val().trim();
            let updateName = $("#updateName").val().trim();
            let updatePhone = $("#updatePhone").val().trim();

            // //로직 검사에 쓸 데이터
            let data = {
                "memberCodeNum" : memberCodeNum,
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

                    $("#detailDiv").hide();
                    $(".mode").val(null);

                    $("#detailTable").show();
                    $("#updateForm").hide();

                    $("#tbody").empty();
                    MainList(dataPerPage, globalCurrentPage);

                    initMember();
                    initUpdate();
                    initDetailAndUpdate();
                }
            })
        }


        $("#resetBtn").click(function(){

            initAddForm();
            // console.log("resetBtn 클릭됨. 저장하지 않고 addMember 폼 닫힘. ");

        })

        //create member용
        $("#saveMember").click(function(){

            $("#form-div").hide();

            memberID = $("#memberID").val();
            memberName = $("#memberName").val();
            memberPhone = $("#memberPhone").val();
            memberGender = $("#memberGender").val();
            memberBirth = $("#memberBirth").val();

            // console.log(memberID, memberName, memberPhone, memberGender, memberBirth);

            let data = {
                "memberID" : memberID,
                "memberName" : memberName,
                "memberPhone" : memberPhone,
                "memberGender" :    (memberGender== "M") ?  memberGender :
                    (memberGender == "F" )? memberGender :
                        alert("Gender must be M or F"),
                "memberBirth" :memberBirth
            }

            // console.log(data);

            $.ajax({
                url:"/main/add",
                type:"post",
                data: JSON.stringify(data),
                dataType:"json",
                contentType:"application/json",
                success :function(data){

                    initAddForm();
                    $("#last_page").trigger("click");
                    $("#detailForm").hide();
                },
                error:function(error){
                    alert('에러 발생 :: '+error);

                    $("#form-div").hide();
                    initAddForm();
                }
            });

            $("#form-div").hide();
        });

        function deleteMemberConfirm(){

            memberCodeNum = $(".outMemberCodeNum").text();
            memberName = $(".outMemberName").text();

            var DeleteConfirm = confirm(memberName+" 사용자를 삭제하시겠습니까?");

            if(DeleteConfirm==true){
                alert(memberName+"사용자 삭제 진행");
                deleteMember(memberCodeNum);
            }else{
                alert("취소.");
            }
            $("closeDetailDiv").trigger("click");
        }

        function deleteMember(memberCodeNum){

            let data = {
                "memberCodeNum" : memberCodeNum,
            }

            $.ajax({

                url:"/main/delete",
                type:"post",
                //data01은 text타입으로 들어왔다.
                data:JSON.stringify(data),
                dataType:"json",
                contentType:"application/json",

                success :function(data){
                    data = null;
                    initMember();

                    MainList(dataPerPage, globalCurrentPage);

                    initUpdate();
                    initDetailAndUpdate();
                    $("#goAddMamber").show();
                },error:function(data, error){

                    alert('에러 발생 :: '+error + "넘어온 데이터 확인 " + data.memberID);
                    $("#form-div").hide();
                }
            })
            $("closeDetailDiv").trigger("click");
        }

        //-------------------------init 구역-----------------------------------------------------
        //add 창에서 저장하거나, 저장하지 않을 때 폼의 input 태그 내 입력값을 지우고 form div를 지우는 함수
        function initAddForm(){
            $("#memberID").val(null);
            $("#memberName").val(null);
            $("#memberPhone").val(null);
            $("#memberGender").val(null);
            $("#memberBirth").val(null);

            $("#form-div").hide();
            $("#goAddMamber").show();
        }

        function initUpdate(){
            //입력되어있던 input값 지워주기.

            $("#updateID").val(null);
            $("#updateName").val(null);
            $("#updatePhone").val(null);
            $(".mode").val(null);

            $("#detailDiv").hide();
            $("#goAddMamber").show();
        }

        function initDetailAndUpdate(){
            $("#updateForm").hide();
            $("#detailForm").show();
        }


        function initMember(){
            memberCodeNum = null;
            memberID = null;
            memberName = null;
            memberPhone = null;
            memberGender = null;
            memberBirth = null;
        }
    }


    // -----------------------------------------paging 구역-------------------------------------------------------------
    {
        //동적으로 생성된 #pages Div 안의 <span>에 이벤트 걸기. -----------> globalCurrentPage 변경됨. 이걸 trigger 할 수만 있으면 좋은데,, this를 어떻게 지정하지?
        $("#pages").on("click", "span", function(){

            $("#resetBtn").trigger("click");

            globalCurrentPage = $(this).text().trim()*1;

            MainList(dataPerPage, globalCurrentPage);

            lastIndex = $("#pages").children().last().text().trim()*1;

        });

        //한 페이지당 몇 row까지 표시할 건지 select 태그에서 변경되는 값을 잡는 getPageIndexNum
        $("select[name=dataPerPage]").change(function getPageIndexNum(){

            $("#resetBtn").trigger("click");

            dataPerPage = $(this).val();
            globalCurrentPage = 1;

            MainList(dataPerPage, globalCurrentPage);
        });

        // 버튼 클릭으로 페이지 이동 구역
        {
            //이전 페이지로 이동
            $("#prev_page").click(function(){

                $("#resetBtn").trigger("click");

                globalCurrentPage--;

                if(globalCurrentPage<1){
                    alert("Can't move previous page. This is the start of pages");
                    globalCurrentPage = 1;
                }else{
                    MainList(dataPerPage, globalCurrentPage);
                }
            });

            // 다음 페이지로 이동
            $("#next_page").click(function(){

                $("#resetBtn").trigger("click");

                globalCurrentPage++;
                let lastIndex = $("#pages").children().last().text().trim()*1;

                if(globalCurrentPage > lastIndex){
                    globalCurrentPage = lastIndex;
                    alert("Can't move next page. This is the end of pages");
                }else{
                    MainList(dataPerPage, globalCurrentPage);
                }
            });

            //첫번째 페이지로 이동
            $("#first_page").click(function (){
                $("#resetBtn").trigger("click");
                MainList(dataPerPage, 1);
            });


            //마지막 페이지로 이동
            $("#last_page").click(function(){

                $("#resetBtn").trigger("click");
                lastIndex = $("#pages span").last().text().trim()*1;
                globalCurrentPage = lastIndex;
                MainList(dataPerPage, globalCurrentPage);

            });
        }// 버튼 클릭으로 페이지 이동 구역 끝
    }
</script>
</body>
</html>