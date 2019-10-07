<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String signup_id = (String)request.getAttribute("signup_id");
%>
<jsp:include page="/top.jsp" />

<style type="text/css">
	.login-form {
		width: 500px;
    	margin: 30px auto;
	}
	.login-form form {
    	border-radius: 1px;
        background: #fff;
        padding: 20px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 3px;
    }
    .btn, .btn-primary{
    	border: 0px;
        font-size: 16px;
        font-weight: bold;
        outline: none !important;
    }
    .btn:focus, .btn:hover {
    	background-color: #0069d9;
    	border-color: #0062cc;
    }
    .form-group{
		position: relative;
    }
    #iLogin{
		position: absolute;
		left: 15px;
		top: 13px;
		font-size: 18px;
	}
    .form-control {
		padding-left: 40px;
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
		return true;
	}
</script>

<div class="login-form">
    <form name="f" action="${pageContext.request.contextPath}/loginend.do" method="post" onsubmit="return onSubmit()">
        <h2 class="text-center">Log in</h2>       
        <div class="form-group">
        	<i id="iLogin" class="fa fa-user"></i>
            <input type="text" class="form-control" name="member_id" placeholder="ID">
        </div>
        <div class="form-group">
        	<i id="iLogin" class="fa fa-lock"></i>
            <input type="password" class="form-control" name="member_pwd" placeholder="Password">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Log in</button>
        </div>
        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
            <a href="${pageContext.request.contextPath}/join.do" onclick="alert('Create New Account :)')" class="pull-right">Forgot Password?</a>
        </div>        
    </form>
    <p class="text-center"><a href="${pageContext.request.contextPath}/join.do">Create an Account</a></p>
</div>

<jsp:include page="/foot.jsp" />