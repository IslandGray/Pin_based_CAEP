<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.wcp.DAO.*,java.util.List" %>
<%
	String acc=(String)(session.getAttribute("USER"));
	LoadQuery ld=new LoadQuery();
	User user=(User)(ld.queryRTN("User", "account", acc, ""));
	session.removeAttribute("username");
	session.setAttribute("username", user.getName());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>账户设置</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
	
	<style type="text/css">
		.list-group-item > .badge {
		  float: right;
		}
		.list-group-item > .badge + .badge {
		  margin-right: 5px;
		}
	</style>
</head>
<body>

<script src="./pageSources/navbar.js"></script>

<div class="container" style="margin-top:50px">
	<div class="row clearfix">	
		<div style="display:flex;justify-content:center;padding:20px 10px;width:100%;">	
			<div class="col-md-12 column">	
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h2 id="HomeTitle">Computer Architecture Experiment Platform</h2>
					<p id="HomeSummary">Welcome back,</p>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-2 column">
					<div class="list-group">
					    <a href="#" id="0Btn" class="list-group-item list-group-item-action active" style="box-pack:end;">
					    	修改密码
					    	<span class="badge badge-light badge-pill"></span>
					    </a>
					    
					</div>
				</div>
				<div class="col-md-10 column">
					<div id="0c">
						<form action="editAccount.action" method="post" enctype="multipart/form-data">
							<fieldset>
								<div class="card border-dark mb-3" style="">
								<div class="card-body">
									<fieldset class="form-group">
										<legend>Account</legend>
										<div class="form-group">
											<label for="inputEmail">E-mail address<a style="color:red">*</a></label>
											<input readonly="" class="form-control" name="inputEmail" id="inputEmail" placeholder="Enter email" type="email" value="<%=acc %>">
											<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
										</div>
									    <div class="form-group">
									      <label for="inputPassword">Old Password<a style="color:red">*</a></label>
									      <input class="form-control" id="oldPassword" name="oldPassword" placeholder="Password" type="password">
									    </div>
									    
									    <div class="form-group">
									      <label for="inputPassword">New Password<a style="color:red">*</a></label>
									      <input class="form-control" onchange="check()" id="inputPassword" name="newPassword" placeholder="Password" type="password">
									      <small id="passHelp" class="form-text text-muted" ></small>
									    
									      <label for="inputPassword2">New Password Repeat<a style="color:red">*</a></label>
									      <input class="form-control" onkeyup="check()" id="inputPassword2" placeholder="Password Repeat" type="password">
									    </div>
									    
								    </fieldset>
								   
									<div style="height:20px"></div>
									<div id="alertEmpty" style="display:none" class="text-danger">Something Empty!</div>
									<button type="submit" class="btn btn-dark" onclick="return checkAll();" id="submitButton" style="display:flex;box-sizing:border-box;justify-content:center;align-items:center;width:100%">Submit</button>
									
								</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				
			</div>
		</div>
		</div>
	</div>
	
	
	<script src="./pageSources/footer.js"></script>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="./js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
function checkAll() {
	var o=document.getElementById('oldPassword').value;
	var p1=document.getElementById('inputPassword').value;
	var p2=document.getElementById('inputPassword2').value;
	if(p1=="" || p2=="" || o==""){
		document.getElementById('alertEmpty').style.display="block";
		return false;
	}
}
function check() {
		var pass1=document.getElementById('inputPassword').value;
		var pass2=document.getElementById('inputPassword2').value;
		if(pass1==pass2){
			document.getElementById('passHelp').innerHTML="";
			document.getElementById('submitButton').disabled=false;
		}else{
			document.getElementById('passHelp').innerHTML="<font color=red>Wrong Password.</font>";
			document.getElementById('submitButton').disabled=true;
		}
}
function get(p){
	//var url=location.search;
	var url= document.URL.toString();
	var tmpStr=p+"=";
	var tmp_reg=eval("/[\?&]"+tmpStr+"/i");
	if(url.search(tmp_reg)==-1)return null;
	else{
	    var a=url.split(/[\?&]/);
	    for(var i=0;i<a.length;i++)
	         if(a[i].search(eval("/^"+tmpStr+"/i"))!=-1)return a[i].substring(tmpStr.length);
	}
}

window.onload=function (){
	var myUser="<%=session.getAttribute("USER")%>";
	if(myUser!="null" && myUser!=""){
		document.getElementById("noLog").style.display="none";
		document.getElementById("yourAccount").innerHTML=myUser;
		document.getElementById("hasLog").style.display="inline";
	}else{
		document.getElementById("noLog").style.display="inline-box";
		document.getElementById("hasLog").style.display="none";
	}
	//document.getElementById("navbar-achievement").setAttribute("class","nav-item active");
	
	var userName="<%=session.getAttribute("username")%>";
	document.getElementById("HomeSummary").innerHTML=userName+" 的 个人资料";
	
	if(get("tag")==1){
		alert("密码修改成功，下次登陆生效，或点击注销立即重新登陆。");
	}else if(get("tag")==2){
		alert("Wrong Password");
	}
	
	var selectSchool=<%=user.getSchool() %>;
	switch (selectSchool) {
	case 0:
		document.getElementById("inputSchool").selectedIndex=0;
		break;
	case 65535:
		document.getElementById("inputSchool").selectedIndex=1;
		break;
	default:
		break;
	}
	
}


</script>

</body>
</html>