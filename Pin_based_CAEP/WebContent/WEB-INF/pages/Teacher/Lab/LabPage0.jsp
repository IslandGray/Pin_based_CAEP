<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laboratory 0</title>
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
					<h2 id="ExpeTitle">Laboratory 0</h2>
					<p id="ExpeSummary">Pin入门与指令依赖距离分析</p>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-2 column">
					<div class="list-group">
					    <a href="#" id="0Btn" onclick="click0()" class="list-group-item list-group-item-action active">
					    	Summary
					    </a>
					    <a href="#" id="1Btn" onclick="click1()" class="list-group-item list-group-item-action">
					    	Experiment Guide
					    </a>
					    <a href="#" id="2Btn" onclick="click2()" class="list-group-item list-group-item-action">
					    	Resources
					    </a>
					    <a href="#" id="3Btn" onclick="click3()" class="list-group-item list-group-item-action disabled">
					    	Check Students' Work
					    </a>
					    <a href="#" id="4Btn" onclick="click4()" class="list-group-item list-group-item-action disabled">
					    	Check Reports
					    </a>
					</div>
				</div>
				<div class="col-md-10 column">
					<div id="0c">
						<div class="card  " style="">
						    <div class="card-body">
						    	<h4 class="card-title">Pin入门与指令依赖距离分析</h4>
							    <h6 class="card-subtitle mb-2 text-muted">Cost:1 Week</h6>
							    <p class="card-text">依赖于：Pin，Linux</p>
							    <ul class="list-group list-group-flush">
								    <li class="list-group-item"><h6>Part 1</h6></li>
								    <li class="list-group-item"><h7>在本实验的第一部分中，你
										将开发一个简单的Pin工具来计算应用程序执行的指令数量。</h7></li>
								    <li class="list-group-item"><h6>Part 2</h6></li>
								    <li class="list-group-item"><h7>在第二部分，我们要求开发出一款可以分析出可执行程序中的指令依赖距离的工具。</h7></li>
								</ul>
								<p> </p>
								<p class="card-text">目的：这个实验是计算机体系结构的第一个实验，也是与Pin的第一次接触，由于后面还会利用Pin进行进一步的实验，因此，熟悉Pin的程序结构特点、如何编写Pintool以及运行Pin来做一次实际的插桩就是本次实验的重点。</p>
						    </div>
						</div>
					</div>
					<div id="1c" style="display:none">
						<div class="card border-dark mb-3" style="">
						    <div class="card-header">Guide</div>
						    <div class="card-body">
						    	<object data="./PDFsrc/Lab0.pdf" type="application/pdf" width="100%" height="1000">      
								alt : <a href="./PDFsrc/Lab0.pdf">test.pdf</a>      
								</object> 
								<p></p>
								<a class="card-link" href="#">Upload A New One</a>
						    </div>
						</div>
					</div>
					<div id="2c" style="display:none">
						<div class="card border-dark mb-3" style="">
						    <div class="card-header">Resources and Downloads</div>
						    <div class="card-body">
						    	<p>Part1:
						    	<a href="download.action?fileName=inscount.cpp" class="card-link">ins-count</a>
						    	</p>
						    	<p>Part2:
						    	<a href="download.action?fileName=insdiscount.cpp" class="card-link">ins-discount</a>
						    	</p>
						    	<p>实验报告模板:
						    	<a href="download.action?fileName=report0.docx" class="card-link">report0.docx</a>
						    	</p>
						    </div>
						</div>
					</div>
					<div id="3c" style="display:none">
						<div class="card border-dark mb-3" id="border" style="">
							<div class="card-header">Check Students' Work</div>
						    <div class="card-body">
						    	<p class="card-text">开始时间：<h6 id="starttime">${starttime}</h6></p>
						    	<p class="card-text">截止时间：<h6 id="endtime">${endtime}</h6></p>
						    </div>
						    
						</div>
					</div>
					<div id="4c" style="display:none">
						<div class="card border-dark mb-3" style="">
						    <div class="card-header">Check Reports</div>
						    <div class="card-body">
						    	<h5>实验报告：<small class="text-muted"> （仅接受.pdf）</small></h5>
								
						    </div>
						</div>
					</div>
				</div>
				<!-- 
				<div class="col-md-2 column">
				</div>
				 -->
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
	document.getElementById("navbar-experiment").setAttribute("class","nav-item active");
	
	if(get("tag")==1){
		click3();
		alert("Upload Success!");
	}else if(get("tag"==2)){
		click3();
		alert("Upload Failed!");
	}
	
}
</script>
<script src="./PageJS/labpage.js"></script>
</body>
</html>