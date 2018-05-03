<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.wcp.DAO.*,java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Achievement</title>
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
							 		X0 x=new X0();
							 		List<Object> list=ld.query("X0", "account", (String)session.getAttribute("USER"));
							 		for(Object i:list){
							 	%>
							 	<tr class="table-light">
							      <th scope="row">Lab0</th>
							      <td><%=((X0)i).getExcute() %></td>
							      <td><%=((X0)i).getReport() %></td>
							      <td><%=((X0)i).getAnother() %></td>
							      <td><%=((X0)i).getScore() %></td>
							    </tr>
							    <%
							 		}
							    %>
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
	document.getElementById("navbar-home").setAttribute("class","nav-item active");
	
	var userName="<%=session.getAttribute("username")%>";
	document.getElementById("HomeSummary").innerHTML=+userName+"'s score'";
}

</script>

</body>
</html>