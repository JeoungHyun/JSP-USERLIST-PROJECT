<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<style>
.blinking{
  -webkit-animation: blink 0.5s ease-in-out infinite alternate;
  -moz-animation: blink 0.5s ease-in-out infinite alternate;
  animation: blink 0.5s ease-in-out infinite alternate;
}

@-webkit-keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}

@-moz-keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}

@keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}

</style>

<title>JSP PROJECT</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<style type="text/css">
table {
	border: 0px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: left;
}

thead {
	font-weight: bold;
	color: #fff;
	/* background: #4e73df; */
 	/* background: #42221f;  */
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

td {
	border-bottom: 0px solid rgba(0, 0, 0, .1);
	background: #fff;
}

a {
	/* color: #73685d; */
	color: black;
}
.btn-primary{
	background-color :"${color}";
}


</style>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script type="text/javascript">



	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		console.log(pageNo);
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/main.do'/>";
		document.listForm.submit();
	}

	function on_click() {
		var arr = $('input[name=_selected_]:checked').serializeArray().map(
				function(item) {
					return item.value
				});
	
	}
	$(document).ready(function() {
		$('input[name=_selected_all_]').on('change', function() {
			$('input[name=_selected_]').prop('checked', this.checked);
		});
		$("#searchKeyword").focus();
		
		var button =document.getElementsByClassName("btn-primary");
		for(var i = 0 ; i < button.length ; i++){
			button[i].style.backgroundColor = "${color}"
			button[i].style.border = '0px';
		}
		var thead = document.getElementsByTagName("thead");
		thead[0].style.backgroundColor="${color}";
		
		var sidebar = document.getElementById("accordionSidebar");
		sidebar.style.backgroundImage = "linear-gradient(180deg,${color} 10%,#224abe 100%)";
		if("${color}" == "#d3be46"){
			sidebar.style.backgroundImage = "linear-gradient(180deg,#d3be46 10%,#f1e54a 100%)";
		}
		if("${color}" == "#139d82"){
			sidebar.style.backgroundImage = "linear-gradient(180deg,#139d82 10%,#89bba9 100%)";
		}
		
	})

	function userDelete() {

		var arr = $('input[name=_selected_]:checked').serializeArray().map(
				function(item) {
					return item.value
				});
		if (arr.length == 0) {
			alert("사용자를 선택해주세요.");
			return;
		}
		if (confirm(arr.length + "명에 사용자를 삭제 하겠습니까?")) {
			var userList = [];
			$('input[name=_selected_]:checked').each(function(item) {
				userList.push($(this).val())
			});

			var param = {
				userList : arr
			}
			$
					.ajax({ //anyne:true,
						url : "userDel.ajax",
						traditional : true,
						type : "POST",
						data : param,
						dataType : "text",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data) {
							if (data == 'ok') {
								alert("시용자가 삭제 되었습니다.");
								location.href = "main.do"
							}
						},
						error : function(data) {
							alert("사용자 등록이 실패 하였습니다.");
						}
					})
		} else {
			return;
		}
	}

	function userMod() {
		var arr = $('input[name=_selected_]:checked').serializeArray().map(
				function(item) {
					return item.value
				});
		if (arr.length == 0) {
			alert("사용자를 선택해주세요.");
			return;
		}
		if (arr.length > 1) {
			alert("한명에 사용자만 선택해주세요.")
			return;
		}
		location.href = "modifyUser.do?userId=" + arr[0]

	}
	
	function selectBoxChage(value){
		$("#searchKey").val(value);
		
	}
	
	function searchKeywordOnblur(event){

		$("#searchKeyword").removeClass("blinking");
	}
	function searchKeywordOnFoucs(event){

		if($("#searchKeyword").val() ==""){
			$("#searchKeyword").addClass("blinking");
		}else{
			$("#searchKeyword").removeClass("blinking");
		}
	}
	function searchKeywordOnKeyUp(){

		if($("#searchKeyword").val() != ""){
			$("#searchKeyword").removeClass("blinking");
		}else{
			$("#searchKeyword").addClass("blinking");
		}
	}
	
	function ChangeColor1(){
		var button =document.getElementsByClassName("btn-primary");
		for(var i = 0 ; i < button.length ; i++){
			button[i].style.backgroundColor = '#596895';
			button[i].style.border = '0px';
		}
		var thead = document.getElementsByTagName("thead");
		thead[0].style.backgroundColor='#596895';
		
		var sidebar = document.getElementById("accordionSidebar");
		sidebar.style.backgroundImage = "linear-gradient(180deg,#596895 10%,#224abe 100%)";
		
		var param = { color:"#596895" };
		
		$.ajax({ //anyne:true,
			url : "changeColor.ajax",
			traditional : true,
			type : "POST",
			data : param,
			dataType : "text",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				
			},
			error : function(data) {
				
			}
		})
	}
	function ChangeColor2(){
		var button =document.getElementsByClassName("btn-primary");
		for(var i = 0 ; i < button.length ; i++){
			button[i].style.backgroundColor = '#310d14';
			button[i].style.border = '0px';
		}
		var thead = document.getElementsByTagName("thead");
		thead[0].style.backgroundColor='#310d14';
		
		var sidebar = document.getElementById("accordionSidebar");
		sidebar.style.backgroundImage = "linear-gradient(180deg,#310d14 10%,#224abe 100%)";
		var param = { color:"#310d14" };
		
		$.ajax({ //anyne:true,
			url : "changeColor.ajax",
			traditional : true,
			type : "POST",
			data : param,
			dataType : "text",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				
			},
			error : function(data) {
				
			}
		})
	}
	function ChangeColor3(){
		var button =document.getElementsByClassName("btn-primary");
		for(var i = 0 ; i < button.length ; i++){
			button[i].style.backgroundColor = '#139d82';
			button[i].style.border = '0px';
		}
		var thead = document.getElementsByTagName("thead");
		thead[0].style.backgroundColor='#139d82';
		
		var sidebar = document.getElementById("accordionSidebar");
		sidebar.style.backgroundImage = "linear-gradient(180deg,#139d82 10%,#89bba9 100%)";
		var param = { color:"#139d82" };
		
		$.ajax({ //anyne:true,
			url : "changeColor.ajax",
			traditional : true,
			type : "POST",
			data : param,
			dataType : "text",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				
			},
			error : function(data) {
				
			}
		})
	}
	function ChangeColor4(){
		var button =document.getElementsByClassName("btn-primary");
		for(var i = 0 ; i < button.length ; i++){
			button[i].style.backgroundColor = '#4e73df';
			button[i].style.border = '0px';
		}
		var thead = document.getElementsByTagName("thead");
		thead[0].style.backgroundColor='#4e73df';
		
		var sidebar = document.getElementById("accordionSidebar");
		sidebar.style.backgroundImage = "linear-gradient(180deg,#4e73df 10%,#224abe 100%)";
		var param = { color:"#4e73df" };
		
		$.ajax({ //anyne:true,
			url : "changeColor.ajax",
			traditional : true,
			type : "POST",
			data : param,
			dataType : "text",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				
			},
			error : function(data) {
				
			}
		})
	}
	function ChangeColor5(){
		var button =document.getElementsByClassName("btn-primary");
		for(var i = 0 ; i < button.length ; i++){
			button[i].style.backgroundColor = '#d3be46';
			button[i].style.border = '0px';
			
		}
		var thead = document.getElementsByTagName("thead");
		thead[0].style.backgroundColor='#d3be46';
		
		
		var sidebar = document.getElementById("accordionSidebar");
		sidebar.style.backgroundImage = "linear-gradient(180deg,#d3be46 10%,#f1e54a 100%)";
		var param = { color:"#d3be46" };
		
		$.ajax({ //anyne:true,
			url : "changeColor.ajax",
			traditional : true,
			type : "POST",
			data : param,
			dataType : "text",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				
			},
			error : function(data) {
				
			}
		})
	}
	
	
</script>

</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="main.do">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">JSP PROJECT</div>
			</a>



			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">사용자 관리</div>



			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link" href="main.do">
					<i class="fas fa-fw fa-table"></i> <span>사용자 목록</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="registerUser.do"> <i class="fas fa-fw fa-plus-square"></i>
					<span>사용자 등록</span></a></li>

			<!-- Divider -->
		</ul>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<div onclick="ChangeColor1()" style="left:97%; cursor:pointer; top:10px; background-color:#596895; width: 20px; height: 20px; position: Absolute; border-radius: 20px;"></div>
				<div onclick="ChangeColor2()" style="left:95%; cursor:pointer; top:10px; background-color:#310d14; width: 20px; height: 20px; position: Absolute; border-radius: 20px;"></div>
				<div onclick="ChangeColor3()" style="left:93%; cursor:pointer; top:10px; background-color:#139d82; width: 20px; height: 20px; position: Absolute; border-radius: 20px;"></div>
				<div onclick="ChangeColor4()" style="left:91%; cursor:pointer; top:10px; background-color:#4e73df; width: 20px; height: 20px; position: Absolute; border-radius: 20px;"></div>
				<div onclick="ChangeColor5()" style="left:89%; cursor:pointer; top:10px; background-color:#d3be46; width: 20px; height: 20px; position: Absolute; border-radius: 20px;"></div>
				<!-- Begin Page Content -->
				<div class="container-fluid" style="width: 1300px;">
					<!-- Page Heading -->
					<h1 style="margin-top: 130px;" class="h3 mb-2 text-gray-800">&nbsp;</h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4" style="border-radius: 10px;">
						<div class="card-body text-dark">
							<form action="main.do" method="POST">
								<div
									style="padding-left: 10px; margin-bottom: 10px; display: flex;">
									<div style="display: flex;">
										<select onchange="" style="width: 135px; margin-right: 7px"
											class="form-control form-control-solid" id="searchCondition" name="searchCondition">
												<option value="userFullName" ${searchVO.searchCondition == 'userFullName' ? 'selected="selected"' : ''}>이름</option>
												<option value="userDepartmentName" ${searchVO.searchCondition == 'userDepartmentName' ? 'selected="selected"' : ''}>부서</option>
												<option value="userRankName" ${searchVO.searchCondition == 'userRankName' ? 'selected="selected"' : ''}>직급</option>
												<option value="userPositionName" ${searchVO.searchCondition == 'userPositionName' ? 'selected="selected"' : ''}>직책</option>
												<option value="userEmail" ${searchVO.searchCondition == 'userEmail' ? 'selected="selected"' : ''}>이메일</option>
												<option value="userPhoneNumber" ${searchVO.searchCondition == 'userPhoneNumber' ? 'selected="selected"' : ''}>연락처</option>
										</select>
										<input id="searhcKey" name="serachKey" value="" type="hidden">
										<input class="form-control ps-0" type="search" onblur="searchKeywordOnblur(event)"
											id="searchKeyword" name="searchKeyword" onfocus="searchKeywordOnFoucs(event)"
											value="${searchVO.searchKeyword}" placeholder="" oninput="searchKeywordOnKeyUp()">
										<button class="btn btn-blue btn-icon" type="submit">
											<i class="fas fa-fw fa-search"></i>
										</button>
									</div>
							</form>
							<button style="margin-left: 490px; width: 100px; background-color: ${color}"
								class="btn btn-primary" type="button"
								onclick="location.href='registerUser.do'">
								<i class="fas fa-fw fa-plus" style="margin-right: 10px;"></i>등록
							</button>
							<button style="margin-left: 20px; width: 100px; background-color: ${color}"
								class="btn btn-primary" type="button" onclick="userMod()">
								<i class="fas fa-fw fa-reply" style="margin-right: 10px"></i>수정
							</button>
							<button style="margin-left: 20px; width: 100px; background-color: ${color}"
								class="btn btn-primary" type="button" onclick="userDelete()">
								<i class="fas fa-fw fa-trash" style="margin-right: 10px"></i>삭제
							</button>
						</div>
						<div class="table-responsive"
							style="display: flex; justify-content: center;">
							<form:form commandName="searchVO" id="listForm" name="listForm"
								method="post">
								<input type="hidden" id="pageIndex" name="pageIndex"
									value="${dataVO.pageIndex}" />
								<input type="hidden" id="searchCondition" name="searchCondition"
									value="${searchVO.searchCondition}" />
								<input type="hidden" id="searchKeyword" name="searchKeyword"
									value="${searchVO.searchKeyword}" />		
								<table 
									style="border:; width: 1200px; margin-top: 10px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									<colgroup>
										<col width="5%" style="width: 5%">
										<col width="5%" style="width: 25%;">
										<col width="5%" style="width: 20%">
										<col width="5%" style="width: 10%">
										<col width="5%" style="width: 10%">
										<col width="5%" style="width: 15%">
										<col width="5%" style="width: 15%">
									</colgroup>
									<thead id="userListTabelThead" style="border: 0px solid #4e73df">
										<tr>
											<th><input style="margin-left: 10px; margin-top: 10px;"
												type="checkbox" name="_selected_all_" /></th>
											<th>부서</th>
											<th>이름</th>
											<th>직급</th>
											<th>직책</th>
											<th>이메일</th>
											<th>연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${userList}">
											<tr>
												<td><input style="margin-left: 10px; margin-top: 10px;"
													type="checkbox" name="_selected_" value="${user.userId}" /></td>
												<td><c:out value="${user.userDepartmentName}"></c:out></td>
												<td style="text-overflow: ellipsis;"><a
													href="modifyUser.do?userId=${user.userId}"><c:out
															value="${user.userFullName}"></c:out></a></td>
												<td><c:out value="${user.userRankName}"></c:out></td>
												<td><c:out value="${user.userPositionName}"></c:out></td>
												<td><c:out value="${user.userEmail}"></c:out></td>
												<td><c:out value="${user.userPhoneNumber}"></c:out></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div
									style="margin-top: 20px; width: 100%; display: flex; justify-content: center">
									<div id="paging">
										<ui:pagination paginationInfo="${paginationInfo}" type="text"
											jsFunction="fn_egov_link_page" />
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->
	</div>
	<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
</body>

</html>