<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    <script type="text/javascript">
    
    	function login(){
    		var param ={
    				"userId" : $("#userId").val(),
    				"userPassword" : $("#userPassword").val()
    		}
    		
    		$.ajax({   //anyne:true,
				url : "userLogin.ajax",
				type : "POST",
				data : param,
				//dataType: "text",
				//contentType : "application/json",
				success : function(data) {
					if (data == "ok") {
						location.href = "main.do";
					}
					if (data == "no") {
						alert("로그인 정보가 일치하지 않습니다.");
						return;
					}
				}
			});
    	}
    </script>
</head>
<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9" style="margin-top: 200px;">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image" style=" background: url(https://images.unsplash.com/photo-1665872612238-472a486771f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80)"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로그인 페이지</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="userId" aria-describedby="emailHelp" name="userId" value="admin"
                                                placeholder="ID">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" value="admin1541!"
                                                id="userPassword" placeholder="Password" name="userPassword">
                                        </div>
                                        <div class="form-group">
                                        </div>
                                        <a onclick="login()" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>
                                        <hr>
                            
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>



</body>
</html>