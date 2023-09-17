<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cpath}/resources/css/CompanyMember.css">
<link rel="stylesheet" href="${cpath}/resources/css/CompanyMemberJoin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	loadCompanyMemberList()
});
function loadCompanyMemberList(){
	$.ajax({
		url : "${cpath}/CompanyMemberList.do",
		type : "get",
		dataType : "json",
		success : makeList,
		error : function(){alert("error");}
	});
}
function makeList(data){
var listHtml1 = 	"<div id=list-all-container>";
listHtml1 += 	"<div id = 'title_container'>";
listHtml1 += 		"<div id = 'title'>";
listHtml1 += 			"<b><strong>▣ 병원 직원 관리</strong></b>";
listHtml1 += 		"</div>";
listHtml1 += 		"<div id = 'title_search'>";
listHtml1 += 			"<b><strong>직원명</strong></b>&nbsp;<input type='text'>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;";
listHtml1 += 			"<b><strong>사원번호</strong></b>&nbsp;<input type='text'>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;";
listHtml1 += 			"<b><strong>직책</strong></b>&nbsp;<input type='text'>&nbsp;&nbsp;&nbsp;&nbsp;";
listHtml1 += 			"<div>";
listHtml1 += 			"<button style = 'margin-left : 10px;'>조회</button>";
listHtml1 += 			"<button style = 'margin-left : 10px;' onclick='goJoin()'>직원 등록</button>";
listHtml1 += 			"</div>";
listHtml1 += 		"</div>";
listHtml1 += 	"</div>";<!--title_container 끝-->

var listHtml2 = 	"<div id='grid-container'>";
listHtml2 += 		"<div id='th-grid-item' style='border-top-left-radius: 10px;'>NO</div>";
listHtml2 += 	    "<div id='th-grid-item'>사원번호</div>";
listHtml2 += 	    "<div id='th-grid-item'>성명</div>";
listHtml2 += 	    "<div id='th-grid-item'>생년월일</div>";
listHtml2 += 	    "<div id='th-grid-item'>부서</div>";
listHtml2 += 	    "<div id='th-grid-item'>직책</div>";
listHtml2 += 	    "<div id='th-grid-item'>전화번호</div>";
listHtml2 += 	    "<div id='th-grid-item'>이메일</div>";
listHtml2 += 	    "<div id='th-grid-item'>주소</div>";
listHtml2 += 	    "<div id='th-grid-item'>입사일</div>";
listHtml2 += 	    "<div id='th-grid-item' style='border-top-right-radius: 10px;'>사진</div>";
$.each(data, function(index,obj){
	  // 클로저 : 외부 함수보다 내부함수에서 더 오래 사용될 때 자기유지 용도인거 같은데 함수 숨기는 거랑 무슨 의미차이인지 알아보자.
/*     (function() {
      var cmIdx = obj.cmIdx;
      var cmEmployeeNumber = obj.cmEmployeeNumber;
      var cmName = obj.cmName;
      var cmBirth = obj.cmBirth.split(' ')[0];
      var cmdepartment = obj.cmdepartment;
      var cmPosition = obj.cmPosition;
      var cmPhonNumber = obj.cmPhonNumber;
      var cmEmail = obj.cmEmail;
      var cmAddress = obj.cmAddress;
      var cmDateJoining = obj.cmDateJoining;
      var cmProfile = obj.cmProfile;
       */
listHtml2 += "<div id='grid-item'>" + obj.cmIdx + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmEmployeeNumber + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmName + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmBirth.split(' ')[0] + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmdepartment + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmPosition + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmPhonNumber + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmEmail + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmAddress + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmDateJoining.split(' ')[0] + "</div>";
listHtml2 += "<div id='grid-item'>" + obj.cmProfile + "</div>";
/*     })(); */
});
listHtml2 +=     "</div>";<!--그리드 컨테이너 끝-->
listHtml1 += "</div><!-- list-all-container 끝 -->";
$("#changeDiv1").html(listHtml1)
$("#changeDiv2").html(listHtml2);
	}<!--makeList 함수 끝-->
	
	function goJoin(){
	var joinForm = $("#JoinForm");
	if(joinForm.css("display") === "none"){ 
	   joinForm.css("display", "block"); //안보이게	
	}else{
	   joinForm.css("display", "none"); //보이게
	}
		
	 /* $("#JoinForm").css("display", "block"); //보이고
	    $("#changeDiv").css("display", "none"); //감추고 */
	}
/* function makeList 끝 */

</script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div id="changeDiv1"></div>
<div id="JoinForm" style="display:none;"><!-- Form Div -->
<!-- <hr> -->
	<form action="${cpath}/" method="post" enctype="multipart/form-data">
	<div id="join-title" style="display: inline-block;">
		<strong>&nbsp;직원 등록&nbsp;</strong>
	</div>
	<div id = "CompanyMemberJoinTableDiv">
			<table class="CompanyMemberJoinTable">
				<tr>
					<td>직원이름 : <input type="text" id= "cmName" name="cmName" maxlength="20" placeholder="아이디를 입력하세요"></td>
					<td>생년월일 : <input type="text" id= "cmBirth" name="cmBirth" maxlength="20" placeholder="생년월일을 입력하세요"></td>
					<td>전화번호 : <input type="text" id= "cmPhonNumber" name="cmPhonNumber" maxlength="20" placeholder="전화번호를 입력하세요"></td>
					<td>이메일 : <input type="text" id= "cmEmail" name="cmEmail" maxlength="20" placeholder="이메일을 입력하세요"></td>
					<td>주소 : <input type="text" id= "cmAddress" name="cmAddress" maxlength="20" placeholder="주소를 입력하세요"></td>
				</tr>
				<tr class="second-row">
					<td>부서 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" id= "cmdepartment" name="cmdepartment" maxlength="20" placeholder="부서를 입력하세요"></td>
					<td>직책 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" id= "cmPosition" name="cmPosition" maxlength="20" placeholder="직책을 입력하세요"></td>
					<td>입사일 &nbsp;&nbsp;&nbsp;:&nbsp; <input type="text" id= "cmDateJoining" name="cmDateJoining" maxlength="20" placeholder="입사일을 입력하세요"/></td>
					<td>
					<div style="border : 1px solid black; display : inline-block; padding : 0px 10px 0px 10px; background-color : #E2E2E2; border-radius: 5px; box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2); color : black;">
					<label for="cmProfile">프로필 사진 선택</label><input type="file" id="cmProfile" name="cmProfile" style="display:none;">
					</div>
					</td>
				</tr>	
				<tr>
					<td>
						<input type="button" value="등록" style="color : white; background-color : #007BFF; border-radius: 5px;">
						<input type="button" value="수정" style="color : white; background-color : #007BFF; border-radius: 5px;">
						<input type="reset" value="취소" style="color : white; background-color : grey; border-radius: 5px;">
					</td>
				</tr>
			</table>
				<hr>
	</form>
	</div>
</div>
<div id="changeDiv2"></div>
</body>
</html>