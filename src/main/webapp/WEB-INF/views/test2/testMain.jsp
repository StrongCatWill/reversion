<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <title>ajax testing page</title>
</head>
<body>
    <h1>AJAX TEST</h1>

    <div id="table-div" class="col-xs-8">

    </div>

<%--
    div로 감싸놨기 때문에 얘를 id로 호출해줘야 이 그룹이 보여진다. table-div를 보여주는 방식은
    $('#table-div').on('click', 'table tr.table_tr', function() {
            let id = $(this).find('td:eq(0)').text()
            console.log(id)
            goDetail(id)
        });
        처럼 부르는 듯.
--%>

    <div id="select_table">
    </div>

    <div id="form-div"></div>
    <button id="btnGoForm">Add Member</button>
<div id="templateInput" style="display:none">
    dfgdfg
</div>
</body>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%--
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
--%>

<script>

    /*페이지 로딩되자 마자 콜링되는 펑션*/
    $(function(){

        list();
        /*로딩됐을 때 detail과 form은 숨겨지도록. */
        $('#detail-div').hide()
        $('#form-div').hide()

        $('#table-div').on('click', 'table tr.table_tr', function() {
            let id = $(this).find('td:eq(0)').text()
            console.log(id)
            postMessage(id)
            goDetail(id)
            console.log("detail.....");
        });

        /*버튼 클릭하면 멤버 등록 페이지로 이동시킴.*/
        $('#btnGoForm').on('click', function (){
            goForm();
        });


    })

    function list() {

        $.ajax({
            url:"/test2/list",
            type:"get",
            dataType: "json",
            success :function (result){
                console.log(result)

                let table = $('<table/>');

                /*console.log("llll", table);*/

                $.each(result, function(index, item) {
                    let tr = $('<tr/>',{
                        class : 'table_tr'
                    });

                    let td_id = $('<td/>',{
                        text : item.id
                    });

                    let td_name = $('<td/>',{
                        text : item.name
                    });

                    let td_age = $('<td/>',{
                        text : item.age
                    });

                    let td_phone = $('<td/>',{
                        text : item.phone
                    });

                    tr.append(td_id)
                    tr.append(td_name)
                    tr.append(td_age)
                    tr.append(td_phone)

                    table.append(tr);

                    console.log(item.id);
                });

                $('#table-div').append(table)


/*                아이디를 찍으면 선택한 아이디가 넘어오기는 함. */
            }
        });
    }

    function goDetail(id){

        $('#detail-div').show();
        $('#table-div').hide();

        $.ajax({
            url:"/test2/detail",
            type:"post",
            data: {"id": id},
            dataType: "json",


            success :function (result) {

                console.log(result);
                console.log("통신 성공");

                let select_table = $('<table/>');

                console.log("dddd", select_table);

                // function detail_show (index, data) {
                //     console.log("data", data);
                    let tr_detail = $('<tr/>', {
                        class: 'table_detail_tr'
                    });

                    let td_select_id = $('<td/>', {
                        text: result.id
                    });

                    let td_select_name = $('<td/>', {
                        text: result.name
                    });

                    let td_select_age = $('<td/>', {
                        text: result.age
                    });

                    let td_select_phone = $('<td/>', {
                        text: result.phone
                    });

                    tr_detail.append(td_select_id);
                    tr_detail.append(td_select_name);
                    tr_detail.append(td_select_age);
                    tr_detail.append(td_select_phone);

                    select_table.append(tr_detail);
                    $('#select_table').append(tr_detail);
                // }
            }
        });

        /*콘솔은 개발자 도구에서 확인 가능. */
        console.log(id);
        $('#detail-div').append(select_table)
    }

    function goForm(){
        $('#form-div').show()

        $('#table-div').hide()
        $('#select_table').hide()

        $.ajax({
            url:"/test2/form",
            type:"post",
            dataType: "json",

            success :function form(result) {

                console.log(result);
                console.log("from 페이지와 통신 성공");

                let formFor
            }
        });


    }
</script>

</html>
