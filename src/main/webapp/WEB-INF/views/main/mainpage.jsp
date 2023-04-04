<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ajax refactoring</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/3653c6eb7b.js" crossorigin="anonymous"></script>
    <link href="${path}/resource/css/mainpage.css" type="text/css" rel="stylesheet">
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
                    <td class="update_input"><input type="text" id="updateID" size="100%" required></td>
                </tr>
                <tr>
                    <td>수정할 이름 입력</td>
                    <td class="update_input"><input type="text" size="100%" id="updateName" required></td>
                </tr>
                <tr>
                    <td>수정할 전화번호 입력</td>
                    <td class="update_input"><input type="text" id="updatePhone" size="100%" required></td>
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
                    <td><input type="text" id="memberID" required></td>
                </tr>
                <tr>
                    <td>사용자의 이름 : </td>
                    <td><input type="text" id="memberName" required></td>
                </tr>
                <tr>
                    <td>사용자의 전화번호 : </td>
                    <td>
                        <select name="memberPhone" id="memberPhoneFirst">
                            <option value="010" selected>010</option>
                            <option value="011">011</option>
                            <option value="012">012</option>
                            <option value="013">013</option>
                            <option value="014">014</option>
                            <option value="015">015</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>
                        -
                        <input type="text" name="memberPhone" id="memberPhoneSecond" required width="100px">
                        -
                        <input type="text" name="memberPhone" id="memberPhoneThird" required width="100px">
                    </td>
<%--                    <td><input type="text" id="memberPhone" required></td>--%>
                </tr>
                <tr>
                    <td>사용자의 성별 : </td>
                    <td>
                        <input type="radio" name="memberGender" value="F" checked>F
                        <input type="radio" name="memberGender" value="M">M
                    </td>
                </tr>
                <tr>
                    <td>사용자의 생일 : </td>
                    <td><input type="text" id="memberBirth" placeholder="YYYY-MM-DD" required></td>
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
<script src="${path}/resource/js/mainpage.js"></script>
</body>
</html>