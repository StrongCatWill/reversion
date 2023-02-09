<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
    <div id="detail-div">
        <h1>Detail</h1>
    </div>

</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

    $(function(){

        list();
        $('#detail-div').hide()

        $('#table-div').on('click', 'table tr.table_tr', function() {
            let id = $(this).find('td:eq(0)').text()
            console.log(id)
            goDetail(id)
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

                });

                $('#table-div').append(table)

                console.log(item.id);
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
            success :function (result){
                document.getElementById("text").innerHTML = result;
            }
        });
        /*콘솔은 개발자 도구에서 확인 가능. */
        console.log(id);
    }
</script>

</html>
