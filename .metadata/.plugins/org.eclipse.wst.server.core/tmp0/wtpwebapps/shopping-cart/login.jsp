<%@ page import="java.util.*"%>
<%@ page import="eduvideoproducts.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <% 
    User auth = (User)request.getSession().getAttribute("auth");
    if(auth != null){
    	//request.setAttribute("auth", auth);
    	response.sendRedirect("index.jsp");
    }
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list !=null){
    	request.setAttribute("cart_list", cart_list);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart Login</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">使用著登入</div>
			<div class="card-body">
				<form action="user-Login" method="post">

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