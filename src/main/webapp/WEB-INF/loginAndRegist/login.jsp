<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>Fullscreen Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">

        <style type="text/css">

            body {
                background: #f8f8f8;
                font-family: 'PT Sans', Helvetica, Arial, sans-serif;
                text-align: center;
                color: #fff;
            }

            .page-container {
                margin: 120px auto 0 auto;
            }

            h1 {
                font-size: 30px;
                font-weight: 700;
                text-shadow: 0 1px 4px rgba(0,0,0,.2);
            }

            form {

                width: 800px;
                margin: 15px auto 0 auto;
                text-align: left;
            }

            input {
                width: 270px;
                height: 42px;
                margin-top: 25px;
                margin-left:260px;
                padding: 0 15px;
                background: #2d2d2d; /* browsers that don't support rgba*/
                background: rgba(45,45,45,.15);
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
                border-radius: 6px;
                border: 1px solid #3d3d3d; /* browsers that don't support rgba*/
                border: 1px solid rgba(255,255,255,.15);
                /*-moz-box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;*/
                /*-webkit-box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;*/
                /*box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;*/
                font-family: 'PT Sans', Helvetica, Arial, sans-serif;
                font-size: 14px;
                color: #fff;
                /* text-shadow: 0 1px 2px rgba(0,0,0,.1);
                 -o-transition: all .2s;
                 -moz-transition: all .2s;
                 -webkit-transition: all .2s;
                 -ms-transition: all .2s;*/
            }

            input:-moz-placeholder { color: #fff; }
            input:-ms-input-placeholder { color: #fff; }
            input::-webkit-input-placeholder { color: #fff; }

            button {
                cursor: pointer;
                width: 300px;
                height: 44px;
                margin-top: 25px;
                margin-left: 260px;
                padding: 0;
                background: #ef4300;
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
                border-radius: 6px;
                border: 1px solid #ff730e;
                -moz-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                -webkit-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                font-family: 'PT Sans', Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: 700;
                color: #fff;
                text-shadow: 0 1px 2px rgba(0,0,0,.1);
                -o-transition: all .2s;
                -moz-transition: all .2s;
                -webkit-transition: all .2s;
                -ms-transition: all .2s;
            }

            button:hover {
                -moz-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                -webkit-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
            }

            button:active {
                -moz-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                -webkit-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                box-shadow:
                        0 5px 8px 0 rgba(0,0,0,.1) inset,
                        0 1px 4px 0 rgba(0,0,0,.1);

                border: 0px solid #ef4300;
            }

        </style>

        <!-- 设置错误提示信息的样式-->
        <style >
            /*设置验证框宽度*/
            .valistr{
                width: 120px;
            }

            #verifyCode{
                margin-left: 20px;
                vertical-align: middle;
            }



            .error{
                color:red;
            }
        </style>


        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <c:set value="${pageContext.request.contextPath}" var="app"></c:set>
        <!-- 应用validation表单校验-->
        <script src="${app}/js/jquery-validation-1.14.0/lib/jquery.js"></script>
        <script src="${app}/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
        <script src="${app}/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

        <script type="text/javascript">
            $(function(){
                $("#signupForm").validate({
                    rules: {
                        username: {

                            required: true,

                        },
                        password: {
                            required: true,
                        }
                    },
                    messages: {
                        username: {
                            required: "请输入用户名",

                        },
                        password: {
                            required: "请输入密码",
                        }

                    },

                    errorPlacement:function(error, element){
                        error.insertBefore(element.next("span"));
                        error.insertBefore(element.next().next("span"));


                    }

                })
            })



            // 在键盘按下并释放及提交后验证提交表单

        </script>

    </head>

    <body>

        <div class="page-container">
            <h1>登录</h1><br/>

            <h6 style="color: red">
                <c:if test="${!empty errorInfo}">
                    ${errorInfo}
                </c:if>
            </h6>

            <form action="${app}/toLogin" method="post" id="signupForm">
                <input type="text" name="username" class="username" placeholder="用户名"
                        /><span></span>
                <input type="password" name="password" id="password" class="password"placeholder="密码"><span></span>

                <input type="hidden" name="url" value="<%= request.getHeader("Referer")%>"/>

                <button type="submit">登录</button>



            </form>

        </div>

        <!-- Javascript -->

        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>


    </body>

</html>


