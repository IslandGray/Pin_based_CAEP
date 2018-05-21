<%@page import="javax.transaction.xa.Xid"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.wcp.DAO.*,java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Achievement</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
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
					    <a href="#" id="0Btn" class="list-group-item list-group-item-action active" style="box-pack:end;">
					    	My Score
					    	<span class="badge badge-light badge-pill"></span>
					    </a>
					    
					</div>
				</div>
				<div class="col-md-10 column">
					<div id="0c">
						<table class="table table-hover">
							 <thead>
							    <tr>
							      <th scope="col">Lab No.</th>
							      <th scope="col">Excute score</th>
							      <th scope="col">Report score</th>
							      <th scope="col">Addon score</th>
							      <th scope="col">Total</th>
							    </tr>
							 </thead>
							 <tbody>
							 	<%
							 		LoadQuery ld=new LoadQuery();
							 		X0 x0=new X0();
							 		List<Object> list=ld.query("X0", "account", (String)session.getAttribute("USER"));
							 		if(list.isEmpty()){
							 			x0.setAccount((String)session.getAttribute("USER"));
							 			x0.setExcute(0);
							 			x0.setReport(0);
							 			x0.setAnother(0);
							 			x0.setScore(0);
							 		}else{
							 			x0=(X0)list.get(0);
							 		}
							 	%>
							 	<tr class="table-light">
							      <th scope="row">Lab0</th>
							      <td><%=x0.getExcute() %></td>
							      <td><%=x0.getReport() %></td>
							      <td><%=x0.getAnother() %></td>
							      <td><%=x0.getScore() %></td>
							    </tr>
							    
							    <%
							 		ld=new LoadQuery();
							 		list=ld.query("X1", "account", (String)session.getAttribute("USER"));
							 		X1 x1=new X1();
							 		if(list.isEmpty()){
							 			x1.setAccount((String)session.getAttribute("USER"));
							 			x1.setExcute(0);
							 			x1.setReport(0);
							 			x1.setAnother(0);
							 			x1.setScore(0);
							 		}else{
							 			x1=(X1)list.get(0);
							 		}
							 	%>
							 	<tr class="table-light">
							      <th scope="row">Lab1</th>
							      <td><%=x1.getExcute() %></td>
							      <td><%=x1.getReport() %></td>
							      <td><%=x1.getAnother() %></td>
							      <td><%=x1.getScore() %></td>
							    </tr>

							    <%
							 		ld=new LoadQuery();
							 		list=ld.query("X2", "account", (String)session.getAttribute("USER"));
							 		X2 x2=new X2();
							 		if(list.isEmpty()){
							 			x2.setAccount((String)session.getAttribute("USER"));
							 			x2.setExcute(0);
							 			x2.setReport(0);
							 			x2.setAnother(0);
							 			x2.setScore(0);
							 		}else{
							 			x2=(X2)list.get(0);
							 		}
							 	%>
							 	<tr class="table-light">
							      <th scope="row">Lab2</th>
							      <td><%=x2.getExcute() %></td>
							      <td><%=x2.getReport() %></td>
							      <td><%=x2.getAnother() %></td>
							      <td><%=x2.getScore() %></td>
							    </tr>

							    <%
							 		ld=new LoadQuery();
							 		list=ld.query("X3", "account", (String)session.getAttribute("USER"));
							 		X3 x3=new X3();
							 		if(list.isEmpty()){
							 			x3.setAccount((String)session.getAttribute("USER"));
							 			x3.setExcute(0);
							 			x3.setReport(0);
							 			x3.setAnother(0);
							 			x3.setScore(0);
							 		}else{
							 			x3=(X3)list.get(0);
							 		}
							 	%>
							 	<tr class="table-light">
							      <th scope="row">Lab3</th>
							      <td><%=x3.getExcute() %></td>
							      <td><%=x3.getReport() %></td>
							      <td><%=x3.getAnother() %></td>
							      <td><%=x3.getScore() %></td>
							    </tr>

							 </tbody>
						</table>
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
	document.getElementById("navbar-achievement").setAttribute("class","nav-item active");
	
	var userName="<%=session.getAttribute("username")%>";
	document.getElementById("HomeSummary").innerHTML=userName+"'s score";
}

</script>

</body>
</html>