<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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

        table{
            width: 100%;
            border: 2px solid #6495EDFF;
            align-items: center;
            padding: 30px;
        }

        th, td{
            border: 1px solid #ffffff;
        }

        text{
            font-size: 20px;
            font-family: 'Times New Roman';
            color: #ffffff;
        }

    </style>
    <title>ajax testing page</title>
</head>
<body>
    <h1>AJAX TEST</h1>

    <div id="table-div">

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
</body>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%--
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
--%>
<script>

    $(function(){

        list();
        $('#detail-div').hide()

        $('#table-div').on('click', 'table tr.table_tr', function() {
            let id = $(this).find('td:eq(0)').text()
            console.log(id)
            postMessage(id)
            goDetail(id)
            console.log("detail.....");
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
</script>

</html>
