<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>

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
	border: 1px #a39485 solid;
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
	background: #2653d5;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
}

a {
	color: #73685d;
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
		
		function on_click(){
			var arr = $('input[name=_selected_]:checked').serializeArray().map(function(item) { return item.value });
			console.log(arr)
		}
		$(document).ready(function(){
			$('input[name=_selected_all_]').on('change', function(){
				  $('input[name=_selected_]').prop('checked', this.checked);
				});
		})

		
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
			<li class="nav-item active"><a class="nav-link"
				href="main.do"> <i class="fas fa-fw fa-table"></i> <span>사용자
						목록</span></a></li>
						<li class="nav-item active"><a class="nav-link"
				href="registerUser.do"> <i class="fas fa-fw fa-plus-square"></i> <span>사용자
						등록</span></a></li>			

			<!-- Divider -->
		</ul>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 style="margin-top: 50px;" class="h3 mb-2 text-gray-800">사용자 목록</h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"></h6>
						</div>
						<div class="card-body text-dark">
						<form action="main.do" method="POST"> 
							<div style="padding-left: 200px; margin-bottom: 10px;display:flex;">
								<div style="display:flex;">
									<input type="search" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}" placeholder="검색어를 입력하세요.">
									<input type="submit" value="조회">
								</div>
						</form>		
								<button type="button" onclick="location.href='registerUser.do'">등록</button>
								<button>수정</button>
								<button>삭제</button>
							</div>
							<div class="table-responsive" style="display:flex;justify-content: center; ">
								<form:form commandName="searchVO" id="listForm" name="listForm"
									method="post">
									<input type="hidden" id="pageIndex" name="pageIndex" value="${dataVO.pageIndex}"/>
									<table style="width:1200px;">
									<colgroup>
										<col style="width:5%">
										<col style="width:30%">
										<col style="width:20%">
										<col style="width:10%">
										<col style="width:10%">
										<col style="width:10%">
										<col style="width:15%">
									</colgroup>										
										<thead>
											<tr>
												<th><input type="checkbox" name="_selected_all_" /></th>
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
													<td><input type="checkbox" name="_selected_" value="${user.userId}"/></td>
													<td><c:out value="${user.userDepartmentName}"></c:out></td>
													<td><a href="#" onclick=""><c:out value="${user.userFullName}"></c:out></a></td>
													<td><c:out value="${user.userRankName}"></c:out></td>
													<td><c:out value="${user.userPositionName}"></c:out></td>
													<td><c:out value="${user.userEmail}"></c:out></td>
													<td><c:out value="${user.userPhoneNumber}"></c:out></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div style="margin-top: 20px; width: 100%; display: flex; justify-content: center">
										<div id="paging">
											<ui:pagination paginationInfo="${paginationInfo}"
												type="text" jsFunction="fn_egov_link_page" />
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