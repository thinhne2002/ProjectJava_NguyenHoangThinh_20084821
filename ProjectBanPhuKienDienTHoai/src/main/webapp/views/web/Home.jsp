<%@page import="entity.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="entity.Cart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="<c:url value='/views/css/assets/favicon.ico' />" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/views/css/Home.css' />" rel="stylesheet" />
</head>
<%
	Cart cart =(Cart) session.getAttribute("cart");
	if(cart == null){
		cart = new Cart();
	}
	NumberFormat n = NumberFormat.getCurrencyInstance();
	
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Navigation-->

	<!-- Header-->
	<header style="text-align: center;">
		<img style="width: 81%;"src="https://dknstore.vn/wp-content/uploads/2022/04/banner-dkn-store-01.jpg" />
	</header>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${listP}" var="p">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<c:choose>
                					<c:when test="${fn:startsWith(p.image, 'http://') || fn:startsWith(p.image, 'https://')}">
                    					<img src="${p.image}" alt="${p.title}">
                					</c:when>
                					<c:otherwise>
                    					<img src="<%= request.getContextPath() %>/views/css/imageProduct/${p.image}" alt="${p.title}">
               						</c:otherwise>
            						</c:choose>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder"><a style="text-decoration: none;" href="detail?pid=${p.id}" title="Detail">
									${p.name}</a></h5>
									<!-- Product price-->
									<p><fmt:formatNumber value="${p.price}"/> VNĐ</p>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">							
								    <div class="input-group-append">
									    <a href="addtocart?action=post&id=${p.id}" class="btn btn-outline-dark mt-auto">Add to Cart</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>