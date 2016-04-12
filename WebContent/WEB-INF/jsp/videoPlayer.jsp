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

        <title>播放视频</title>

        <!-- Bootstrap core CSS -->
        <link href="webResource/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/videoPlayer.css" rel="stylesheet">


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
                    <a class="navbar-brand" href="home">Video Search</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="home">Home</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container">
            <div class="row"></div>
            <div class="row" style="margin-top: 7%">
                <div class="col-sm-8 col-sm-offset-1">
                    <video id="video" controls="controls" width="850" preload="auto" onloadedmetadata="alert('Meta data for video loaded')">
                        <source src="<c:url value="" />${video.url}" type="video/mp4">
                        Your browser does not support HTML5 video.
                    </video>
                </div>
            </div>
            <div class="row" style="display: none" id="timeBar">
                <div class="col-sm-9 col-sm-offset-1">
                    <div class="progress">
                        <c:forEach var="shotPair" items="${video.shots}" varStatus="status">
                            <c:if test="${status.count == 1}">
                                <div class="progress-bar normal">
                                    <span class="sr-only">0</span>
                                </div>
                                <div class="progress-bar shots">
                                    <span class="sr-only">${shotPair.start}</span>
                                </div>
                                <div class="progress-bar normal">
                                    <span class="sr-only">${shotPair.end}</span>
                                </div>
                            </c:if>
                            <c:if test="${status.count != 1}">
                                <div class="progress-bar shots">
                                    <span class="sr-only">${shotPair.start}</span>
                                </div>
                                <div class="progress-bar normal">
                                    <span class="sr-only">${shotPair.end}</span>
                                </div>
                            </c:if>
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
            require(['../../js/videoPlayer'], function() {
            });
        </script>
    </body>
</html>
