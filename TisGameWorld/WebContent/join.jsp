<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />

<style type="text/css">
	.form-control, .form-control:focus, .input-group-addon {
		border-color: #e1e1e1;
        border-radius: 0;
	}
	.signup-form {
		width: 500px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.signup-form h2 {
		color: #636363;
        margin: 0 0 15px;
		text-align: center;
    }
    .signup-form form {		
		border-radius: 1px;
        background: #fff;
        padding: 20px;
    }
	.signup-form .form-group {
		margin-bottom: 20px;
	}
	.signup-form .form-group:last-child {
		margin-bottom: 0;
	}
	
	.signup-form label {
		font-weight: normal;
		font-size: 13px;
	}
	.signup-form .form-control {
		min-height: 38px;
		box-shadow: none !important;
		border-width: 0 0 1px 0;
	}	
	.signup-form .input-group-addon {
		max-width: 42px;
		text-align: center;
		background: none;
		border-width: 0 0 1px 0;
		padding-left: 5px;
	}
    .signup-form .btn {        
        font-size: 16px;
        font-weight: bold;
        border-radius: 3px;
		border: 0px;
		min-width: 140px;
        outline: none !important;
    }
	.signup-form .btn:hover, .signup-form .btn:focus {
		background: #179b81;
	}
	.signup-form a {
		color: #19aa8d;
		text-decoration: none;
	}	
	.signup-form a:hover {
		text-decoration: underline;
	}
	.signup-form .fa {
		font-size: 21px;
	}
	.signup-form .fa-paper-plane {
		font-size: 17px;
	}
	.signup-form .fa-check {
		color: #fff;
		left: 9px;
		top: 18px;
		font-size: 7px;
		position: absolute;
	}
	form ~ p {
	    margin-top: 20px;
	}
</style>

<script type="text/javascript">
	var onSubmit = function() {
		if (!f.member_id.value) {
			alert('Enter your ID');
			f.member_id.focus();
			return false;
		}
		else if (!f.member_pwd.value) {
			alert('Enter your password');
			f.member_pwd.focus();
			return false;
		}
		else if (!f.member_name.value) {
			alert('Enter your name');
			f.member_name.focus();
			return false;
		}
		else if (f.member_pwd.value != f.member_pwd_confirm.value) {
			alert('Passwords not matched');
 			f.member_pwd_confirm.value = "";
			f.member_pwd_confirm.focus();
			return false;
		}
		return true;
	}
</script>

<div class="signup-form">	
    <form name="f" action="${pageContext.request.contextPath}/joinend.do" method="post" onsubmit="return onSubmit()">
		<h2>Create Account</h2>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="id" class="form-control" name="member_id" placeholder="ID">
			</div>
			<!-- <span class="text-danger">Already in used</span> -->
        </div>
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-lock"></i></span>
				<input type="password" class="form-control" name="member_pwd" placeholder="Password">
			</div>
        </div>
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon">
					<i class="fa fa-lock"></i>
					<i class="fa fa-check"></i>
				</span>
				<input type="password" class="form-control" name="member_pwd_confirm" placeholder="Confirm Password">
			</div>
			<!-- <span class="text-danger">Passwords must match</span> -->
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
				<input type="text" class="form-control" name="member_name" placeholder="Username">
			</div>
        </div>
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Sign Up</button>
        </div>
    </form>
	<p class="text-center">Already have an account? <a href="${pageContext.request.contextPath}/login.do">Login here</a>.</p>
</div>

<jsp:include page="/foot.jsp" />