<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-dropdown.css">
	
	
	<!--  
	<link href="./css/bootstrap-glyphicons.css" rel="stylesheet">
	-->
	
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
	
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
<div class="container">
  <a class="navbar-brand" href="#">CAEP</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="#" id="experiment">Experiment</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Achievement</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
    </ul>
    
    <ul class="nav navbar-nav ml-auto"> 
            <li class="nav-item">
            	<a class="nav-link" href="RegSwitch.action">Sign Up</a>
            </li> 
            <li class="nav-item">
            	<a class="nav-link" href="GotoLogin.action">Log In</a>
            </li> 
    </ul>
         
  </div>
</div>
</nav>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script type="text/javascript" src="./js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="./js/bootstrap.min.js"></script>
</body>
</html>