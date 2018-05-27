<%@page import="javax.transaction.xa.Xid"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.wcp.DAO.*,java.util.List,java.util.ArrayList" %>
<%
	LoadQuery ld=new LoadQuery();
	String user=(String)session.getAttribute("USER");
%>
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
					    <a href="#" id="0Btn" onclick="click0()" class="list-group-item list-group-item-action active" style="box-pack:end;">
					    	Students' Score
					    	<span class="badge badge-light badge-pill"></span>
					    </a>
					     <a href="#" id="1Btn" onclick="click1()" class="list-group-item list-group-item-action">
					    	Duplicate Check
					    </a>
					    
					</div>
				</div>
				<div class="col-md-10 column">
					<div id="0c">
						<div class="card border-dark mb-3" id="border" style="">
							<div class="card-header">Duplicate check</div>
						    <div class="card-body">
						    	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
								  <button type="button" class="btn btn-outline-danger" onclick="syncScore()">刷新学生总成绩</button>
								   <select class="custom-select" id="classselect" onchange="freshTable()">
								    <%
								    	List<Object> myClass=ld.queryHQL("from Group g where account='"+user+"' order by g.group");
								    	List<String> groupList=new ArrayList();
								    	for(Object i:myClass){
								    		groupList.add(((Group)i).getGroup());
								    %>
						    			<option value="<%=((Group)i).getGroup()%>"><%=((Group)i).getGroup()%></option>
								    <%
								    	}
								    %> 
								    </select>
								</div>
								<div style="">
									<table class="table table-hover" id="tableId">
										 <thead>
										    <tr>
										      <th scope="col">学号</th>
										      <th scope="col">姓名</th>
										      <th scope="col">班号</th>
										      <th scope="col">Lab0</th>
										      <th scope="col">Lab1</th>
										      <th scope="col">Lab2</th>
										      <th scope="col">Lab3</th>
										      <th scope="col">Lab4</th>
										      <th scope="col">附加分</th>
										      <th scope="col">Total</th>
										    </tr>
										 </thead>
										 <tbody>
								 	<%
						 				//List<String> stu=new ArrayList();
								 		for(String i:groupList){
								 			List<Object> myStu=ld.query("User", "Group", i);
								 			for(Object j:myStu){
								 				User ut=(User)j;
								 				//stu.add(u.getAccount());
								 				Object o=ld.queryRTN("Score","account",ut.getAccount(),"");
								 				if(o!=null){
								 					Score grade=(Score)o;
								 			
								 	%>
										 	<tr class="table-light">
										      <th scope="row"><%=ut.getStudentID() %></th>
										      <td><%=ut.getName() %></td>
										      <td><%=ut.getGroup() %></td>
										      <td><%=grade.getLab0() %></td>
										      <td><%=grade.getLab1() %></td>
										      <td><%=grade.getLab2() %></td>
										      <td><%=grade.getLab3() %></td>
										      <td><%=grade.getLab4() %></td>
										      <td><%=grade.getAnother() %></td>
										      <td><%=grade.getTotal() %></td>
										    </tr>
									<%
								 				}
											}
						 				}
									%> 
										 </tbody>
									</table>
								</div>
						    </div>
					    </div>
						
					</div>
					<div id="1c" style="display:none">
						<div class="card border-dark mb-3" id="border" style="">
							<div class="card-header">Duplicate check</div>
						    <div class="card-body">
						    	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
								  <button type="button" class="btn btn-outline-danger" onclick="checkDup()">查重</button>
								</div>
								<div style="">
								<%
									String resultURL=null;
									List<Object> re=ld.query("Dup_Check", "tag", "1");
									Dup_Check dp=null;
									if(!re.isEmpty()){
										dp=(Dup_Check)(re.get(0));
								%>
									<iframe id="resultpage" src="<%=dp.getSrc() %>" width="100%" height="500"></iframe>
								<%
									}
								%>
								</div>
						    </div>
					    </div>
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
function click0() {
	document.getElementById("0Btn").setAttribute("class","list-group-item list-group-item-action active");
	document.getElementById("0c").style.display="block";
	document.getElementById("1Btn").setAttribute("class","list-group-item list-group-item-action");
	document.getElementById("1c").style.display="none";
	
}
function click1() {
	document.getElementById("0Btn").setAttribute("class","list-group-item list-group-item-action");
	document.getElementById("0c").style.display="none";
	document.getElementById("1Btn").setAttribute("class","list-group-item list-group-item-action active");
	document.getElementById("1c").style.display="block";
	
}
function syncScore() {
	location.href="SyncScore.action";
}
function checkDup(){
	location.href="CheckDup.action";
}
function freshTable() {
	var obj=document.getElementById("classselect");
	var index=obj.selectedIndex;
	var value = obj.options[index].value;
	
	var tab=document.getElementById("tableId");    //获取table对像
	var trs=tab.getElementsByTagName("tr");
	for(var i=1;i<trs.length;i++){
        var tds=trs[i].getElementsByTagName("td");
        //alert(value+"="+tds[2].innerHTML+"="+tds[3].innerHTML)
        if(tds[1].innerHTML==value){
        	trs[i].style.display='table-row';
        }else{
        	trs[i].style.display='none';
        }
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
	document.getElementById("navbar-achievement").setAttribute("class","nav-item active");
	
	var userName="<%=session.getAttribute("username")%>";
	document.getElementById("HomeSummary").innerHTML=userName+" is checking";
	
	freshTable();
}

</script>

</body>
</html>