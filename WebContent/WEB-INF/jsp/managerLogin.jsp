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
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <meta name="description" content="">
        <meta name="author" content="">

        <title>管理员登陆</title>

        <!-- Bootstrap core CSS -->
        <link href="webResource/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/managerLogin.css" rel="stylesheet">


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <div class="container">
            <form class="form-signin">
                <h2 class="form-signin-heading text-center">管理员登陆</h2>
                <label for="inputAccount" class="sr-only">账户</label>
                <input type="text" id="inputAccount" class="form-control" placeholder="账户" required autofocus>
                <label for="inputPassword" class="sr-only">密码</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="密码" required>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me">记住我
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
            </form>
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
