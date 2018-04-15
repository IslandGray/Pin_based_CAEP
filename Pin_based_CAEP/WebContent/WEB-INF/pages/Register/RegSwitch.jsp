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
  <a class="navbar-brand" href="#">CAEP</a>
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
					<h5>How would you like to continue?</h5>
				</div>
				<button type="button" class="btn btn-outline-dark" style="display:flex;box-sizing:border-box;justify-content:center;align-items:center;width:100%">
				Continue with 统一身份认证
				</button>
				<div style="display:flex;flex-direction:row;flex-basis:50px">
					<HR width=100%>
				</div>
				<h5>OR</h5>
				<form action="RegSubmitTest.action" method="post" enctype="multipart/form-data">
					<fieldset>
						<div class="card border-dark mb-3" style="">
						<div class="card-body">
							<label for="InputEmail">Your E-mail:</label>
							<input class="form-control" id="InputEmail" placeholder="Enter email" type="email">
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
</body>
</html>