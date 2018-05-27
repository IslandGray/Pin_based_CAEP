<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark" style="">
	<div class="container">
	  	<a class="navbar-brand" href="#">CAEP</a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  	</button>
	
		<div class="collapse navbar-collapse" id="navbarColor02">
	    	<ul class="navbar-nav">
	      		<li class="nav-item" id="navbar-home">
		        	<a class="nav-link" href="GotoHomepage.action">Home</a>
		      	</li>
		      	<li class="nav-item dropdown" id="navbar-experiment">
				    <a class="nav-link dropdown-toggle" data-toggle="dropdown" onmouseover="expDrop(0)" onmouseout="set()" href="#" role="button" id="experiment" data-target="#" aria-haspopup="true" aria-expanded="false">Laboratory</a>
				    <div class="dropdown-menu dropdown-menu-left" role="menu" id="expDropmenu" aria-labelledby="experiment" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 41px, 0px); top: 0px; left: 0px; will-change: transform;">
				        <a class="dropdown-item" name="lab0" href="GotoLab.action">Lab0 Pin入门与指令依赖距离分析</a>
				        <a class="dropdown-item" name="lab1" href="GotoLab1.action">Lab1 内存缓存的设计与性能分析</a>
				        <a class="dropdown-item" name="lab2" href="GotoLab2.action">Lab2 分支预测的算法与实践</a>
						<a class="dropdown-item" name="lab3" href="GotoLab3.action">Lab3 高速缓存一致性协议</a>
						<!-- <a class="dropdown-item disabled" name="lab4" href="#">Lab4 多核处理器的多级缓存探索</a> -->
				    </div>
			  	</li>
		        <li class="nav-item" id="navbar-achievement">
		        	<a class="nav-link" href="GotoAchi.action">Achievement</a>
		        </li>
		        <li class="nav-item" id="navbar-contact" style="display:none">
		        	<a class="nav-link" href="#">Contact</a>
		        </li>
		    </ul>
		    
		    <ul class="nav navbar-nav ml-auto" id="noLog"> 
	            <li class="nav-item">
	            	<a class="nav-link" href="RegSwitch.action">Sign Up</a>
	            </li> 
	            <li class="nav-item">
	            	<a class="nav-link" href="GotoLogin.action">Log In</a>
	            </li> 
		    </ul>  
		    <ul class="nav navbar-nav ml-auto" id="hasLog" style="display:none"> 
	            <li class="nav-item dropdown">
	            	<a class="nav-link dropdown-toggle" id="yourAccount" href="#" onclick="drop()" data-toggle="dropdown" href="#" role="button" data-target="#">YourAccount</a>
	            	<div class="dropdown-menu" role="menu" id="accdropMenu" aria-labelledby="yourAccount">
				        <a class="dropdown-item" href="setMe.action">个人资料</a>
				        <a class="dropdown-item" href="setAccount.action">账户设置</a>
				        <div class="dropdown-divider"></div>
				        <a class="dropdown-item" href="#">遇到问题？</a>
				        <a class="dropdown-item" href="loginExit.action">注销</a>
				    </div>
	            </li> 
		    </ul>    
		</div>
	</div>
</nav>
<script type="text/javascript">
	function drop() {
		var dropdown=document.getElementById("accdropMenu");
		var class1=dropdown.getAttribute("class");
		if(class1=="dropdown-menu"){
			dropdown.setAttribute("class","dropdown-menu show");
		}else{
			dropdown.setAttribute("class","dropdown-menu");
		}
	}
	function expDrop(x) {
		var dropdown=document.getElementById("expDropmenu");
		var class2=dropdown.getAttribute("class");
		if(x==0){
			dropdown.setAttribute("class","dropdown-menu show");
		}else{
			dropdown.setAttribute("class","dropdown-menu");
		}
	}
	function set() {
		setTimeout("expDrop(1)", 3000);
	}
</script>