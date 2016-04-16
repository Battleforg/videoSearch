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

        <title>视频预览</title>

        <!-- Bootstrap core CSS -->
        <link href="webResource/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/displayResults.css" rel="stylesheet">


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
            <div class="row" style="padding-left: 6%;padding-top: 8%;padding-bottom: 5%;">
                <div class="col-sm-2">
                    <img width="100%" src="<c:url value="" />${picture.url}" alt="results">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="row" id="resultVideoArea">
                        <c:forEach items="${videos}" var="video">
                            <div class="col-sm-4 videoPicture">
                                <div class="thumbnail">
                                    <img width="100%" src="<c:url value="" />${video.thumbnailUrl}" alt="results">
                                    <p class="text-center">${video.name}</p>
                                    <div class="caption">
                                        <h3>匹配情况：</h3>
                                        <ol>
                                        <c:forEach var="shotPair" items="${video.shots}" varStatus="status">
                                            <li>
                                                <p class="shotPairs">
                                                    <span>关键帧:${shotPair.hit},</span><span>所在镜头:</span><span>${shotPair.start}</span><span>至${shotPair.end}</span>
                                                </p>
                                                
                                            </li>
                                        </c:forEach>    
                                        </ol>
                                        <p class="videoUrl" style="display: none;">${video.url}</p>
                                        <button type="button" class="btn btn-primary showVideoBtn" data-toggle="modal" data-target="#myModal">查看视频</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- 模态框begin -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelleby="myModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button id="closeIcon" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">播放视频</h4>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <div class="row" style="margin-top: 7%">
                                                <div class="col-sm-8">
                                                    <video id="video" controls="controls" width="700" preload="auto">
                                                        <source src="video/test3.mp4" type="video/mp4">
                                                        Your browser does not support HTML5 video.
                                                    </video>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-9 col-sm-offset-1">
                                                    <p>匹配情况：</p>
                                                    <ol id="shotsDetailArea"> 
                                                    </ol>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 模态框end -->
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
            require(['../../js/displayResults'], function() {
            });
        </script>
        <script id="shotAndHitTemplate" type="text/html">
            <li>
                <p>
                    <span data-content="shotsAndHit"></span>
                </p>
            </li>
        </script>
    </body>
</html>
