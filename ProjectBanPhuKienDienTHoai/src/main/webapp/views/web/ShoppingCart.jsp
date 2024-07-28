<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Your Shopping Cart</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="<c:url value='/views/css/css/manager.css' />" rel="stylesheet" />
    <style>
        img {
            width: 200px;
            height: 120px;
        }
    </style>
</head>
<%

	Cart cart = (Cart)session.getAttribute("cart");
	List<CartItem> cartItems = new ArrayList<>();
	double totalPrice = 0.0;
	if(cart == null){
		response.sendRedirect("../../home");
	} else {
		cartItems = cart.getcartitemlist();
		totalPrice = cart.getTotalPrice();
	}
	NumberFormat n = NumberFormat.getCurrencyInstance();
	String e = request.getAttribute("error") == null ?"":(String)request.getAttribute("error");
%>
<body>
    <div class="container">
        <div class="table-wrapper">
		    <div class="table-title">
		        <div class="row">
		            <div class="col-sm-6">
		                <h2>Your <b>Cart</b></h2>
		            </div>
		            <div class="col-sm-6">
		                <h2>Account: <b>${sessionScope.acc.fullname}</b></h2>
		            </div>
		        </div>
		    </div>
		    
		    <table class="table table-striped table-hover">
		        <thead>
		            <tr>
		                <th>STT</th>
		                <th>Name</th>
		                <th>Image</th>
		                <th>Quantity</th>
		                <th>Price</th>
		                <th>Total</th>
		                <th>Action</th>
		            </tr>
		        </thead>
		        <tbody>
		            <% 
		                int count = 1;
		                int total = 0;
		                for (CartItem ci : cartItems) {
		                    String img = ci.getProduct().getImage();
		                    boolean isExternal = img.startsWith("http://") || img.startsWith("https://");
		                    request.setAttribute("isExternal", isExternal);
		            %>
		            <tr>
		                <td><%= count++ %></td>
		                <td><%= ci.getProduct().getName() %></td>
		                <td>
		                    <c:choose>
		                        <c:when test="${isExternal}">
		                            <img src="<%= img %>" alt="<%= ci.getProduct().getName() %>">
		                        </c:when>
		                        <c:otherwise>
		                            <img src="<%= request.getContextPath() %>/views/css/imageProduct/<%= img %>" alt="<%= ci.getProduct().getName() %>">
		                        </c:otherwise>
		                    </c:choose>
		                </td>
		                <td><%= ci.getQuanlity() %></td>
		                <td><fmt:formatNumber value="<%= ci.getProduct().getPrice() %>"/> VNĐ</td>
		                <td><fmt:formatNumber value="<%= ci.getTotalPrice() %>"/> VNĐ</td>
		                <td style="display: flex; gap: 10px;margin-top: 50px">
		                    <form action="../../addtocart" >
		                        <input type="number" name="quanlity" min="1" required>
		                        <input type="hidden" name="action" value="put">
		                        <input type="hidden" name="id" value="<%= ci.getProduct().getId() %>">
		                        <button type="submit" class="btn btn-success btn-sm">Cập Nhập</button>
		                    </form>
		                    <form action="../../addtocart" style="margin: 0;">
		                        <input type="hidden" name="action" value="delete">
		                        <input type="hidden" name="id" value="<%= ci.getProduct().getId() %>">
		                        <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
		                    </form>
		                </td>
		            </tr>
		            <% } %>
		        </tbody>
		    </table>
		    <!-- Total-->
		    <div class="row">
		        <div class="col-sm-12">
		            <div class="text-right">
		                <h4>Total Price: <fmt:formatNumber value="<%= totalPrice %>"/> VNĐ</h4>
		            </div>
		        </div>
		    </div>
		</div>

           
           <!-- <div class="clearfix">
                <ul class="pagination">
                    <li style="${tag == 1 ? 'pointer-events: none;':''}" 
                    class="${tag > 1  ? 'page-item' : 'page-item disabled'}">
                    <a href="cart?index=${tag-1}" class="page-link">Previous</a></li>
                    <c:forEach begin="1" end="${endp}" var="i">
                        <li class="${tag == i ? 'page-item active' : 'page-item'}">
                            <a href="cart?index=${i}" class="page-link">${i}</a>
                        </li>
                    </c:forEach>
                    <li style="${tag == endp ? 'pointer-events: none;':''}" 
                    class="${tag < endp ? 'page-item' : 'page-item disabled'}">
                    <a href="cart?index=${tag+1}" class="page-link">Next</a>
                    </li>
                </ul>
            </div>
        </div> --> 
        <a href="../../home"><button type="button" class="btn btn-primary">Back to home</button></a>
    </div>      
    <script src="<c:url value='/views/css/js/manager.js' />" type="text/javascript"></script>
</body>
</html>
