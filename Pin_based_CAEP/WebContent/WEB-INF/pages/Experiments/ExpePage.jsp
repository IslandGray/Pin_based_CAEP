<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Experiments</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	
	<!--  
	<link href="./css/bootstrap-glyphicons.css" rel="stylesheet">
	-->
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
	
	<style type="text/css">
		.list-group-item {
		  background-color:rgb(255,255,255);
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
					<h2 id="ExpeTitle">Experiment x</h2>
					<p id="ExpeSummary">Here is the summary of the experiment.</p>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-2 column">
					<div class="list-group">
					    <a href="#" class="list-group-item list-group-item-action active">
					    	Summary
					    </a>
					    <a href="#" class="list-group-item list-group-item-action">
					    	Experiment Guide
					    </a>
					    <a href="#" class="list-group-item list-group-item-action">
					    	Resources
					    </a>
					    <a href="#" class="list-group-item list-group-item-action disabled">
					    	Submit and Excute
					    </a>
					    <a href="#" class="list-group-item list-group-item-action disabled">
					    	Report
					    </a>
					</div>
				</div>
				<div class="col-md-7 column">
				
				</div>
				<div class="col-md-3 column">
				
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
	document.getElementById("navbar-experiment").setAttribute("class","nav-item dropdown active");
}
</script>
</body>
</html>