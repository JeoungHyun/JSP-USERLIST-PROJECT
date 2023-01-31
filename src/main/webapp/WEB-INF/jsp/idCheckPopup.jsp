<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
h1 { height:35px; padding:0 35px 0 19px; color:#fff; font-size:14px; line-height:35px; background-color:#495164; }
.content { padding:20px 20px 60px; background-color:#fff; }
.close { position:absolute; right:14px; top:12px; }
.close img { cursor:pointer; }
.btnArea { position:absolute; left:0; bottom:0; width:100%; padding:10px 0; border-top:1px solid #d7d5d5; text-align:center; background:#fbfafa; }
fieldset { display:block; }
fieldset p { margin:0 0 15px; color:black; }
fieldset input { height:22px; width:130px; padding:0px 2px 0px 4px; border:1px solid #d9d9d9; color:#202020; }
ul { padding:0px; list-style:none; margin:18px 0px 0px 0px; line-height:20px; color:black; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">

var idCheckYN = false;

function userIdCheck() {

	if ($("#userId2").val() == null || $("#userId2").val() == "") {
		alert("아이디를 입력해주세요.");
		return false;
	}
	if($("#userId2").val().length < 4){
		alert("아이디는 4글자 이상 입력해주세요.");
		return false;
	}
	var regExp = /^\d.*/;
	const userId = $("#userId2").val();
	if(regExp.test(userId)){
		alert("숫자로 시작하는 아이디는 사용 할 수 없습니다.");
		return false;
	}

	var param = {
		"userId" : $("#userId2").val()
	}
	$.ajax({   //anyne:true,
		url : "userIdChk.ajax",
		type : "POST",
		data : param,
		//dataType: "text",
		//contentType : "application/json",
		success : function(data) {
			if (data == "no") {
				console.log('사용가능한');
				$("#idResult").html("<li style='color:blue;'>사용 가능한 아이디입니다.</li>");
				idCheckYN = true;
			}
			if (data == "ok") {
				$("#idResult").html("<li style='color:red;'>사용 불가능한 아이디입니다.</li>");
				idCheckYN = false;
			}
		}
	});
}


function idChkInput(event){
	idCheckYN = false;
	$("#idResult").html("")
	 const regExp = /[^0-9a-zA-Z]/g;
	  const ele = event.target;
	  if (regExp.test(ele.value)) {
	    ele.value = ele.value.replace(regExp, '');
	  }
}

function idUse(){
	if(!idCheckYN){
		alert('아이디를 확인 해주세요.');
		return;
	}
	var userIDvalue = $("#userId2").val();
	$('#userId',opener.document).val($("#userId2").val()) 
	close();
}
</script>
</head>
<body>
<div class="member_checkId">
    <!--@css(/css/module/member/checkid.css)-->
    <h1>아이디 중복확인</h1>
    <div class="content">
        <fieldset>
            <legend>아이디 중복확인</legend>
            <p>아이디는 영문(소문자), 숫자로 4~16자 이내로 입력해 주세요.</p>
            <div style="display: flex">
            <form>
            <input id="userId2" class="userId" name="userId" onInput="idChkInput(event)"  type="text" maxlength="16" />
            </form>
            <a onclick="userIdCheck()" style="margin-left: 10px; cursor: pointer"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_check2.gif" alt="중복확인" /></a>
        	</div>
        </fieldset>
        <ul>
            <li class="{$display_desc|display}">※ 숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</li>
            <li id="idResult"></li>
        </ul>
    </div>
    <div class="btnArea">
        <a style="cursor: pointer;" onclick="idUse()"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_use2.gif" alt="사용하기" /></a>
    </div>
</div>
</body>
</html>