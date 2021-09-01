<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart Login</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<h1>hello world</h1>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">使用著登入</div>
			<div class="card-body">
				<form action="" method="post">

					<div class="form-group">
						<label>信箱</label> <input type="email" class="form-control"
							name="login-email" placeholder="請輸入信箱" required>
					</div>
					<div class="form-group">
						<label>密碼</label> <input type="password" class="form-control"
							name="login-password" placeholder="********" required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">登入</button>
						
					</div>


				</form>
			</div>
		</div>
	</div>


	<%@include file="includes/footer.jsp"%>

</body>
</html>