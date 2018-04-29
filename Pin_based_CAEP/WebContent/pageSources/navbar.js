document.writeln("<nav class=\'navbar navbar-expand-lg fixed-top navbar-dark bg-dark\' style=\'\'>");
document.writeln("	<div class=\'container\'>");
document.writeln("	  	<a class=\'navbar-brand\' href=\'#\'>CAEP</a>");
document.writeln("	  	<button class=\'navbar-toggler\' type=\'button\' data-toggle=\'collapse\' data-target=\'#navbarColor02\' aria-controls=\'navbarColor02\' aria-expanded=\'false\' aria-label=\'Toggle navigation\'>");
document.writeln("	    <span class=\'navbar-toggler-icon\'></span>");
document.writeln("	  	</button>");
document.writeln("	");
document.writeln("		<div class=\'collapse navbar-collapse\' id=\'navbarColor02\'>");
document.writeln("	    	<ul class=\'navbar-nav\'>");
document.writeln("	      		<li class=\'nav-item\' id=\'navbar-home\'>");
document.writeln("		        	<a class=\'nav-link\' href=\'GotoHomepage.action\'>Home</a>");
document.writeln("		      	</li>");
document.writeln("		      	<li class=\'nav-item dropdown\' id=\'navbar-experiment\'>");
document.writeln("				    <a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' onmouseover=\'expDrop(0)\' onmouseout=\'set()\' href=\'#\' role=\'button\' id=\'experiment\' data-target=\'#\' aria-haspopup=\'true\' aria-expanded=\'false\'>Laboratory</a>");
document.writeln("				    <div class=\'dropdown-menu\' role=\'menu\' id=\'expDropmenu\' aria-labelledby=\'experiment\' x-placement=\'bottom-start\' style=\'position: absolute; transform: translate3d(0px, 41px, 0px); top: 0px; left: 0px; will-change: transform;\'>");
document.writeln("				        <a class=\'dropdown-item\' name=\'lab0\' href=\'GotoLab.action\'>Lab0 Pin入门与指令依赖距离分析</a>");
document.writeln("				        <a class=\'dropdown-item\' name=\'lab1\' href=\'GotoLab1.action\'>Lab1 内存缓存的设计与性能分析</a>");
document.writeln("				        <a class=\'dropdown-item\' name=\'lab2\' href=\'GotoLab2.action\'>Lab2 分支预测的算法与实践</a>");
document.writeln("						<a class=\'dropdown-item\' name=\'lab3\' href=\'GotoLab3.action\'>Lab3 高速缓存一致性协议</a>");
document.writeln("						<a class=\'dropdown-item disabled\' name=\'lab4\' href=\'#\'>Lab4 多核处理器的多级缓存探索</a>");
document.writeln("				    </div>");
document.writeln("			  	</li>");
document.writeln("		        <li class=\'nav-item\' id=\'navbar-achievement\'>");
document.writeln("		        	<a class=\'nav-link\' href=\'#\'>Achievement</a>");
document.writeln("		        </li>");
document.writeln("		        <li class=\'nav-item\' id=\'navbar-contact\'>");
document.writeln("		        	<a class=\'nav-link\' href=\'#\'>Contact</a>");
document.writeln("		        </li>");
document.writeln("		    </ul>");
document.writeln("		    ");
document.writeln("		    <ul class=\'nav navbar-nav ml-auto\' id=\'noLog\'> ");
document.writeln("	            <li class=\'nav-item\'>");
document.writeln("	            	<a class=\'nav-link\' href=\'RegSwitch.action\'>Sign Up</a>");
document.writeln("	            </li> ");
document.writeln("	            <li class=\'nav-item\'>");
document.writeln("	            	<a class=\'nav-link\' href=\'GotoLogin.action\'>Log In</a>");
document.writeln("	            </li> ");
document.writeln("		    </ul>  ");
document.writeln("		    <ul class=\'nav navbar-nav ml-auto\' id=\'hasLog\' style=\'display:none\'> ");
document.writeln("	            <li class=\'nav-item dropdown\'>");
document.writeln("	            	<a class=\'nav-link dropdown-toggle\' id=\'yourAccount\' href=\'#\' onclick=\'drop()\' data-toggle=\'dropdown\' href=\'#\' role=\'button\' data-target=\'#\'>YourAccount</a>");
document.writeln("	            	<div class=\'dropdown-menu dropdown-menu-left\' role=\'menu\' id=\'accdropMenu\' aria-labelledby=\'yourAccount\'>");
document.writeln("				        <a class=\'dropdown-item\' href=\'#\'>Action</a>");
document.writeln("				        <a class=\'dropdown-item\' href=\'#\'>Another action</a>");
document.writeln("				        <a class=\'dropdown-item\' href=\'#\'>Something else here</a>");
document.writeln("				        <div class=\'dropdown-divider\'></div>");
document.writeln("				        <a class=\'dropdown-item\' href=\'loginExit.action\'>注销</a>");
document.writeln("				    </div>");
document.writeln("	            </li> ");
document.writeln("		    </ul>    ");
document.writeln("		</div>");
document.writeln("	</div>");
document.writeln("</nav>");
document.writeln("<script type=\'text/javascript\'>");
document.writeln("	function drop() {");
document.writeln("		var dropdown=document.getElementById(\'accdropMenu\');");
document.writeln("		var class1=dropdown.getAttribute(\'class\');");
document.writeln("		if(class1==\'dropdown-menu\'){");
document.writeln("			dropdown.setAttribute(\'class\',\'dropdown-menu show\');");
document.writeln("		}else{");
document.writeln("			dropdown.setAttribute(\'class\',\'dropdown-menu\');");
document.writeln("		}");
document.writeln("	}");
document.writeln("	function expDrop(x) {");
document.writeln("		var dropdown=document.getElementById(\'expDropmenu\');");
document.writeln("		var class2=dropdown.getAttribute(\'class\');");
document.writeln("		if(x==0){");
document.writeln("			dropdown.setAttribute(\'class\',\'dropdown-menu show\');");
document.writeln("		}else{");
document.writeln("			dropdown.setAttribute(\'class\',\'dropdown-menu\');");
document.writeln("		}");
document.writeln("	}");
document.writeln("	function set() {");
document.writeln("		setTimeout(\'expDrop(1)\', 3000);");
document.writeln("	}");
document.writeln("</script>");