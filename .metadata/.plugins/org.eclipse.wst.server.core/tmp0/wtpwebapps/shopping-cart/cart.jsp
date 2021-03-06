<%@ page import="java.util.*"%>
<%@ page import="eduvideoproducts.connection.DbCon"%>
<%@ page import="eduvideoproducts.model.*"%>
<%@ page import="eduvideoproducts.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	VideoProductsDAO pDAO = new VideoProductsDAO(DbCon.getConnection());
	cartProduct = pDAO.getCartProducts(cart_list);
	int total = pDAO.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cart Page</title>
<%@include file="includes/head.jsp"%>
<style type="text/css">
.table tbody td {
	vartical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	fint-size: 25px;
}
</style>

</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
			<h3>總金額: ${ (total>0)?total:0 } 元</h3>
			<a class="mx-3 btn btn-primary" href="#">Check Outs</a>
		</div>

		<table class="table table-loght">
			<thead class="thead-light">
				<tr>
					<!-- 				<th scope="col">課程代碼</th> -->
					<th scope="col">課程名稱</th>
					<th scope="col">課程類別</th>
					<th scope="col">課程期間</th>
					<th scope="col">個數</th>
					<th scope="col">金額</th>
					<th scope="col">取消</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<%--<th ><%= c.getId() %></th> --%>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td>2021/9/1-2021/11/12</td>
					<td>
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="for-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-incre" href="quantity-inc-dec"> <i
									class="fas fa-plus-square"></i></a> <input type="text"
									name="quantity" class="form-control" value="1" readonly>
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec"> <i
									class="fas fa-minus-square"></i></a>
							</div>
						</form>
					</td>
					<td><%=c.getPrice()%></td>
					<td><a class="btn btn-sm btn-danger" href="">remove</a></td>
				</tr>
				<%
				}
				}
				%>
			
		</table>
	</div>

	<%@include file="includes/footer.jsp"%>

</body>
</html>