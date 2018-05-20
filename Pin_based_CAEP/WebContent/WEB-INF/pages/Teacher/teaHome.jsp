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
	<!-- -->
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
					<p id="HomeSummary">Welcome back,教师/助教 </p>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-2 column">
					<div class="list-group">
					    <a href="#" id="0Btn" onclick="click0()" class="list-group-item list-group-item-action active" style="box-pack:end;">
					    	To-Do List
					    	<span class="badge badge-light badge-pill">###</span>
					    </a>
					    <a href="#" id="1Btn" onclick="click1()" class="list-group-item list-group-item-action">
					    	Schedule
					    </a>
					    <a href="#" id="2Btn" onclick="click2()" class="list-group-item list-group-item-action">
					    	Resources
					    </a>
					    <a href="#" id="3Btn" class="list-group-item list-group-item-action disabled" style="display:none">
					    	Submit and Excute
					    </a>
					</div>
				</div>
				<div class="col-md-8 column">
					<div id="0c">
						<div class="card mb-3">
							  <h3 class="card-header">Card header</h3>
							  <div class="card-body">
								    <h5 class="card-title">Special title treatment</h5>
								    <h6 class="card-subtitle text-muted">Support card subtitle</h6>
							  </div>
							  <img style="height: 200px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22318%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20318%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_158bd1d28ef%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A16pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_158bd1d28ef%22%3E%3Crect%20width%3D%22318%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22129.359375%22%20y%3D%2297.35%22%3EImage%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Card image">
							  <div class="card-body">
							    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							  </div>
							  <ul class="list-group list-group-flush">
								    <li class="list-group-item">Cras justo odio</li>
								    <li class="list-group-item">Dapibus ac facilisis in</li>
								    <li class="list-group-item">Vestibulum at eros</li>
							  </ul>
							  <div class="card-body">
								    <a href="#" class="card-link">Card link</a>
								    <a href="#" class="card-link">Another link</a>
							  </div>
							  <div class="card-footer text-muted">
							    2 days ago
							  </div>
						</div>
						<div class="card">
							  <div class="card-body">
								    <h4 class="card-title">Card title</h4>
								    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
								    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								    <a href="#" class="card-link">Card link</a>
								    <a href="#" class="card-link">Another link</a>
							  </div>
						</div>
					</div>
					<div id="1c" style="display:none">
						<div class="card border-success mb-3" style="" id="lab0border">
						  <div class="card-header">Lab0</div>
						  <div class="card-body">
						    <h4 class="card-title">Pin入门与指令依赖距离分析</h4>
						    <p class="card-text" id="lab0status">即将开始</p>
						    <div><div id="st0" style="float: left;">${st[0] }</div><div id="et0" style="float: right">${et[0] }</div><div style="clear: both;"></div></div>
						    <div class="progress">
							  <div class="progress-bar progress-bar-striped bg-success" id="lab0pro" role="progressbar" style="width: 100%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						  </div>
						</div>
						<div class="card border-success mb-3" style="" id="lab1border">
						  <div class="card-header">Lab1</div>
						  <div class="card-body">
						    <h4 class="card-title">内存缓存的设计与性能分析</h4>
						    <p class="card-text" id="lab1status">即将开始</p>
						    <div><div id="st1" style="float: left;">${st[1] }</div><div id="et1" style="float: right">${et[1] }</div><div style="clear: both;"></div></div>
						    <div class="progress">
							  <div class="progress-bar progress-bar-striped bg-success" id="lab1pro" role="progressbar" style="width: 100%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						  </div>
						</div>
						<div class="card border-primary mb-3" style="" id="lab2border">
						  <div class="card-header">Lab2</div>
						  <div class="card-body">
						    <h4 class="card-title">分支预测的算法与实践</h4>
						    <p class="card-text" id="lab2status">即将开始</p>
						    <div><div id="st2" style="float: left;">${st[2] }</div><div id="et2" style="float: right">${et[2] }</div><div style="clear: both;"></div></div>
						    <div class="progress">
							  <div class="progress-bar progress-bar-striped progress-bar-animated" id="lab2pro" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</div>
						  </div>
						</div>
						<div class="card border-danger mb-3" style="" id="lab3border">
						  <div class="card-header">Lab3</div>
						  <div class="card-body">
						    <h4 class="card-title">高速缓存一致性协议</h4>
						    <p class="card-text" id="lab3status">即将开始</p>
						    <div><div id="st3" style="float: left;">${st[3] }</div><div id="et3" style="float: right">${et[3] }</div><div style="clear: both;"></div></div>
						    <div class="progress">
							  <div class="progress-bar progress-bar-striped bg-danger" id="lab3pro" role="progressbar" style="width: 20%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						  </div>
						</div>
						<div class="card border-warning mb-3" style="" id="lab4border">
						  <div class="card-header">Lab4</div>
						  <div class="card-body">
						    <h4 class="card-title">多核处理器的多级缓存探索</h4>
						    <p class="card-text" id="lab4status">尚未开放</p>
						    <div><div style="float: left;"></div>	<div style="float: right">	</div><div style="clear: both;"></div></div>
						    <div class="progress">
							  <div class="progress-bar progress-bar-striped bg-warning" id="lab4pro" role="progressbar" style="width: 1%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						  </div>
						</div>
						
					</div>
					<div id="2c" style="display:none">
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">Type</th>
						      <th scope="col">Column heading</th>
						      <th scope="col">Column heading</th>
						      <th scope="col">Column heading</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr class="table-active">
						      <th scope="row">Active</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr>
						      <th scope="row">Default</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr class="table-primary">
						      <th scope="row">Primary</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr class="table-secondary">
						      <th scope="row">Secondary</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr class="table-success">
						      <th scope="row">Success</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr class="table-danger">
						      <th scope="row">Danger</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr class="table-warning">
						      <th scope="row">Warning</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr class="table-info">
						      <th scope="row">Info</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr class="table-light">
						      <th scope="row">Light</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						    <tr class="table-dark">
						      <th scope="row">Dark</th>
						      <td>Column content</td>
						      <td>Column content</td>
						      <td>Column content</td>
						    </tr>
						  </tbody>
						</table> 
					</div>
					<div id="3c" style="display:none">
						<h3>this is 3</h3>
					</div>
				</div>
				<div class="col-md-2 column">
					<div class="card text-white bg-dark mb-3" style="max-width: 20rem;">
						  <div class="card-header">Quickstart</div>
						  <div class="card-body">
						    <h4 class="card-title">Dark card title</h4>
						    <p class="card-text">Some quick</p>
						  </div>
						  <ul class="list-group list-group-flush">
							    <li class="list-group-item text-white bg-dark mb-3">Cras justo odio</li>
							    <li class="list-group-item text-white bg-dark mb-3">Dapibus ac facilisis in</li>
							    <li class="list-group-item text-white bg-dark mb-3">Vestibulum at eros</li>
						  </ul>
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
	document.getElementById("navbar-home").setAttribute("class","nav-item active");
	
	var userName="<%=session.getAttribute("username")%>";
	document.getElementById("HomeSummary").innerHTML="Welcome back,教师/助教  "+userName+"!";
	
	var now=new Date();
	var st0=new Date(document.getElementById("st0").innerHTML);
	var et0=new Date(document.getElementById("et0").innerHTML);
	var st1=new Date(document.getElementById("st1").innerHTML);
	var et1=new Date(document.getElementById("et1").innerHTML);
	var st2=new Date(document.getElementById("st2").innerHTML);
	var et2=new Date(document.getElementById("et2").innerHTML);
	var st3=new Date(document.getElementById("st3").innerHTML);
	var et3=new Date(document.getElementById("et3").innerHTML);
	if(now>st0 && now<et0){
		var all=(et0-st0)/(1000*60*60*24);
		var lasttime=(et0-now)/(1000*60*60*24);
		var lastpercent=100-lasttime*100/all;
		if(lasttime <=1){
			document.getElementById("lab0status").innerHTML="即将结束";
			document.getElementById("lab0border").setAttribute("class","card border-danger mb-3");
			document.getElementById("lab0pro").setAttribute("class","progress-bar progress-bar-striped bg-danger");
			document.getElementById("lab0pro").style.width=lastpercent+"%";
		}else{
			document.getElementById("lab0status").innerHTML="正在进行";
			document.getElementById("lab0border").setAttribute("class","card border-primary mb-3");
			document.getElementById("lab0pro").setAttribute("class","progress-bar progress-bar-striped progress-bar-animated");
			document.getElementById("lab0pro").style.width=lastpercent+"%";
		}
	}else if(st0>now){
		document.getElementById("lab0status").innerHTML="尚未开始";
		document.getElementById("lab0border").setAttribute("class","card border-warning mb-3");
		document.getElementById("lab0pro").setAttribute("class","progress-bar progress-bar-striped bg-warning");
		document.getElementById("lab0pro").style.width="1%";
	}else if(now>et0){
		document.getElementById("lab0status").innerHTML="已结束";
		document.getElementById("lab0border").setAttribute("class","card border-success mb-3");
		document.getElementById("lab0pro").setAttribute("class","progress-bar progress-bar-striped bg-success");
		document.getElementById("lab0pro").style.width="100%";
	}
	
	if(now>st1 && now<et1){
		var all=(et1-st1)/(1000*60*60*24);
		var lasttime=(et1-now)/(1000*60*60*24);
		var lastpercent=100-lasttime*100/all;
		if(lasttime <=1){
			document.getElementById("lab1status").innerHTML="即将结束";
			document.getElementById("lab1border").setAttribute("class","card border-danger mb-3");
			document.getElementById("lab1pro").setAttribute("class","progress-bar progress-bar-striped bg-danger");
			document.getElementById("lab1pro").style.width=lastpercent+"%";
		}else{
			document.getElementById("lab1status").innerHTML="正在进行";
			document.getElementById("lab1border").setAttribute("class","card border-primary mb-3");
			document.getElementById("lab1pro").setAttribute("class","progress-bar progress-bar-striped progress-bar-animated");
			document.getElementById("lab1pro").style.width=lastpercent+"%";
		}
	}else if(st1>now){
		document.getElementById("lab1status").innerHTML="尚未开始";
		document.getElementById("lab1border").setAttribute("class","card border-warning mb-3");
		document.getElementById("lab1pro").setAttribute("class","progress-bar progress-bar-striped bg-warning");
		document.getElementById("lab1pro").style.width="1%";
	}else if(now>et1){
		document.getElementById("lab1status").innerHTML="已结束";
		document.getElementById("lab1border").setAttribute("class","card border-success mb-3");
		document.getElementById("lab1pro").setAttribute("class","progress-bar progress-bar-striped bg-success");
		document.getElementById("lab1pro").style.width="100%";
	}
	
	if(now>st2 && now<et2){
		var all=(et2-st2)/(1000*60*60*24);
		var lasttime=(et2-now)/(1000*60*60*24);
		var lastpercent=100-lasttime*100/all;
		if(lasttime <=1){
			document.getElementById("lab2status").innerHTML="即将结束";
			document.getElementById("lab2border").setAttribute("class","card border-danger mb-3");
			document.getElementById("lab2pro").setAttribute("class","progress-bar progress-bar-striped bg-danger");
			document.getElementById("lab2pro").style.width=lastpercent+"%";
		}else{
			document.getElementById("lab2status").innerHTML="正在进行";
			document.getElementById("lab2border").setAttribute("class","card border-primary mb-3");
			document.getElementById("lab2pro").setAttribute("class","progress-bar progress-bar-striped progress-bar-animated");
			document.getElementById("lab2pro").style.width=lastpercent+"%";
		}
	}else if(st2>now){
		document.getElementById("lab2status").innerHTML="尚未开始";
		document.getElementById("lab2border").setAttribute("class","card border-warning mb-3");
		document.getElementById("lab2pro").setAttribute("class","progress-bar progress-bar-striped bg-warning");
		document.getElementById("lab2pro").style.width="1%";
	}else if(now>et2){
		document.getElementById("lab2status").innerHTML="已结束";
		document.getElementById("lab2border").setAttribute("class","card border-success mb-3");
		document.getElementById("lab2pro").setAttribute("class","progress-bar progress-bar-striped bg-success");
		document.getElementById("lab2pro").style.width="100%";
	}
	
	if(now>st3 && now<et3){
		var all=(et3-st3)/(1000*60*60*24);
		var lasttime=(et3-now)/(1000*60*60*24);
		var lastpercent=100-lasttime*100/all;
		if(lasttime <=1){
			document.getElementById("lab3status").innerHTML="即将结束";
			document.getElementById("lab3border").setAttribute("class","card border-danger mb-3");
			document.getElementById("lab3pro").setAttribute("class","progress-bar progress-bar-striped bg-danger");
			document.getElementById("lab3pro").style.width=lastpercent+"%";
		}else{
			document.getElementById("lab3status").innerHTML="正在进行";
			document.getElementById("lab3border").setAttribute("class","card border-primary mb-3");
			document.getElementById("lab3pro").setAttribute("class","progress-bar progress-bar-striped progress-bar-animated");
			document.getElementById("lab3pro").style.width=lastpercent+"%";
		}
	}else if(st3>now){
		document.getElementById("lab3status").innerHTML="尚未开始";
		document.getElementById("lab3border").setAttribute("class","card border-warning mb-3");
		document.getElementById("lab3pro").setAttribute("class","progress-bar progress-bar-striped bg-warning");
		document.getElementById("lab3pro").style.width="1%";
	}else if(now>et3){
		document.getElementById("lab3status").innerHTML="已结束";
		document.getElementById("lab3border").setAttribute("class","card border-success mb-3");
		document.getElementById("lab3pro").setAttribute("class","progress-bar progress-bar-striped bg-success");
		document.getElementById("lab3pro").style.width="100%";
	}
}

</script>
<script src="./PageJS/homepage.js"></script>
</body>
</html>