<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark" style="">
	<div class="container">
	  	<a class="navbar-brand" href="#">CAEP</a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  	</button>
	
		<div class="collapse navbar-collapse" id="navbarColor02">
	    	<ul class="navbar-nav">
	      		<li class="nav-item">
		        	<a class="nav-link" href="#">Home</a>
		      	</li>
		      	<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" id="experiment" data-target="#" aria-haspopup="true" aria-expanded="false">Experiment</a>
				    <div class="dropdown-menu" role="menu" aria-labelledby="experiment" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 41px, 0px); top: 0px; left: 0px; will-change: transform;">
				        <a class="dropdown-item" href="#">1</a>
				        <a class="dropdown-item" href="#">2</a>
				        <a class="dropdown-item" href="#">3333</a>
						<a class="dropdown-item" href="#">44444444</a>
				    </div>
			  	</li>
		        <li class="nav-item">
		        	<a class="nav-link" href="#">Achievement</a>
		        </li>
		        <li class="nav-item">
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
				        <a class="dropdown-item" href="#">Action</a>
				        <a class="dropdown-item" href="#">Another action</a>
				        <a class="dropdown-item" href="#">Something else here</a>
				        <div class="dropdown-divider"></div>
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
</script>