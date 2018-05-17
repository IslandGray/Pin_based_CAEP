<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.wcp.DAO.*,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laboratory 0</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $( "#datepicker2" ).datepicker({
    	dateFormat: "yy-mm-dd"
    });
  } );
  </script>
	
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
								alt : <a href="./PDFsrc/Lab0.pdf">Lab0.pdf</a>      
								</object> 
								<p></p>
								<form action="tealab0uploadPDF.action?upPath=/PDFsrc/Lab0.pdf" method="post" enctype="multipart/form-data">
						     	<fieldset>
									<input class="form-control-file" id="labguide" name="labguide" aria-describedby="fileHelp" type="file">
									<p></p>
									<button type="submit" class="btn btn-primary">Upload A New One</button>
								</fieldset>
								</form>
						    </div>
						</div>
					</div>
					<div id="2c" style="display:none">
						<div class="card border-dark mb-3" style="">
						    <div class="card-header">Resources and Downloads</div>
						    <div class="card-body">
						    	<p>Part1:
						    	<a href="download.action?fileName=inscount.cpp&filePath=/WEB-INF/ServerFiles/0" class="card-link">ins-count</a>
						    	</p>
						    	<p>Part2:
						    	<a href="download.action?fileName=insdiscount.cpp&filePath=/WEB-INF/ServerFiles/0" class="card-link">ins-discount</a>
						    	</p>
						    	<p>实验报告模板:
						    	<a href="download.action?fileName=report0.docx&filePath=/WEB-INF/ServerFiles/0" class="card-link">report0.docx</a>
						    	</p>
						    </div>
						</div>
					</div>
					<div id="3c" style="display:none">
						<div class="card border-dark mb-3" id="border" style="">
							<div class="card-header">Check Students' Work</div>
						    <div class="card-body">
						    	<form action="editTime.action" method="post" enctype="multipart/form-data">
							    	<p class="card-text">开始时间：(点击设定时间)
								    	<h6 id="starttime">${starttime}</h6>
								    	<div id="t1" style="display:none">
								    		<input type="text" id="datepicker" name="startT">00:00
								    	</div>
							    	</p>
							    	<p class="card-text">截止时间：
							    		<h6 id="endtime">${endtime}</h6>
										<div id="t2" style="display:none">
											<input type="text" id="datepicker2" name="endT">00:00
										</div>
							    	</p>
							    	<button type="button" class="btn btn-outline-dark" id="set" onclick="setTime()">设定时间</button>
							    	<button type="submit" class="btn btn-outline-dark" id="enter" style="display:none">提交</button>
							    	<button type="button" class="btn btn-outline-dark" id="cancel" onclick="cancelsetTime()" style="display:none">取消</button>
						    	
						    	</form>
						    	<!--  
						    	<div class="modal" id="setTimeDia" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title">设定任务时间</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <form id="fm" action="editTime.action" method="post" enctype="multipart/form-data"></form>
								      <fieldset>
									      <div class="modal-body">
									        <p>将该任务的开始与结束时间修改为：</p>
									        <p>Start:
								        	    <input type="text" id="datepicker" name="startT">
                            					00:00
									        </p>
									        <p>End :
									        	<input type="text" id="datepicker2" name="endT">
									        	00:00
									        </p>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-primary" id="sb">Save changes</button>
									        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									      </div>
									  </fieldset>
								      </form>
								    </div>
								  </div>
								</div>
								-->
						    </div>
						    <div class="card-body">
						    	<table class="table table-hover">
						    		<thead>
									    <tr>
									      <th scope="col">学号</th>
									      <th scope="col">姓名</th>
									      <th scope="col">文件</th>
									      <th scope="col">运行得分</th>
									    </tr>
									</thead>
									<tbody>
									<%
								 		LoadQuery ld=new LoadQuery();
								 		X0 x=new X0();
								 		List<Object> list=ld.query("X0");
								 		for(Object i:list){
								 			String acc=((X0)i).getAccount();
								 			User us=(User)ld.queryRTN("User", "account", acc, "");
								 			int id=us.getID();
								 	%>
										<tr>
									      <td><%=us.getStudentID() %></td>
									      <td><%=us.getName() %></td>
									      <td><a href="devDownload.action?fileName=<%=id%>_lab0-1.cpp&filePath=/usr/services/pin-3.5/source/tools/ManualExamples/<%=id%>">part1</a>
									      		/<a href="devDownload.action?fileName=<%=id%>_lab0-2.cpp&filePath=/usr/services/pin-3.5/source/tools/ManualExamples/<%=id%>">part2</a></td>
									      <td><a href="#" onclick="showDialog('<%=us.getAccount() %>')"><%=((X0)i).getExcute() %></a></td>
									    </tr>
								   <%
							 			}
							    	%>  
									</tbody>
  
						    	</table>
						    </div>
						</div>
					</div>
					<div id="4c" style="display:none">
						<div class="card border-dark mb-3" style="">
						    <div class="card-header">Check Reports</div>
						    <div class="card-body">
						    	<h5>实验报告：<small class="text-muted"> （仅.pdf）</small></h5>
								
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

	function showDialog(val) {
		var name=prompt("要修改的数值:","");  
		if(name)//如果返回的有内容
		{
			;
			location.href="editExcute.action?acc="+val+"&to="+name;
		}
	}
	function setTime() {
		document.getElementById("t1").style.display="block";
		document.getElementById("t2").style.display="block";
		document.getElementById("enter").style.display="inline";
		document.getElementById("cancel").style.display="inline";
		
		document.getElementById("set").style.display="none";
		document.getElementById("starttime").style.display="none";
		document.getElementById("endtime").style.display="none";
	}
	function cancelsetTime() {
		document.getElementById("t1").style.display="none";
		document.getElementById("t2").style.display="none";
		document.getElementById("enter").style.display="none";
		document.getElementById("cancel").style.display="none";
		
		document.getElementById("set").style.display="block";
		document.getElementById("starttime").style.display="block";
		document.getElementById("endtime").style.display="block";
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
	}else if(get("tag")==2){
		click3();
		alert("Upload Failed!");
	}else if(get("tag")==3){
		click1();
		alert("Upload PDF Success!");
	}else if(get("tag")==4){
		click1();
		alert("Upload PDF Failed!");
	}else if(get("tag")==5){
		click3();
		alert("Edit Success!");
	}
	else if(get("tag")==6){
		click3();
		alert("Edit Failed!");
	}
	
	
}
</script>
<script src="./PageJS/labpage.js"></script>
</body>
</html>