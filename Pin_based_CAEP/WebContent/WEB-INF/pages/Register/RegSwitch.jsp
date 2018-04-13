<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="./css/bootstrap.css">
	
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="./css/bootstrap-theme.css">
	<!--  
	<style type="text/css">
        li{
            float:left;
            list-style:none;
            
        }
	</style>
	-->
	
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
<div class="container">
  <a class="navbar-brand" href="#">CAEP</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right"> 
            <li class="nav-item">
            	<a class="nav-link" href="RegSwitch.action">Sign Up</a>
            </li> 
            <li class="nav-item">
            	<a class="nav-link" href="#">Log In</a>
            </li> 
    </ul>
         
  </div>
</div>
</nav>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<div class="jumbotron">
				<h1>
					Hello, world!
				</h1>
				<p>
					This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="#">Learn more</a>
				</p>
			</div>
		</div>
		<div class="col-md-6 column">
			<div class="jumbotron">
				<h1>
					Hello, world!
				</h1>
				<p>
					This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="#">Learn more</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h2>lalala</h2>
		</div>
	</div>
	
	<footer id="footer">
		<div class="row">
			<div class="col-lg-12">
				<ul class="list-unstyled">
			        <li class="float-lg-right"><a href="https://bootswatch.com/yeti/#top">Back to top</a></li>
			        <li><a href="http://blog.bootswatch.com/" onclick="pageTracker._link(this.href); return false;">Blog</a></li>
			        <li><a href="https://feeds.feedburner.com/bootswatch">RSS</a></li>
			        <li><a href="https://twitter.com/bootswatch">Twitter</a></li>
			        <li><a href="https://github.com/thomaspark/bootswatch/">GitHub</a></li>
			        <li><a href="https://bootswatch.com/help/#api">API</a></li>
			        <li><a href="https://bootswatch.com/help/#donate">Donate</a></li>
			    </ul>
			      <p>Made by <a href="http://thomaspark.co/">Thomas Park</a>.</p>
			      <p>Code released under the <a href="https://github.com/thomaspark/bootswatch/blob/master/LICENSE">MIT License</a>.</p>
			      <p>Based on <a href="https://getbootstrap.com/" rel="nofollow">Bootstrap</a>. Icons from <a href="http://fontawesome.io/" rel="nofollow">Font Awesome</a>. Web fonts from <a href="https://fonts.google.com/" rel="nofollow">Google</a>.</p>

	        </div>
	    </div>
	</footer>
</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script type="text/javascript" src="./js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="./js/bootstrap.js"></script>
</body>
</html>