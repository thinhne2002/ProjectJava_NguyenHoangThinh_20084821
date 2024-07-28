<%@page import="entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V4</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value='/views/css/Home.css' />" rel="stylesheet" />
    <!--===============================================================================================-->    
    <link rel="icon" type="image/png" href="<c:url value='/views/css/images/icons/favicon.ico'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/vendor/bootstrap/css/bootstrap.min.css'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/fonts/iconic/css/material-design-iconic-font.min.css'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/vendor/animate/animate.css'/>"/>
    <!--===============================================================================================-->    
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/vendor/css-hamburgers/hamburgers.min.css'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/vendor/animsition/css/animsition.min.css'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/vendor/select2/select2.min.css'/>"/>
    <!--===============================================================================================-->    
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/vendor/daterangepicker/daterangepicker.css'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/css/util.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/views/css/css/main.css'/>"/>
    <!--===============================================================================================-->
</head>

<%
	Cart cart =(Cart) session.getAttribute("cart");
	if(cart == null){
		cart = new Cart();
	}
%>
<body>
    <div class="limiter">
        <div class="container-login100" style="background-image: url('<c:url value="/views/css/images/bg-01.jpg"/>');">
            <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                <!-- Form Đăng Nhập -->
<form id="login-form" class="login100-form validate-form" action="<c:url value='/login'/>" method="post">
    <span class="login100-form-title p-b-49">Login</span>
    <c:if test="${not empty mess}">
        <div class="error-message" style="color: red; border: 1px solid red; padding: 10px; border-radius: 5px; background-color: #fdd; margin: 10px 0;">
            ${mess}
        </div>
    </c:if>
    
    <div class="wrap-input100 validate-input m-b-23" data-validate="Username is required">
        <span class="label-input100">Username</span>
        <input class="input100" type="text" name="user" placeholder="Username, Phone Number or Email" required>
        <span class="focus-input100" data-symbol="&#xf206;"></span>
    </div>
    <div class="wrap-input100 validate-input" data-validate="Password is required">
        <span class="label-input100">Password</span>
        <input class="input100" type="password" name="pass" placeholder="Type your password" required>
        <span class="focus-input100" data-symbol="&#xf190;"></span>
    </div>
    <div class="text-right p-t-8 p-b-31">
        <a href="#" id="forgot_pswd">Forgot password?</a>
    </div>
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button class="login100-form-btn" type="submit">Login</button>
        </div>
    </div>
    <div class="flex-col-c p-t-50">
        <span class="txt1 p-b-17">Don't have an account?</span>
        <a class="txt2" id="btn-signup">Sign Up</a>
    </div>
</form>

<!-- Form Đăng Ký -->
<form id="signup-form" class="login100-form validate-form" action="<c:url value='/signup'/>" method="post" style="display:none;">
    <span class="login100-form-title p-b-49">Sign Up</span>
    <div class="wrap-input100 validate-input m-b-23" data-validate="Username is required">
        <span class="label-input100">Username</span>
        <input class="input100" type="text" name="username" placeholder="Type your username" required>
        <span class="focus-input100" data-symbol="&#xf206;"></span>
    </div>
    <div class="wrap-input100 validate-input" data-validate="Password is required">
        <span class="label-input100">Password</span>
        <input class="input100" type="password" name="password" placeholder="Type your password" required>
        <span class="focus-input100" data-symbol="&#xf190;"></span>
    </div>
    <div class="wrap-input100 validate-input" data-validate="Confirm password is required">
        <span class="label-input100">Confirm Password</span>
        <input class="input100" type="password" name="confirm_password" placeholder="Re-type your password" required>
        <span class="focus-input100" data-symbol="&#xf190;"></span>
    </div>
    <div class="wrap-input100 validate-input m-b-23" data-validate="Email is required">
        <span class="label-input100">FullName</span>
        <input class="input100" type="text" name="fullname" placeholder="Type your email" required>
        <span class="focus-input100" data-symbol="&#xf207;"></span>
    </div>
    <div class="wrap-input100 validate-input m-b-23" data-validate="Phone number is required">
        <span class="label-input100">Phone</span>
        <input class="input100" type="tel" name="phone" pattern="[0-9]{10}" placeholder="Type your phone number" required>
        <span class="focus-input100" data-symbol="&#xf2be;"></span>
    </div>
    <div class="wrap-input100 validate-input m-b-23" data-validate="Email is required">
        <span class="label-input100">Email</span>
        <input class="input100" type="email" name="email" placeholder="Type your email" required>
        <span class="focus-input100" data-symbol="&#xf15a;"></span>
    </div>
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button class="login100-form-btn" type="submit">Sign Up</button>
        </div>
    </div>
    <div class="flex-col-c p-t-50">
        <span class="txt1 p-b-17">Already have an account?</span>
        <a class="txt2" id="cancel_signup">Login</a>
    </div>
</form>
            </div>
        </div>
    </div>

    <div id="dropDownSelect1"></div>

    <!-- Tải các tập tin JavaScript -->
    <script src="<c:url value='/views/css/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
    <script src="<c:url value='/views/css/vendor/animsition/js/animsition.min.js'/>"></script>
    <script src="<c:url value='/views/css/vendor/bootstrap/js/popper.js'/>"></script>
    <script src="<c:url value='/views/css/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/views/css/vendor/select2/select2.min.js'/>"></script>
    <script src="<c:url value='/views/css/vendor/daterangepicker/moment.min.js'/>"></script>
    <script src="<c:url value='/views/css/vendor/daterangepicker/daterangepicker.js'/>"></script>
    <script src="<c:url value='/views/css/vendor/countdowntime/countdowntime.js'/>"></script>
    <script src="<c:url value='/views/css/js/main.js'/>"></script>

    <!-- JavaScript để điều khiển hiển thị các form -->
     <!-- JavaScript để điều khiển hiển thị các form -->
    <!-- JavaScript để điều khiển hiển thị các form -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        function validateForm(form) {
            let isValid = true;
            const inputs = form.querySelectorAll('input[required]');
            
            inputs.forEach(function(input) {
                if (!input.value.trim()) {
                    input.classList.add('alert-validate');
                    isValid = false;
                } else {
                    input.classList.remove('alert-validate');
                }
            });
            
            return isValid;
        }

        function handleFormSubmit(e) {
            e.preventDefault(); // Ngăn gửi form mặc định
            
            const form = e.target; // Form hiện tại
            
            if (validateForm(form)) {
                form.submit(); // Chỉ gửi form nếu hợp lệ
            } else {
                // Hiển thị thông báo lỗi nếu có trường không hợp lệ
                alert('Please fill in all required fields.');
            }
        }

        window.showSignUpForm = function() {
            const loginForm = document.getElementById('login-form');
            const signupForm = document.getElementById('signup-form');

            loginForm.style.display = 'none';
            signupForm.style.display = 'block';

            clearFormErrors('login-form'); // Xóa thông báo lỗi form đăng nhập
            resetForm('login-form'); // Reset form đăng nhập
            hideMessage('login-form'); // Ẩn thông báo lỗi
        }

        window.showLoginForm = function() {
            const loginForm = document.getElementById('login-form');
            const signupForm = document.getElementById('signup-form');

            signupForm.style.display = 'none';
            loginForm.style.display = 'block';

            clearFormErrors('signup-form'); // Xóa thông báo lỗi form đăng ký
            resetForm('signup-form'); // Reset form đăng ký
            hideMessage('signup-form'); // Ẩn thông báo lỗi
        }

        // Hàm ẩn thông báo lỗi
        function hideMessage(formId) {
            const form = document.getElementById(formId);
            if (form) {
                const errorMessages = form.querySelectorAll('.error-message');
                errorMessages.forEach(function(el) {
                    el.style.display = 'none'; // Ẩn thông báo lỗi
                });
            }
        }

        // Xóa thông báo lỗi của form không hiển thị
        function clearFormErrors(formId) {
            const form = document.getElementById(formId);
            if (form) {
                const errorElements = form.querySelectorAll('.wrap-input100.validate-input');
                errorElements.forEach(function(el) {
                    el.classList.remove('alert-validate'); // Giả sử bạn dùng lớp này để hiển thị lỗi
                });
            }
        }

        // Reset các trường của form
        function resetForm(formId) {
            const form = document.getElementById(formId);
            if (form) {
                form.reset(); // Reset các trường của form
            }
        }

        // Gán sự kiện submit cho các form
        document.getElementById('login-form').addEventListener('submit', handleFormSubmit);
        document.getElementById('signup-form').addEventListener('submit', handleFormSubmit);

        // Xử lý các nút chuyển đổi giữa các form
        document.getElementById('btn-signup').addEventListener('click', showSignUpForm);
        document.getElementById('cancel_signup').addEventListener('click', showLoginForm);
        document.getElementById('forgot_pswd').addEventListener('click', function(e) {
            e.preventDefault(); // Ngăn chuyển hướng mặc định
            // Bạn có thể thêm logic cho việc quên mật khẩu ở đây
        });
    });

</script>
</body>
</html>