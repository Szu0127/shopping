<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light"  >
<!-- style="position:fixed;" -->
		<div class="container" style="background-color:#FFBB77; position:fixed;">
			<a class="navbar-brand" href="index.jsp">教育影音網</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="index.jsp">首頁</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">購物車
					<span class="badge badge-danger px-1">${ cart_list.size() }</span><%-- 加在購物車後面的個數圖示 --%>
					</a></li>
					<%if( auth != null){ %>
						<li class="nav-item"><a class="nav-link disabled" style="float:right ;" href="orders.jsp">訂單資訊</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="log-out">登出</a></li>
						
					<%}else{%>
						<li class="nav-item"><a class="nav-link disabled" href="login.jsp">登入</a></li>
						
					<% }%>
					
				
					</ul>

			</div>
		</div>
	</nav>