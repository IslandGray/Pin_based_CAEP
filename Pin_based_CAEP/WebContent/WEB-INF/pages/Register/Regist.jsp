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
				<form action="" method="post" enctype="multipart/form-data">
					<fieldset>
						<div class="card border-dark mb-3" style="">
						<div class="card-body">
							<div class="form-group">
								<label for="inputEmail">E-mail address</label>
								<input readonly="" class="form-control" name="inputEmail" id="inputEmail" placeholder="Enter email" type="email">
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
						    <div class="form-group">
						      <label for="inputName">Name</label>
						      <input class="form-control" id="inputName" aria-describedby="nameHelp" placeholder="Enter Name" type="text">
						    </div>
						    <div class="form-group">
						      <label for="inputPassword">Password</label>
						      <input class="form-control" id="inputPassword" placeholder="Password" type="password">
						      <small id="passHelp" class="form-text text-muted" ><font color=red></font></small>
						    </div>
						    <div class="form-group">
						      <label for="inputPassword2">Password Repeat</label>
						      <input class="form-control" onchange="check()" id="inputPassword2" placeholder="Password Repeat" type="password">
						    </div>
						    <script type="text/javascript">
						    	function check() {
						    		var pass1=document.getElementById(inputPassword);
						    		var pass2=document.getElementById(inputPassword2);
						    		if(pass1.value!=pass2.value){
						    			document.getElementById(passHelp).value="Wrong Password.";
						    		}
								}
						    </script>
						    <div class="form-group">
						      <label for="inputRole">Role</label>
						      <select class="form-control" id="inputRole"">
						        <option>Student/学生</option>
						        <option>Teacher/教师</option>
						        <option>TA/助教</option>
						      </select>
						    </div>
						    <div class="form-group">
						      <label for="exampleSelect2">Example multiple select</label>
						      <select multiple="" class="form-control" id="exampleSelect2">
						        <option>1</option>
						        <option>2</option>
						        <option>3</option>
						        <option>4</option>
						        <option>5</option>
						      </select>
						    </div>
						    <div class="form-group">
						      <label for="exampleTextarea">Example textarea</label>
						      <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
						    </div>
						    <div class="form-group">
						      <label for="exampleInputFile">File input</label>
						      <input class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" type="file">
						      <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
						    </div>
						    <fieldset class="form-group">
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
						      <legend>Checkboxes</legend>
						      <div class="form-check">
						        <label class="form-check-label">
						          <input class="form-check-input" value="" checked="" type="checkbox">
						          Option one is this and that—be sure to include why it's great
						        </label>
						      </div>
						      <div class="form-check disabled">
						        <label class="form-check-label">
						          <input class="form-check-input" value="" disabled="" type="checkbox">
						          Option two is disabled
						        </label>
						      </div>
							
							<div style="height:20px"></div>
							<button type="submit" class="btn btn-dark" onclick="check()" style="display:flex;box-sizing:border-box;justify-content:center;align-items:center;width:100%">Submit</button>
							
						</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	<footer id="footer">
		<div class="row">
			<div class="col-lg-12">
				<div style="height:40%"></div>
				<HR style="width:100%">
				<div class="float-lg-right"><a href="https://bootswatch.com/yeti/#top">Back to top</a></div>
				
				<ul class="list-unstyled" style="display:flex;flex-direction:row;justify-content:flex-start;">
			        <li style="flex-basis:55px;"><a href="http://blog.bootswatch.com/" onclick="pageTracker._link(this.href); return false;">Blog</a></li>
			        <li style="flex-basis:55px;"><a href="https://feeds.feedburner.com/bootswatch">RSS</a></li>
			        <li style="flex-basis:75px;"><a href="https://twitter.com/bootswatch">Twitter</a></li>
			        <li style="flex-basis:75px;"><a href="https://github.com/thomaspark/bootswatch/">GitHub</a></li>
			        <li style="flex-basis:55px;"><a href="https://bootswatch.com/help/#api">API</a></li>
			        <li style="flex-basis:55px;"><a href="https://bootswatch.com/help/#donate">Donate</a></li>
			    </ul>
			    <ul class="list-unstyled" style="display:flex;flex-direction:column;justify-content:flex-start;">
			      <li>Made by <a href="http://thomaspark.co/">Thomas Park</a>.</li>
			      <li>Code released under the <a href="https://github.com/thomaspark/bootswatch/blob/master/LICENSE">MIT License</a>.</li>
			      <li>Based on <a href="https://getbootstrap.com/" rel="nofollow">Bootstrap</a>. Icons from <a href="http://fontawesome.io/" rel="nofollow">Font Awesome</a>. Web fonts from <a href="https://fonts.google.com/" rel="nofollow">Google</a>.</li>
				</ul>
	        </div>
	    </div>
	</footer>
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
</body>
</html>