<%@page import="java.util.Date,com.wcp.DAO.*,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin</title>
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
					<p id="HomeSummary">Welcome back,</p>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-2 column">
					<div class="list-group">  
					    <a href="#" id="0Btn" onclick="click0()" class="list-group-item list-group-item-action active" style="box-pack:end;display:none">
					    	To-Do List
					    	<span class="badge badge-light badge-pill">###</span>
					    </a>
					    <a href="#" id="1Btn" onclick="click1()" class="list-group-item list-group-item-action active">
					    	审核新教师
					    </a>
					    <a href="#" id="2Btn" onclick="click2()" class="list-group-item list-group-item-action">
					    	用户组授权
					    </a>
					    <a href="#" id="3Btn" class="list-group-item list-group-item-action disabled" style="display:none">
					    	Submit and Excute
					    </a>
					</div>
				</div>
				<div class="col-md-10 column">
					<div id="0c" style="display:none">
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
					<div id="1c" >
						<table class="table table-hover" id="pdftableId">
				    		<thead>
							    <tr>
							      <th scope="col">账号</th>
							      <th scope="col">姓名</th>
							      <th scope="col">工号</th>
							      <th scope="col"></th>
							    </tr>
							</thead>
							<tbody>
							<%
								LoadQuery ld=new LoadQuery();
								List<Object> u=ld.query("User", "Group", "invalid");
						 		for(Object i:u){
						 			User tea=(User)i;
						 			
						 	%>
								<tr>
							      <td><%=tea.getAccount() %></td>
							      <td><%=tea.getName() %></td>
							      <td><%=tea.getStudentID() %></td>
							      <td><a href="AdmitTea.action?id=<%=tea.getID() %>">通过</a>/<a href="RefuseTea.action?id=<%=tea.getID() %>">拒绝</a></td>
							    </tr>
						   <%
						 		}
					    	%>  
							</tbody>
				    	</table>
						
					</div>
					<div id="2c" style="display:none">
						<div class="card mb-3">
							  <h3 class="card-header">添加授权</h3>
							  <div class="card-body">
								  <form action="AddGroup.action" method="post" enctype="multipart/form-data">
						     	  <fieldset>
									   <div class="form-group">
									      <label for="inputTea">教师账户<a style="color:red">*</a></label>
									      <input class="form-control" id="inputTea" name="inputTea" aria-describedby="nameHelp" placeholder="Enter Teacher Account" type="text">
									   </div>
									   <div class="form-group">
									      <label for="inputGroup">要添加的组<a style="color:red">*</a></label>
									      <input class="form-control" id="inputGroup" name="inputGroup" aria-describedby="nameHelp" placeholder="Enter Group" type="text">
									   </div>
									   <button type="submit" class="btn btn-primary">Add</button>
								  </fieldset>
								  </form>
								  
							  </div>
						</div>
						<div class="card mb-3">
							  <h3 class="card-header">移除授权</h3>
							  <div class="card-body">
								      <form action="DelGroup.action" method="post" enctype="multipart/form-data">
							     	  <fieldset>
										   <div class="form-group">
										      <label for="inputTea">教师账户<a style="color:red">*</a></label>
										      <input class="form-control" id="inputTea" name="inputTea" aria-describedby="nameHelp" placeholder="Enter Teacher Account" type="text">
										   </div>
										   <div class="form-group">
										      <label for="inputGroup">要移除的组<a style="color:red">*</a></label>
										      <input class="form-control" id="inputGroup" name="inputGroup" aria-describedby="nameHelp" placeholder="Enter Group" type="text">
										   </div>
										   <button type="submit" class="btn btn-primary">Delete</button>
									  </fieldset>
									  </form>
							  </div>
						</div>
					</div>
					<div id="3c" style="display:none">
						<h3>this is 3</h3>
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
	document.getElementById("navbar-home").setAttribute("class","nav-item active");
	document.getElementById("navbar-experiment").style.display="none";
	document.getElementById("navbar-achievement").style.display="none";
	document.getElementById("myprofile").style.display="none";
	document.getElementById("myaccount").style.display="none";
	
	var userName="<%=session.getAttribute("username")%>";
	document.getElementById("HomeSummary").innerHTML="Welcome back, "+userName+"!";
	
	if(get("tag")==1){
		alert("成功激活新教师!");
	}else if(get("tag")==2){
		alert("激活新教师失败");
	}else if(get("tag")==3){
		alert("已拒绝激活新教师");
	}else if(get("tag")==4){
		alert("拒绝新教师失败");
	}else if(get("tag")==5){
		click2();
		alert("组授权成功");
	}else if(get("tag")==6){
		click2();
		alert("组授权失败");
	}else if(get("tag")==7){
		click2();
		alert("组授权取消成功");
	}else if(get("tag")==8){
		click2();
		alert("组授权取消失败，或不存在此授权");
	}
}

</script>
<script src="./PageJS/homepage.js"></script>
</body>
</html>