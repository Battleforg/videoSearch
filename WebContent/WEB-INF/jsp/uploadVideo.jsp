<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
    	<base href="<%=basePath%>">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">


        <title>添加视频</title>

        <!-- Bootstrap core CSS -->
        <link href="webResource/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/manager.css" rel="stylesheet">


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="overview">Manager</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">后台首页</a></li>
                        <li><a href="#">设置</a></li>
                        <li><a href="#">帮助</a></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href="overview">系统概况</a></li>
                        <li class="active"><a href="uploadVideo">添加视频 <span class="sr-only">(current)</span></a></li>
                        <li><a href="manageVideo">视频管理</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h2 class="sub-header">添加视频</h2>
                    <div class="row" style="margin-top: 4%;">
                        <div class="col-sm-12">
                            <form class="form-horizontal" action="">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">视频名称</label>
                                    <div class="col-sm-9 col-md-9">
                                        <input type="text" class="form-control" id="name" placeholder="视频名称">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="col-sm-2 control-label">视频描述</label>
                                    <div class="col-sm-9 col-md-9">
                                        <input type="text" class="form-control" id="description" placeholder="视频描述">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="uploadVideo" class="col-sm-2 control-label">Upload Video</label>
                                    <div class="col-sm-9 col-md-9">
                                        <input type="file" id="uploadVideo" class="form-control" name="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-9">
                                        <button id="reset" type="reset" class="btn btn-default">重置</button>
                                        <button id="submit" type="submit" class="btn btn-primary">上传</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

        <script src="webResource/scripts/require.js"></script>
        <script>
            requirejs.config({
                urlArgs:"bust=" + (new Date()).getTime(),  //开发阶段放置requirejs缓存
                baseUrl:'webResource/scripts',
                paths:{
                    jquery:'jquery-1.11.3.min',
                    loadTemplate:'loadTemplate',
                    migrate:'jquery-migrate',
                    bootstrap:'bootstrap.min'
                },
                shim:{
                    jquery:{
                        exports:'$'
                    },
                    loadTemplate:{
                        deps:['jquery']
                    },
                    bootstrap:{
                        deps:['jquery']
                    }
                }
            });
            requirejs.onError = function (err) {
                console.log(err);
            };
            require(['../../js/manager'], function() {
            });
        </script>

  </body>
</html>
