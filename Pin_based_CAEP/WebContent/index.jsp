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
	
	<!--  
	<link href="./css/bootstrap-glyphicons.css" rel="stylesheet">
	-->
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
	<style type="text/css">
		.jumbotron {
		    background-color: rgba(0,0,0,0.8);
		    color: white;
		    margin-top:-40px;
		    
		}
		.jumbotron .container {
		    max-width: 90%;
		    margin-bottom:-70px;
		}
	</style>
	
</head>
<body>

	<script src="./pageSources/navbar.js"></script>
	<div id="main-content" role="main">
	
		<div class="jumbotron">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div style="margin-top: 30px;">
							<h1>Architecture Labo. <strong>Redefined.</strong></h1>
			                <div class="lead">
			                    <p><p></p>
			                        <span itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
			                            <span itemprop="description">Free</span>.
			                        </span> Above hardware. Runs everywhere.</p>
			                </div>
		                </div>
					</div>
					<div class="col-md-7">
						<img src="./images/screenshot.png" width="110%">
					</div>
					
			  	</div>
			</div>

		</div>
		<div class="value-props">
		    <div class="container">
		        <div class="row">
		        	<img src="./images/four.png">
		        </div>
		    </div>
		</div>
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
}
</script>
</body>
</html>