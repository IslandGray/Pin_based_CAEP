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
	<title>个人资料</title>
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
					    	个人资料
					    	<span class="badge badge-light badge-pill"></span>
					    </a>
					    
					</div>
				</div>
				<div class="col-md-10 column">
					<div id="0c">
						<form action="editProfile.action" method="post" enctype="multipart/form-data">
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
									      <label for="inputName">Name<a style="color:red">*</a></label>
									      <input class="form-control" id="inputName" name="inputName" aria-describedby="nameHelp" placeholder="Enter Name" type="text" value="<%=user.getName() %>">
									    </div>
									    
								    </fieldset>
								    <fieldset class="form-group">
								    	<legend>Education Info</legend>
									    <div class="form-group">
									      <label for="inputRole">Role<a style="color:red">*</a></label>
									      <%
											  	String role=user.getRole();
											  	switch(role){
											  	case "1":
											  		role="teacher";break;
											  	case "2":
											  		role="TA";break;									
											  	}
									      %>
								          <input readonly="" class="form-control" id="inputRole" name="inputRole" placeholder="Enter Role" type="text" value="<%=role %>">
									      
									    </div>
									     <div class="form-group">
									      <label for="inputSchool">School<a style="color:red">*</a></label>
									      <select class="form-control" id="inputSchool" name="inputSchool">
									        <option value="0">哈尔滨工业大学</option>
									        <option value="65535">其他</option>
									      </select>
									      <!-- 
									      <input class="form-control" id="inputSchool" aria-describedby="schoolHelp" placeholder="Enter School" type="text">
									       -->
									    </div>
									    <div class="form-group" id="stuForm">
									      <label id="labelid" for="inputStuID">ID(教职工号)<a style="color:red">*</a></label>
									      <input class="form-control" id="inputStuID" name="inputStuID" aria-describedby="stuidHelp" placeholder="Enter Student ID" type="text" value="<%=user.getStudentID()%>">
									    </div>
									    <!-- 
									    <div class="form-group">
									      <label for="inputPhone">Group ID(班号)<a style="color:red">*</a></label>
									      <input class="form-control" id="inputPhone" name="inputPhone" aria-describedby="phoneHelp" placeholder="Enter Class No." type="text" value="<%=user.getGroup()%>">
									    </div>
									     -->
									   
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
		alert("资料修改成功。");
	}else if(get("tag")==2){
		alert("资料修改失败！");
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

function checkAll() {
	var email=document.getElementById('inputEmail').value;
	var name=document.getElementById('inputName').value;
	var id=document.getElementById('inputStuID').value;
	//var group=document.getElementById('inputPhone').value;
	if(email=="" || name=="" ||id=="" ){
		document.getElementById('alertEmpty').style.display="block";
		return false;
	}
}

</script>

</body>
</html>