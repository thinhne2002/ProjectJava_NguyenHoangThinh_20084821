<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entity.Cart" %>
<%
	Cart cart =(Cart) session.getAttribute("cart");
	if(cart == null){
		cart = new Cart();
	}
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="home">PhuKienXin</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<!-- Phân Quyền -->
					<c:if test="${sessionScope.acc == null}">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="views/web/Login.jsp">Login</a></li>
					</c:if>
					<c:if test="${sessionScope.acc != null}">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="logout">Logout</a></li>
					</c:if>
					<c:if test="${sessionScope.acc.isSell == 1}">
						<li class="nav-item"><a class="nav-link" href="manager">Manager Product</a></li>
					</c:if>
					<c:if test="${sessionScope.acc.isAdmin == 1}">
						<li class="nav-item"><a class="nav-link" href="home">Manager Account</a></li>
					</c:if>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="home">All Products</a></li>
							<li><hr class="dropdown-divider" /></li>
							<c:forEach items="${listC}" var="c">
								<li><a class="dropdown-item" href="category?cid=${c.cateID}">${c.cateName}</a></li>
							</c:forEach>
						</ul></li>
				</ul>
				<!-- Tìm kiếm -->
				<form class="d-flex me-3" action="search" method="get">
					<input style="width: 250px;" class="form-control me-1" type="text" placeholder="Tìm Kiếm"
						aria-label="Search" name="txt">
					<button style="margin-left: 10px" class="btn btn-outline-dark" type="submit">Search</button>
				</form>
				<!-- Giỏ hàng -->
					<button class="btn btn-outline-dark d-flex align-items-center" type="button">
					    <a class="nav-link text-dark" href="views/web/ShoppingCart.jsp" style="text-decoration: none;">
					     <i class="bi bi-cart-fill me-2"></i>
					        Cart
					    	 <span class="badge text-black rounded-pill"><%=cart.getSize()%></span>
					    </a>
					</button>
				<c:if test="${sessionScope.acc != null}">
				<div style="margin-left: 20px" class="btn btn-outline-dark">
						${sessionScope.acc.fullname}
				</div>
				</c:if>
			</div>
		</div>
	</nav>
