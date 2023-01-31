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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">


	function kakaopost (){
	    new daum.Postcode({
	        oncomplete: function(data) {
	           document.querySelector("#zipcode").value = data.zonecode;
	           document.querySelector("#address").value =  data.address
	        }
	    }).open();
	}
	
	function userIdCheck (){
		
		if ($("#userId").val() == null || $("#userId").val() == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		
		var param = {"userId":$("#userId").val()}
		
		$.ajax({
			anyne:true,
			url: "userIdChk.ajax",
			type: "POST",
			data: JSON.stringify(param),
			dataType: "text",
			contentType : "application/json",
			success: function(data){
				if (data.resultCode == "ok"){
					alert("사용자 할 수 없는 아이디입니다.");
				}
				if (data.resultCode == "no"){
					alert("사용자 할 수 있는 아이디입니다..");
				}
			}
		});		
	}

	$(document).ready(function() {

		$('input[name=_selected_all_]').on('change', function() {
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
			<li class="nav-item active"><a class="nav-link" href="main.do">
					<i class="fas fa-fw fa-table"></i> <span>사용자 목록</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="registerUser.do"> <i class="fas fa-fw fa-plus-square"></i>
					<span>사용자 등록</span></a></li>


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
		</ul>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 style="margin-top: 50px;" class="h3 mb-2 text-gray-800">사용자
						등록</h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3" style="width: 800px; padding-left: 50px;">

							<div class="row gx-3">
								<div class="mb-3">
									<button style="width:100px; margin-left: 600px;" class="btn btn-primary"
										type="button">등록</button>
								</div>
							</div>	
								<form class="text-dark">
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">사용자
												성</div>
										</div>
										<div class="mb-3">
											<input class="form-control" id="inputFirstName" type="text">
										</div>
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-left: 20px; margin-right: 20px; width: 110px;">
												이름</div>
										</div>
										<div class="mb-3">
											<input class="form-control" id="inputFirstName" type="text">
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
												아이디</div>
										</div>
										<div class="mb-3">
											<input class="form-control"name="userId" id="userId" type="text">
										</div>
										<div class="mb-3">
											<button onclick="userIdCheck()" style="margin-left: 20px;" class="btn btn-outline-primary"
												type="button">아이디 확인</button>
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">비밀번호</div>
										</div>
										<div class="mb-3">
											<input class="form-control" id="inputFirstName" type="text">
										</div>
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-left: 20px; margin-right: 20px; width: 110px;">
												비밀번호 확인</div>
										</div>
										<div class="mb-3">
											<input class="form-control" id="inputFirstName" type="text">
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
												연락처</div>
										</div>
										<div class="mb-3">
											<input class="form-control" id="inputFirstName" type="text">
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
												자택 전화번호</div>
										</div>
										<div class="mb-3">
											<input class="form-control" id="inputFirstName" type="text">
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
												이메일</div>
										</div>
										<div class="mb-3">
											<input class="form-control" id="inputFirstName" type="text">
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
												자택 주소</div>
										</div>
										<div class="mb-3">
											<input disabled="disabled" name="zipcode" id="zipcode" class="form-control" id="inputFirstName" type="text">
										</div>
										<div class="mb-3">
											<button onclick="kakaopost()" style="margin-left: 20px;" class="btn btn-outline-primary"
												type="button">우편번호 검색</button>
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
											</div>
										</div>
										<div class="mb-3">
											<input disabled="disabled" name="address" id="address" style="width: 570px" class="form-control"
												id="inputFirstName" type="text">
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
											</div>
										</div>
										<div class="mb-3">
											<input style="width: 570px" class="form-control"
												id="inputFirstName" type="text">
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
												소속 부서</div>
										</div>
										<div class="mb-3">
											<select style="width: 211px;"
												class="form-control form-control-solid">
												<c:forEach var="item" items="${department}">
													<option value="${item.code}">${item.codeName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
												직급</div>
										</div>
										<div class="mb-3">
											<select style="width: 211px;"
												class="form-control form-control-solid">
												<c:forEach var="item" items="${jopGrade}">
													<option value="${item.code}">${item.codeName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="row gx-3">
										<div class="mb-3">
											<div class="h6 text-dark"
												style="padding-top: 10px; margin-right: 20px; width: 110px;">
												직책</div>
										</div>
										<div class="mb-3">
											<select style="width: 211px;"
												class="form-control form-control-solid">
												<c:forEach var="item" items="${jobPosition}">
													<option value="${item.code}">${item.codeName}</option>
												</c:forEach>
											</select>
										</div>
									</div>

								</form>











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