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


        <title>视频管理</title>

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
                        <li><a href="uploadVideo">添加视频</a></li>
                        <li class="active"><a href="manageVideo">视频管理 <span class="sr-only">(current)</span></a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h2 class="sub-header">视频管理</h2>
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="" class="form-inline">
                                <div class="form-group">
                                    <label for="search" class="sr-only">search</label>
                                    <input type="text" id="search" class="form-control" placeholder="搜索视频">
                                </div>
                                <button type="submit" class="btn btn-default">搜索</button>
                            </form>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 4%;">
                        <div class="col-sm-12">
                            <div class="table-reponsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>视频名称</th>
                                            <th>描述</th>
                                            <th>播放次数</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>三角函数的计算技巧</th>
                                            <th>数学</th>
                                            <th>1000</th>
                                            <th>
                                                <button class="btn btn-primary editDescription" type="button" data-toggle="modal" data-target="#editModal">修改视频标注</button>
                                                <button class="btn btn-danger delete" type="button" data-toggle="modal" data-target="#deleteModal">删除</button>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>高考议论文写作指导</th>
                                            <th>语文</th>
                                            <th>1420</th>
                                            <th>
                                                <button class="btn btn-primary editDescription" type="button" data-toggle="modal" data-target="#editModal">修改视频标注</button>
                                                <button class="btn btn-danger delete" type="button" data-toggle="modal" data-target="#deleteModal">删除</button>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>氧化还原反应基本原理</th>
                                            <th>化学</th>
                                            <th>2052</th>
                                            <th>
                                                <button class="btn btn-primary editDescription" type="button" data-toggle="modal" data-target="#editModal">修改视频标注</button>
                                                <button class="btn btn-danger delete" type="button" data-toggle="modal" data-target="#deleteModal">删除</button>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>动量守恒定律</th>
                                            <th>物理</th>
                                            <th>593</th>
                                            <th>
                                                <button class="btn btn-primary editDescription" type="button" data-toggle="modal" data-target="#editModal">修改视频标注</button>
                                                <button class="btn btn-danger delete" type="button" data-toggle="modal" data-target="#deleteModal">删除</button>
                                            </th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

        <!-- 模态框begin -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelleby="editModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button id="closeIcon" type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="editModalLabel">修改视频标注</h4>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
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
                                                <div class="col-sm-offset-2 col-sm-9">
                                                    <button id="reset" type="reset" class="btn btn-default">重置</button>
                                                    <button id="submit" type="submit" class="btn btn-primary" data-dismiss="modal">保存</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="saveBtn" type="button" class="btn btn-default" data-dismiss="modal">取消编辑</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态框end -->

        <!-- 模态框begin -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelleby="editModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button id="closeIcon" type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="editModalLabel">删除视频</h4>
                        <div class="modal-body">
                            <p>是否要删除本视频？</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default yes" data-dismiss="modal">是</button>
                            <button type="button" class="btn btn-default no" data-dismiss="modal">否</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态框end -->

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
