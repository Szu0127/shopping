<%@ page import="java.util.*"%>
<%@ page import="eduvideoproducts.dao.VideoProductsDAO"%>
<%@ page import="eduvideoproducts.connection.DbCon"%>
<%@ page import="eduvideoproducts.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

VideoProductsDAO pd = new VideoProductsDAO(DbCon.getConnection());
List<VideoProducts> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list !=null){
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Index Page</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<%--  <% out.print(DbCon.getConnection());//確認與資料庫的連線 %>  --%>

	<div class="container">
		<div class="card-header my-3">所有教學影片</div>
		<div class="row">
		<%
		if(!products.isEmpty()){
			for(VideoProducts vp : products){ %>
				<div class="col-md-3 my-3"></div>
				<div class="card" style="width: 250px;">
					<img class="card-img-top"src="product-images/<%= vp.getImage() %>"  alt="Card image cop">
					<div class="card-body">
						<h5 class="card-title"><%= vp.getName() %></h5>
						<h6 class="price">定價:<%= vp.getPrice() %>元</h6>
						<h6 class="category">類別: <%= vp.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between" >
						<a href="add-to-cart?id=<%= vp.getId() %>" class="btn btn-primary">加到購物車</a>
						<a href="#" class="btn btn-primary">立即購買</a>
						</div>
					</div>
				</div>
			<% }
		}%>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>

</body>
</html>