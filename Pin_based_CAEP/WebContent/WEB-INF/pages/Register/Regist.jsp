<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
	<!--  
	<link rel="stylesheet" href="./css/bootstrap-glyphicons.css">
	-->
	 
	<style type="text/css">
        .navbar {
		    text-align:center;
		}
		.navbar ul {
		    display:inline-block;
		    position: relative;
			left: 44%;
		}
		.navbar li {
		    float:left;
		}
		h5{
			text-align:center;
		}
	</style>
	
	
	
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container">
  <a class="navbar-brand" href="index.jsp">CAEP</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Sign Up</a>
      </li>
    </ul>
    
       
  </div>
</div>
</nav>

<div class="container">
	<div class="row clearfix">
		<div style="display:flex;justify-content:center;padding:20px 10px;width:100%;">
			<div style="justify-content:center;align-items:center;flex-basis:380px;">
				<div>
					<h5>Input the following items:</h5>
				</div>

				<div style="display:flex;flex-direction:row;flex-basis:50px">
					<HR width=100%>
				</div>
				<form action="finishReg.action" method="post" enctype="multipart/form-data">
					<fieldset>
						<div class="card border-dark mb-3" style="">
						<div class="card-body">
							<fieldset class="form-group">
								<legend>Account</legend>
								<div class="form-group">
									<label for="inputEmail">E-mail address<a style="color:red">*</a></label>
									<input readonly="" class="form-control" name="inputEmail" id="inputEmail" placeholder="Enter email" type="email">
									<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								</div>
							    <div class="form-group">
							      <label for="inputName">Name<a style="color:red">*</a></label>
							      <input class="form-control" id="inputName" name="inputName" aria-describedby="nameHelp" placeholder="Enter Name" type="text">
							    </div>
							    <div class="form-group">
							      <label for="inputPassword">Password<a style="color:red">*</a></label>
							      <input class="form-control" onchange="check()" id="inputPassword" name="inputPassword" placeholder="Password" type="password">
							      <small id="passHelp" class="form-text text-muted" ></small>
							    
							      <label for="inputPassword2">Password Repeat<a style="color:red">*</a></label>
							      <input class="form-control" onkeyup="check()" id="inputPassword2" placeholder="Password Repeat" type="password">
							    </div>
							    
						    </fieldset>
						    <fieldset class="form-group">
						    	<legend>Education Info</legend>
							    <div class="form-group">
							      <label for="inputRole">Role<a style="color:red">*</a></label>
							      <select class="form-control" id="inputRole" name="inputRole" onchange="selectrole()">
							        <option id="selectStu" value="0">Student/学生</option>
							        <option id="selectTea" value="1">Teacher/教师</option>
							        <option id="selectTA" value="2">TA/助教</option>
							      </select>
							      
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
							      <label id="labelid" for="inputStuID">Student ID(学号)<a style="color:red">*</a></label>
							      <input class="form-control" id="inputStuID" name="inputStuID" aria-describedby="stuidHelp" placeholder="Enter Student ID" type="text">
							    </div>
							    
							    <div class="form-group">
							      <label for="inputPhone">Class No(班号)<a style="color:red">*</a></label>
							      <input class="form-control" id="inputPhone" name="inputPhone" aria-describedby="phoneHelp" placeholder="Enter Class No." type="text">
							    </div>
							    
							    <div class="form-group" style="display:none">
							      <label for="exampleTextarea">Example textarea</label>
							      <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
							    </div>
							    <div class="form-group" style="display:none">
							      <label for="exampleInputFile">File input</label>
							      <input class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" type="file">
							      <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
							    </div>
						    </fieldset>
						    <fieldset class="form-group" style="display:none">
						      <legend>Radio buttons</legend>
						      <div class="form-check">
						        <label class="form-check-label">
						          <input class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked="" type="radio">
						          Option one is this and that—be sure to include why it's great
						        </label>
						      </div>
						      <div class="form-check">
						      <label class="form-check-label">
						          <input class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2" type="radio">
						          Option two can be something else and selecting it will deselect option one
						        </label>
						      </div>
						      <div class="form-check disabled">
						      <label class="form-check-label">
						          <input class="form-check-input" name="optionsRadios" id="optionsRadios3" value="option3" disabled="" type="radio">
						          Option three is disabled
						        </label>
						      </div>
						    </fieldset>
						    
						    <fieldset class="form-group">
						      <legend>Check</legend>
						      <div class="form-check">
						        <label class="form-check-label">
						          <input class="form-check-input" id="inputCheckOK" onchange="checkOK()" type="checkbox">
						          Yes,everything is OK.
						        </label>
						        
						      </div>
						      <div class="form-check disabled"  style="display:none">
						        <label class="form-check-label">
						          <input class="form-check-input" value="" disabled="" type="checkbox">
						          Option two is disabled
						        </label>
						      </div>
						      </fieldset>
							
							<div style="height:20px"></div>
							<div id="alertEmpty" style="display:none" class="text-danger">Something Empty!</div>
							<button type="submit" class="btn btn-dark" onclick="return checkAll();" disabled="disabled" id="submitButton" style="display:flex;box-sizing:border-box;justify-content:center;align-items:center;width:100%">Submit</button>
							
						</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	<script src="./pageSources/footer.js"></script>
</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script type="text/javascript" src="./js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
 	function getObject(objectId) {
	    if (document.getElementById && document.getElementById(objectId)) {
	        return document.getElementById(objectId);
	    } else if (document.all && document.all(objectId)) {
	        return document.all(objectId);
	    } else if (document.layers && document.layers[objectId]) {
	        return document.layers[objectId];
	    } else {
	        return false;
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

	getObject("inputEmail").value = get("user");  
	//key作为input里的name名，接收到的值就是浏览器里的k参数
	//k是浏览器里的参数名
	}
</script>
<script type="text/javascript">
  	function check() {
  		var pass1=document.getElementById('inputPassword').value;
  		var pass2=document.getElementById('inputPassword2').value;
  		if(pass1==pass2){
  			document.getElementById('passHelp').innerHTML="";
  			document.getElementById('inputCheckOK').disabled=false;
  		}else{
  			document.getElementById('passHelp').innerHTML="<font color=red>Wrong Password.</font>";
  			document.getElementById('inputCheckOK').disabled=true;
  			document.getElementById('inputCheckOK').checked=false;
  			document.getElementById('submitButton').disabled=true;
  		}
	}
</script>
<script type="text/javascript">
   	function selectrole() {
		var select=document.getElementById('inputRole').value;
		if(select=="0"){
			document.getElementById('inputStuID').placeholder="Enter Student ID";
			document.getElementById('labelid').innerHTML="Student ID<font color=red>*<font>";
			document.getElementById('inputPhone').readOnly=false;
			document.getElementById('inputPhone').value="";
		}else if(select=="1" || select=="2"){
			document.getElementById('inputStuID').placeholder="Enter ID";
			document.getElementById('labelid').innerHTML="ID<font color=red>*<font>";
			document.getElementById('inputPhone').readOnly=true;
			if(select=="1"){
				document.getElementById('inputPhone').value="teacher";
			}
			else if (select=="2") {
				document.getElementById('inputPhone').value="ta";
			}
		}
	}
</script>
<script type="text/javascript">
   	function checkOK() {
		var box=document.getElementById('inputCheckOK');
		var button=document.getElementById('submitButton');
		if(box.checked==true){
			button.disabled=false;
		}else{
			button.disabled=true;
		}
	}
   	function checkAll() {
		var email=document.getElementById('inputEmail');
		var name=document.getElementById('inputName');
		var passwd=document.getElementById('inputPassword');
		var id=document.getElementById('inputStuID');
		var group=document.getElementById('inputPhone');
		if(email.value=="" || name.value==""||passwd.value==""||id.value=="" || group.value==""){
			document.getElementById('alertEmpty').style.display="block";
			return false;
		}
	}
</script>
</body>
</html>