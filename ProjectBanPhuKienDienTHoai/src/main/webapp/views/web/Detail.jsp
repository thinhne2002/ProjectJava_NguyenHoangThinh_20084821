<%@page import="entity.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
   <head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="<c:url value='/views/web/assets/favicon.ico' />" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/views/css/Home.css' />" rel="stylesheet" />

</head>
    <body>
        <!-- Navigation-->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    	<c:choose>
                			<c:when test="${fn:startsWith(detail.image, 'http://') || fn:startsWith(detail.image, 'https://')}">
                				<img class="card-img-top mb-5 mb-md-0" src="${detail.image}" />
                			</c:when>
                			<c:otherwise>
                    			<img class="card-img-top mb-5 mb-md-0" src="<%= request.getContextPath() %>/views/css/imageProduct/${detail.image}" alt="${r.title}">
               				</c:otherwise>
            			</c:choose>
                    </div>
                    <!-- <img class="card-img-top mb-5 mb-md-0" src="${detail.image}" /> -->
                    <div class="col-md-6">
                        <div class="small mb-1">MASP:${detail.id }</div>
                        <h1 class="display-5 fw-bolder">${detail.name}</h1>
                        <div class="fs-5 mb-5">
                       		<!-- <span class="text-decoration-line-through">$45.00</span>-->
                            <span> <fmt:formatNumber value="${detail.price}"/> VNĐ</span>
                        </div>
                        <p class="lead">${detail.description}</p>
                        <div class="d-flex">
                            <div class="input-group-append">
                            	 <a href="addtocart?action=post&id=${detail.id}" class="btn btn-outline-dark mt-auto">
                            	 <i class="bi-cart-fill me-1"></i>
                            	 Add to Cart</a>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${listR}" var="r">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            
                            <c:choose>
                					<c:when test="${fn:startsWith(r.image, 'http://') || fn:startsWith(r.image, 'https://')}">
                    					<img src="${r.image}" alt="${r.title}">
                					</c:when>
                					<c:otherwise>
                    					<img src="<%= request.getContextPath() %>/views/css/imageProduct/${r.image}" alt="${r.title}">
               						</c:otherwise>
            				</c:choose>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a style="text-decoration: none;" href="detail?pid=${r.id}" title="Detail">
									${r.name}</a></h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${r.price}"/> VNĐ
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" 
                                href="addtocart?action=post&id=${r.id}">
                                Add to Cart</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </div>
                </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
