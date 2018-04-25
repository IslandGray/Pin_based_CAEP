<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
	 
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
        <a class="nav-link" href="#">Log In</a>
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
					<h5>How would you like to continue?</h5>
				</div>
				<button type="button" class="btn btn-outline-dark" style="display:flex;box-sizing:border-box;justify-content:center;align-items:center;width:100%">
				Continue with 统一身份认证
				</button>
				<div style="display:flex;flex-direction:row;flex-basis:50px">
					<HR width=100%>
				</div>
				<h5>OR</h5>
				<form action="Login.action" method="post" enctype="multipart/form-data">
					<fieldset>
						<div class="card border-dark mb-3" style="">
						<div class="card-body">
							<label for="InputEmail">Your E-mail:</label>
							<input class="form-control" name="inputEmail" id="inputEmail" placeholder="Enter email" type="email">
							<label for="InputPassword">Password:</label>
							<input class="form-control" name="inputPassword" placeholder="Password" type="password">
							<div style="height:20px"></div>
							<button type="submit" class="btn btn-dark" style="display:flex;box-sizing:border-box;justify-content:center;align-items:center;width:100%">Submit</button>
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
				<div class="float-lg-right"><a href="#">Back to top</a></div>
				
				<ul class="list-unstyled" style="display:flex;flex-direction:row;justify-content:flex-start;">
			        <li style="flex-basis:55px;"><a href="#" onclick="pageTracker._link(this.href); return false;">Blog</a></li>
			        <li style="flex-basis:55px;"><a href="#">RSS</a></li>
			        <li style="flex-basis:75px;"><a href="#">Twitter</a></li>
			        <li style="flex-basis:75px;"><a href="#">GitHub</a></li>
			        <li style="flex-basis:55px;"><a href="#">API</a></li>
			        <li style="flex-basis:55px;"><a href="#">Donate</a></li>
			    </ul>
			    <ul class="list-unstyled" style="display:flex;flex-direction:column;justify-content:flex-start;">
			      <li>Made by <a href="#">Chunpei Wang</a>.</li>
			      <li>Code released under the <a href="#">MIT License</a>.</li>
			      <li>Based on <a href="https://getbootstrap.com/" rel="nofollow">Bootstrap</a>. Web fonts from <a href="https://fonts.google.com/" rel="nofollow">Google</a>.</li>
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