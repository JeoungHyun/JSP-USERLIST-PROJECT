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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">


	var userIdChkState = false;
	var userPwdChkState = false;
	var userEmailState = false;
	var userPwdTextResult = "";
	
	
	function idPopUp(){
		

		
		var url ="idCheckPopup.do";
		var name ="IdCheck PopUp";
		var option = "width=500,height=500,top=100,left=300,location=no"
            window.open(url, name, "width=500,height=500,top=100,left=700,location=no");
		$("#userId").blur();
	}
	

	function kakaopost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#zipcode").value = data.zonecode;
				document.querySelector("#adress").value = data.address
			}
		}).open({    left: (window.screen.width / 2) - 250,
		    top: (window.screen.height / 2) - 300});
	}
	

	
		function firstPassword(e){
			userPwdChkState = false;
			var password1 = $("#userPassword1").val();
			var password2 = $("#userPassword2").val();
			
			function IntCount(aInputBox) {  // aInputBox??? ?????? ????????? ?????? return
				  var comp = "1234567890";
				  var aInputBoxValue = aInputBox;
				  var len=aInputBoxValue.length;
				  var count = 0;
				  if(len > 0) {
				      for(var i=0;i<len;i++) {
				          if(comp.indexOf(aInputBoxValue.substring(i,i+1)) != -1) {
				              count++;
				          }
				      }       
				  }
				  return count;
				}

				function CharCount(aInputBox) {  // aInputBox??? ?????? ????????? ?????? return
				   var comp = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
				   var aInputBoxValue = aInputBox;
				   var len=aInputBoxValue.length;
				   var count = 0;
				   if(len > 0) {
				       for(var i=0;i<len;i++) {
				           if(comp.indexOf(aInputBoxValue.substring(i,i+1)) != -1) {
				               count++;
				           }
				       }       
				   }
				   return count;
				}

				function VarCharCount(aInputBox) {  // aInputBox??? ?????? ??????????????? ?????? return
				   var comp = "\`~!@#$%^&*-_+=\\,./?:;\"{[}]";
				   var aInputBoxValue = aInputBox;
				   var len = aInputBoxValue.length;
				   var count = 0;
				   if(len > 0){
				       for(var i=0; i<len; i++) {
				           if(comp.indexOf(aInputBoxValue.substring(i,i+1)) != -1) {
				               count++;
				           }
				       }       
				   }
				   return count;
				}
			
			function checkPwdEnd(){
				 var flag = false;
				 var intCount = 0;
				 var charCount = 0;
				 var varcharCount = 0;
				 intCount = IntCount( $("#userPassword1").val());
				 charCount = CharCount( $("#userPassword1").val());
				 varcharCount = VarCharCount( $("#userPassword1").val());
				 if((intCount == 0 || charCount == 0 || varcharCount == 0)){
				  flag = true;
				 }
				 return flag;
				}
			
			function pwSame(){   //?????? ??????, ?????? ??????(3??????)
				 var tmp = "";
				 var cnt = 0;
				 var validpw = $("#userPassword1").val();
				 for(i=0; i<validpw.length; i++){
				  tmp = validpw.charAt(i);
				  if(tmp == validpw.charAt(i+1) && tmp == validpw.charAt(i+2)){
				   cnt = cnt + 1;
				  }
				 }
				 if(cnt > 0){
				  return true;
				 }else{
				  return false;
				 }
				}

			function pwContinue(){   //????????? ??????, ?????? ??????(3??????)
				 var cnt = 0;
				 var cnt2 = 0;
				 var tmp = "";
				 var tmp2 = "";
				 var tmp3 = "";
				 var validpw = $("#userPassword1").val();
				 for(i=0; i<validpw.length; i++){
				  tmp = validpw.charAt(i);
				  tmp2 = validpw.charAt(i+1);
				  tmp3 = validpw.charAt(i+2);
				  
				  if(tmp.charCodeAt(0) - tmp2.charCodeAt(0) == 1 && tmp2.charCodeAt(0) - tmp3.charCodeAt(0) == 1){
				   cnt = cnt + 1;
				  }
				  if(tmp.charCodeAt(0) - tmp2.charCodeAt(0) == -1 && tmp2.charCodeAt(0) - tmp3.charCodeAt(0) == -1){
				   cnt2 = cnt2 + 1;
				  }
				 }
				 if(cnt > 0 || cnt2 > 0){
				  return true;
				 }else{
				  return false;
				 }
				}
			
/* 
		if (password2 == "" ){
			$("#passwordChk").html("")
			return;
			} 
		if(password1 == "" && password2 == ""){
			$("#passwordChk").html("")
			return;
		} */
		if(password1.length > 0){
			userPwdTextResult = "";
			console.log(password1.length);
			if(password1.length < 8){
				$("#passwordChk").html("<div class='mb-3'><div class='h6'style='padding-top: 10px; margin-right: 20px; width: 110px;'></div></div><div class='mb-3'><div class='h6' style='color:red; padding-top: 10px;  margin-right: 20px; width: 270px;'>??????????????? 8????????? ??????????????????.</div></div>")
				userPwdTextResult += "??????????????? 8????????? ??????????????????.<br>";
					
			}
			if(checkPwdEnd()){
				$("#passwordChk").html("<div class='mb-3'><div class='h6'style='padding-top: 10px; margin-right: 20px; width: 110px;'></div></div><div class='mb-3'><div class='h6' style='color:red; padding-top: 10px;  margin-right: 20px; width: 450px;'>??????????????? ??????,??????,??????????????? 1??? ?????? ????????????????????????.</div></div>")
				userPwdTextResult += "??????????????? ??????,??????,??????????????? 1??? ?????? ????????????????????????.<br>";
								
			}
			if(pwSame()){
				$("#passwordChk").html("<div class='mb-3'><div class='h6'style='padding-top: 10px; margin-right: 20px; width: 110px;'></div></div><div class='mb-3'><div class='h6' style='color:red; padding-top: 10px;  margin-right: 20px; width: 470px;'>??????????????? 3?????? ?????? ????????? ????????? ????????? ??? ????????????.</div></div>")
				userPwdTextResult += "??????????????? 3?????? ?????? ????????? ????????? ????????? ??? ????????????.<br>";
								
			}
			if(pwContinue()){
				$("#passwordChk").html("<div class='mb-3'><div class='h6'style='padding-top: 10px; margin-right: 20px; width: 110px;'></div></div><div class='mb-3'><div class='h6' style='color:red; padding-top: 10px;  margin-right: 20px; width: 470px;'>??????????????? 3?????? ?????? ????????? ????????? ????????? ????????? ??? ????????????.</div></div>")
				userPwdTextResult += "??????????????? 3?????? ?????? ????????? ????????? ????????? ????????? ??? ????????????.<br>";
								
			}			
			$("#passwordChk").html("<div class='mb-3'><div class='h6'style='padding-top: 10px; margin-right: 20px; width: 110px;'></div></div><div class='mb-3'><div class='h6' style='color:red; padding-top: 10px;  margin-right: 20px; width: 470px;'>"+userPwdTextResult+"</div></div>");
		}
		if(password1.length == 0){
			$("#passwordChk").html("");	
		}
		if(userPwdTextResult == ""){
			$("#passwordChk").html("<div class='mb-3'><div class='h6'style='padding-top: 10px; margin-right: 20px; width: 110px;'></div></div><div class='mb-3'><div class='h6' style='color:blue; padding-top: 10px;  margin-right: 20px; width: 470px;'>??????????????? ???????????? ?????????.   ???????????? ????????? ??????????????????.</div></div>");
			$("#userPassword2").attr("disabled", false);
		}
	}
		
	function secondPassword(){
		var password1 = $("#userPassword1").val();
		var password2 = $("#userPassword2").val();
		
		function IntCount(aInputBox) {  // aInputBox??? ?????? ????????? ?????? return
			  var comp = "1234567890";
			  var aInputBoxValue = aInputBox;
			  var len=aInputBoxValue.length;
			  var count = 0;
			  if(len > 0) {
			      for(var i=0;i<len;i++) {
			          if(comp.indexOf(aInputBoxValue.substring(i,i+1)) != -1) {
			              count++;
			          }
			      }       
			  }
			  return count;
			}

			function CharCount(aInputBox) {  // aInputBox??? ?????? ????????? ?????? return
			   var comp = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			   var aInputBoxValue = aInputBox;
			   var len=aInputBoxValue.length;
			   var count = 0;
			   if(len > 0) {
			       for(var i=0;i<len;i++) {
			           if(comp.indexOf(aInputBoxValue.substring(i,i+1)) != -1) {
			               count++;
			           }
			       }       
			   }
			   return count;
			}

			function VarCharCount(aInputBox) {  // aInputBox??? ?????? ??????????????? ?????? return
			   var comp = "\`~!@#$%^&*-_+=\\,./?:;\"{[}]";
			   var aInputBoxValue = aInputBox;
			   var len = aInputBoxValue.length;
			   var count = 0;
			   if(len > 0){
			       for(var i=0; i<len; i++) {
			           if(comp.indexOf(aInputBoxValue.substring(i,i+1)) != -1) {
			               count++;
			           }
			       }       
			   }
			   return count;
			}
		
		function checkPwdEnd(){
			 var flag = false;
			 var intCount = 0;
			 var charCount = 0;
			 var varcharCount = 0;
			 intCount = IntCount( $("#userPassword1").val());
			 charCount = CharCount( $("#userPassword1").val());
			 varcharCount = VarCharCount( $("#userPassword1").val());
			 if((intCount == 0 || charCount == 0 || varcharCount == 0)){
			  flag = true;
			 }
			 return flag;
			}
		
		function pwSame(){   //?????? ??????, ?????? ??????(3??????)
			 var tmp = "";
			 var cnt = 0;
			 var validpw = $("#userPassword1").val();
			 for(i=0; i<validpw.length; i++){
			  tmp = validpw.charAt(i);
			  if(tmp == validpw.charAt(i+1) && tmp == validpw.charAt(i+2)){
			   cnt = cnt + 1;
			  }
			 }
			 if(cnt > 0){
			  return true;
			 }else{
			  return false;
			 }
			}

		function pwContinue(){   //????????? ??????, ?????? ??????(3??????)
			 var cnt = 0;
			 var cnt2 = 0;
			 var tmp = "";
			 var tmp2 = "";
			 var tmp3 = "";
			 var validpw = $("#userPassword1").val();
			 for(i=0; i<validpw.length; i++){
			  tmp = validpw.charAt(i);
			  tmp2 = validpw.charAt(i+1);
			  tmp3 = validpw.charAt(i+2);
			  
			  if(tmp.charCodeAt(0) - tmp2.charCodeAt(0) == 1 && tmp2.charCodeAt(0) - tmp3.charCodeAt(0) == 1){
			   cnt = cnt + 1;
			  }
			  if(tmp.charCodeAt(0) - tmp2.charCodeAt(0) == -1 && tmp2.charCodeAt(0) - tmp3.charCodeAt(0) == -1){
			   cnt2 = cnt2 + 1;
			  }
			 }
			 if(cnt > 0 || cnt2 > 0){
			  return true;
			 }else{
			  return false;
			 }
			}
		
		
		if(password1 == "" && password2 == ""){
			$("#passwordChk").html("");
			userPwdChkState = false;
			return;
		}

		if(password1 == password2){
			
			$("#passwordChk").html("<div class='mb-3'><div class='h6'style='padding-top: 10px; margin-right: 20px; width: 110px;'></div></div><div class='mb-3'><div class='h6' style='color:blue; padding-top: 10px;  margin-right: 20px; width: 230px;'>??????????????? ?????? ?????????.</div></div>")
			userPwdChkState = true;
		}else{
			$("#passwordChk").html("<div class='mb-3'><div class='h6'style='padding-top: 10px; margin-right: 20px; width: 110px;'></div></div><div class='mb-3'><div class='h6' style='color:red; padding-top: 10px;  margin-right: 20px; width: 230px;'>??????????????? ???????????? ????????????.</div></div>")
			userPwdChkState = false;
		}
		
	}
	
	function idChkInput(event){
		userIdChkState = false;
		$("#idChkResult").html("")
		 const regExp = /[^0-9a-zA-Z]/g;
		  const ele = event.target;
		  if (regExp.test(ele.value)) {
		    ele.value = ele.value.replace(regExp, '');
		  }
	}
	
	function userNameInput(event){
		const regExp = /[^???-???a-zA-Z]/g;
		  const ele = event.target;
		  if (regExp.test(ele.value)) {
		    ele.value = ele.value.replace(regExp, '');
		  }		
	}
	
	function emailChk(){
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,6}$/;
		const useEmail = $("#userEmail").val();
		if(regExp.test(useEmail)){
			userEmailState = true;
		}else{
			userEmailState = false;
		}
	}
	

	function userIdCheck() {

		if ($("#userId").val() == null || $("#userId").val() == "") {
			alert("???????????? ??????????????????.");
			return false;
		}
		if($("#userId").val().length < 4){
			alert("???????????? 4?????? ?????? ??????????????????.");
			return false;
		}

		var param = {
			"userId" : $("#userId").val()
		}

		$.ajax({   //anyne:true,
					url : "userIdChk.ajax",
					type : "POST",
					data : param,
					//dataType: "text",
					//contentType : "application/json",
					success : function(data) {
						if (data == "no") {
							$("#idChkResult").html("<div class='h6'style='color:blue; padding-top: 10px; margin-left: 18px; width: 250px;'>????????? ??? ?????? ??????????????????.</div>")
							userIdChkState = true;
						}
						if (data == "ok") {
							$("#idChkResult").html("<div class='h6'style='color:red; padding-top: 10px; margin-left: 18px; width: 250px;'>????????? ??? ?????? ??????????????????.</div>")
							userIdChkState = false;
						}
					}
				});
	}
	
	function userReg() {
		//????????? ??? ?????? ??????
			if ($("#userFirstName").val() == null || $("#userFirstName").val() == "") {
			alert("????????? ?????? ??????????????????.");
			return false;
		}		
		//?????? ?????? ??????
			if ($("#userLastName").val() == null || $("#userLastName").val() == "") {
			alert("????????? ??????????????????.");
			return false;
		}		
		//????????? ?????? ??????
			if ($("#userId").val() == null || $("#userId").val() == "") {
			alert("???????????? ??????????????????.");
			return false;
		}
		//????????? ?????? ????????? ??????
/* 			if(userIdChkState == false){
			alert("????????? ???????????? ????????? ?????? ????????????.");
			return false;	
			} */
		//???????????? ?????? ??????
			if ($("#userPassword1").val() == null || $("#userPassword1").val() == "" || $("#userPassword2").val() == null || $("#userPassword2").val() == "") {
			alert("??????????????? ??????????????????.");
			return false;
		}
		// ???????????? ?????? ??????
			if(!userPwdChkState){
				alert("??????????????? ??????????????????.")
			return false;	
			}		
		//???????????? ????????? ?????? (??????8??????),(??????+??????+??????????????????),(3??????????????? ??????,?????? X),(3??????????????? ??????,??????X)
		//????????? ?????? ??????
			if ($("#userPhoneNumber1").val() == null || $("#userPhoneNumber1").val() == "" || $("#userPhoneNumber2").val() == null || $("#userPhoneNumber2").val() == "" || $("#userPhoneNumber3").val() == null || $("#userPhoneNumber3").val() == "") {
			alert("???????????? ??????????????????.");
			return false;
		}			
		//?????? ????????????  ?????? ??????
			if ($("#userHomeNumber1").val() == null || $("#userHomeNumber1").val() == "" || $("#userHomeNumber2").val() == null || $("#userHomeNumber2").val() == "" || $("#userHomeNumber3").val() == null || $("#userHomeNumber3").val() == "") {
			alert("?????? ??????????????? ??????????????????.");
			return false;
		}		
		//????????? ?????? ??????
			if ($("#userEmail").val() == null || $("#userEmail").val() == "") {
			alert("???????????? ??????????????????.");
			return false;
		}			
		//????????? ?????? ??????
			if(!userEmailState){
				alert("????????? ????????? ??????????????????.");
				return false;				
			}
		
		//???????????? ?????? ??????
			if ($("#zipcode").val() == null || $("#zipcode").val() == "" || $("#adress").val() == null || $("#adress").val() == "" || $("#userDetailAdress").val() == null || $("#userDetailAdress").val() == "") {
			alert("??????????????? ??????????????????.");
			return false;
		}
			if( $("#userDepartment option:selected").val() == ""){
				alert("????????? ??????????????????.");
				return false;
			}
			if( $("#userRank option:selected").val() == ""){
				alert("????????? ??????????????????.");
				return false;
			}
			if( $("#userPosition option:selected").val() == ""){
				alert("????????? ??????????????????.");
				return false;
			}

			

			var space =" ";
			var param = {
					"userId" : $("#userId").val(),
					"userPassword" : $("#userPassword1").val(),
					"userFirstName" : $("#userFirstName").val(),
					"userLastName" : $("#userLastName").val(),
					"userFullName" : $("#userFirstName").val()+$("#userLastName").val(),
					"userPhoneNumber" : $("#userPhoneNumber1").val() +"-"+ $("#userPhoneNumber2").val()+ "-"+$("#userPhoneNumber3").val(),
					"userHomeNumber" : $("#userHomeNumber1").val() + "-" + $("#userHomeNumber2").val() + "-" + $("#userHomeNumber3").val(),
					"userEmail" : $("#userEmail").val(),
					"userZipCode" : $("#zipcode").val(),
					"userRoadName" : $("#adress").val(),
					"userDetailAdress" : $("#userDetailAdress").val(),
					"userAdress" : $("#adress").val()+space+ $("#zipcode").val()+space+ $("#userDetailAdress").val(),
					"userDepartment" : $("#userDepartment option:selected").val(),
					"userRank" : $("#userRank option:selected").val(),
					"userPosition" : $("#userPosition option:selected").val()
				}
			
			$.ajax({   //anyne:true,
				url : "userReg.ajax",
				type : "POST",
				data : param,
				// dataType: "text", //
				//contentType : "application/json",
				success : function(data) {
					if(data == "ok"){
						alert("???????????? ?????? ???????????????.");
						location.href ='main.do';
					}
				},
				error : function(data){
					alert("????????? ????????? ?????? ???????????????.");
					}
				}
			)
	}
	
	
	$(document).ready(function() {

		
		var button =document.getElementsByClassName("btn-primary");
		for(var i = 0 ; i < button.length ; i++){
			button[i].style.backgroundColor = "${color}"
			button[i].style.border = '0px';
		}

		
		var sidebar = document.getElementById("accordionSidebar");
		sidebar.style.backgroundImage = "linear-gradient(180deg,${color} 10%,#224abe 100%)";
		if("${color}" == "#d3be46"){
			sidebar.style.backgroundImage = "linear-gradient(180deg,#d3be46 10%,#f1e54a 100%)";
		}
		if("${color}" == "#139d82"){
			sidebar.style.backgroundImage = "linear-gradient(180deg,#139d82 10%,#89bba9 100%)";
		}
		
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
			<div class="sidebar-heading">????????? ??????</div>



			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link" href="main.do">
					<i class="fas fa-fw fa-table"></i> <span>????????? ??????</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="registerUser.do"> <i class="fas fa-fw fa-plus-square"></i>
					<span>????????? ??????</span></a></li>


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
					<h1 style="padding-left: 400px; margin-top: 50px;"
						class="h3 mb-2 text-gray-800">&nbsp;</h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4"
						style="width: 800px; margin-left: 400px;">
						<div class="card-header py-3"
							style="width: 800px; padding-left: 50px;">

							<div class="row gx-3">
								<div class="mb-3">
									<button style="width: 100px; margin-left: 490px;background-color: ${color}"
										onclick="userReg()" class="btn btn-primary" type="button">
										<i class="fas fa-fw fa-plus" style="margin-right: 10px"></i>??????
									</button>
								</div>
								<div class="mb-3">
									<button onclick="location.href='main.do'"
										style="width: 100px; margin-left: 20px; background-color: ${color}"
										class="btn btn-primary" type="button">
										<i class="fas fa-fw fa-times" style="margin-right: 10px"></i>??????
									</button>
								</div>
							</div>
							<form class="text-dark">
								<div class="row gx-3">
									<div class="mb-3"></div>
								</div>
								<div class="row gx-3">
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">?????????
											???</div>
									</div>
									<div class="mb-3">
										<input oninput="userNameInput(event)" class="form-control"
											id="userFirstName" type="text" maxlength="10">
									</div>
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-left: 20px; margin-right: 20px; width: 110px;">
											??????</div>
									</div>
									<div class="mb-3">
										<input oninput="userNameInput(event)" class="form-control"
											id="userLastName" type="text" maxlength="10">
									</div>
								</div>
								<div class="row gx-3">
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">
											?????????</div>
									</div>
									<div class="mb-3">
										<input onInput="idChkInput(event)" class="form-control"
											name="userId" id="userId" maxlength="50" type="text" onfocus="idPopUp()" onclick="idPopUp()">
									</div>
<!-- 									<div class="mb-3">
										<button onclick="userIdCheck()" style="margin-left: 20px;"
											class="btn btn-outline-primary" type="button">????????? ??????</button>
									</div> -->
									<div class="mb-3 idChkResult" id="idChkResult"></div>
								</div>
								<div class="row gx-3">
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">????????????</div>
									</div>
									<div class="mb-3">
										<input class="form-control" id="userPassword1" type="password"
											oninput="firstPassword(this)" />
									</div>
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-left: 20px; margin-right: 20px; width: 110px;">
											???????????? ??????</div>
									</div>
									<div class="mb-3">
										<input class="form-control" id="userPassword2" type="password"
											oninput="secondPassword(this)" 
											disabled="disabled"/>
									</div>
								</div>
								<div class="row gx-3" id="passwordChk"></div>
								<div class="row gx-3">
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">
											?????????</div>
									</div>
									<div class="mb-3" style="display: flex">
										<input
											style="width:55px"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											class="form-control" id="userPhoneNumber1" type="text"
											maxlength="3">
										<h3>-</h3><input
											style="width:65px"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											class="form-control" id="userPhoneNumber2" type="text"
											maxlength="4">
										<h3>-</h3><input
											style="width:65px"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											class="form-control" id="userPhoneNumber3" type="text"
											maxlength="4">
									</div>
								</div>
								<div class="row gx-3" >
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">
											?????? ????????????</div>
									</div>
									<div class="mb-3" style="display: flex;">
										<input
											style="width:55px"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											class="form-control" id="userHomeNumber1" type="text"
											maxlength="3">
										<h3>-</h3><input
											style="width:65px"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											class="form-control" id="userHomeNumber2" type="text"
											maxlength="4">
										<h3>-</h3><input
											style="width:65px"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											class="form-control" id="userHomeNumber3" type="text"
											maxlength="4">		
									</div>
								</div>
								<div class="row gx-3">
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">
											?????????</div>
									</div>
									<div class="mb-3">
										<input onblur="emailChk()" class="form-control" id="userEmail"
											type="text" maxlength="255">
									</div>
								</div>
								<div class="row gx-3">
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">
											?????? ??????</div>
									</div>
									<div class="mb-3">
										<input disabled="disabled" name="zipcode" id="zipcode"
											class="form-control" type="text">
									</div>
									<div class="mb-3">
										<button onclick="kakaopost()" style="margin-left: 20px;"
											class="btn btn-outline-primary" type="button">????????????
											??????</button>
									</div>
								</div>
								<div class="row gx-3">
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">
										</div>
									</div>
									<div class="mb-3">
										<input disabled="disabled" name="adress" id="adress"
											style="width: 570px" class="form-control" id="inputFirstName"
											type="text">
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
											id="userDetailAdress" type="text" maxlength="41">
									</div>
								</div>
								<div class="row gx-3">
									<div class="mb-3">
										<div class="h6"
											style="padding-top: 10px; margin-right: 20px; width: 110px;">
											?????? ??????</div>
									</div>
									<div class="mb-3">
										<select style="width: 211px;"
											class="form-control form-control-solid" id=userDepartment>
											<option value="">??????</option>
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
											??????</div>
									</div>
									<div class="mb-3">
										<select style="width: 211px;"
											class="form-control form-control-solid" id="userRank">
											<option value="">??????</option>
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
											??????</div>
									</div>
									<div class="mb-3">
										<select style="width: 211px;"
											class="form-control form-control-solid" id="userPosition">
											<option value="">??????</option>
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