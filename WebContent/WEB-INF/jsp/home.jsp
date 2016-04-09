<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

        <title>搜索首页</title>

        <!-- Bootstrap core CSS -->
        <link href="webResource/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/home.css" rel="stylesheet">


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home">Project name</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="home">Home</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="title">
                        <h1>教育视频检索系统</h1>
                        <p class="lead">一个快速的基于内容的视频检索工具</p>
                    </div>
                </div>
            </div>
            <div class="row" id="btnArea">
                <div class="col-sm-8 col-sm-offset-3">
                    <form>
                        <div class="row">
                            <div class="col-sm-6">
                                <button id="openUpload" type="button" class="btn btn-default">
                                    Search by upload
                                </button>
                                
                            </div>
                            <div class="col-sm-4">
                                <button id="sampleBtn" type="button" class="btn btn-default">
                                    Search by sample
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div id="uploadImg" class="row" style="display: none;">
                <div class="col-sm-5 col-sm-offset-4">
                    <form>
                        <div class="for-group">
                            <label for="uploadFile" class="sr-only">upload image</label>
                            <input type="file" id="uploadFile" class="form-control">
                            <input id="uploadBtn" type="button" value="Upload">
                        </div>
                    </form>
                </div>
            </div>
            <div id="useSamepleImg" class="row" style="display: none;">
                <div class="col-sm-8 col-sm-offset-2">
                    <div class="row" id="samplePictureArea">
                        <c:forEach items="${pictures}" var="picture">
                            <div class="col-sm-4 samplePicture" id="${picture.id}">
                                <a href="displayResults/${picture.name}" class="thumbnail">
                                    <img width="100" src="<c:url value="/sampleImg/" />${picture.url}" alt="sample">
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <hr class="divider">
            <div class="footer">
                <p class="text-center"><a href="http://lycgaming.blog.163.com/">@2016 Battlefrog</a>-------友情链接：<a href="http://glyphicons.com/">Glyphicons字体图标</a></p>
            </div>
        </div>
    

        <script src="webResource/scripts/require.js"></script>
        <script>
            requirejs.config({
                urlArgs:"bust=" + (new Date()).getTime(),  //开发阶段防止requirejs缓存
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
            require(['../../js/home'], function() {
            });
        </script>
    </body>
</html>
