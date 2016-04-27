<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>test</title>

<!-- Bootstrap -->
<link href="/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="data:text/css;charset=utf-8," data-href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" rel="stylesheet" id="bs-theme-stylesheet">

<link href="/static/css/jquery-ui.theme.min.css" rel="stylesheet">
<link href="/static/css/docs.min.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
<!--
body {
	padding-top: 50px;
}

.starter-template {
	padding: 40px 15px;
	text-align: center;
}
 #sortable1, #sortable2{ list-style-type: none; margin: 0; padding: 0; width: 450px; float:left}
  #sortable1 li, #sortable2 li{ margin: 3px 3px 3px 0; padding: 1px; float: left; width: 100px; height: 90px; font-size: 4em; text-align: center; }

-->
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">首页</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">

		<div class="starter-template">
			<h1>拖曳测试</h1>
		</div>
		<p class="lead">请任意拖动下面的图片</p>
		<ul id="sortable1" class="connectedSortable">
			<li class="ui-state-default">1</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">3</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">5</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">7</li>
			<li class="ui-state-default"></li>
		</ul>
		
		<ul id="sortable2" class="connectedSortable">
			<li class="ui-state-default"></li>
			<li class="ui-state-default">10</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">12</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">14</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">16</li>
		</ul>
		<div style="width: 400px;float: right;">
			<button id="clear" type="button" class="btn btn-danger" style="margin-top: 20px;">复位</button>
		</div>
		
	</div>
	
	<!-- /.container -->
	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/jquery-ui.min.js"></script>
	<script>
  		$(function() {
			$( "#sortable1, #sortable2" ).sortable({
							      connectWith: ".connectedSortable",
							       cursor: "move",
							       helper: "clone" 
    		}).disableSelection();
    		$("#clear").click(function(){
    			$( "#sortable1, #sortable2" ).sortable( "cancel" );
    		});
		});
		
	</script>
</body>
</html>
