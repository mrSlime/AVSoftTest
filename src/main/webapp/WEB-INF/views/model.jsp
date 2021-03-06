<%--
Created by IntelliJ IDEA.
User: slimechan
Date: 8/12/20
Time: 3:51 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<%@ page import="com.slimechan.avsoft.entity.user.AuthUser" %>
<html>
<head>
    <title>Home page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<div class="container w-75">
    <div class="container w-100 p-5 d-flex justify-content-between">
        <a href="/" class="text-dark"><h3><img src="https://hhcdn.ru/employer-logo/1929775.png"
                                               style="width: 48px; height: 48px;"/> AVSoft </h3></a>
        <div class="dropdown">
            <% if (AuthUser.class.isAssignableFrom(request.getSession().getAttribute("user").getClass())) {
                out.print("<button id=\"user\" type=\"button\" class=\"btn btn-light text-dark\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">" + ((AuthUser) request.getSession().getAttribute("user")).getUsername() + "</button>");

                out.println("<div class=\"dropdown-menu\" aria-labelledby=\"user\">");
                if ((Boolean) request.getSession().getAttribute("canEdit")) {
                    out.print("<a class=\"dropdown-item\" href=\"/admin\">Edit page</a>");
                }
                out.print("<a class=\"dropdown-item\" href=\"/logout\">Logout</a>");
                out.print("</div>");

            } else {%>
            <a href="/login" class="text-dark">Login</a>|<a href="/register" class="text-dark">Register</a>
            <% } %>
        </div>

    </div>

    <h4>${model.getName()}</h4>
    <div class="table">
        <div class="row p-3 bg-secondary text-light text-center">
            <h4 class="col-3">Permission</h4><h4 class="col-3">Value</h4><h4 class="col-3">Weight</h4><h4
                class="col-3"></h4>
        </div>
        <c:forEach items="${model.getPermissions()}" var="permission">
            <form class="row" action="/api/${modelType}/${model.getName()}/remove" method="post">
                <input type="text" class="w-25 col-3" name="permission" value="${permission.getName()}" readonly/>
                <input type="text" class="w-25 col-3" name="value" value="${permission.getValue()}" readonly/>
                <input type="text" class="w-25 col-3" name="weight" value="${permission.getWeight()}" readonly/>
                <input type="submit" class="col-3 btn btn-danger text-center" value="REMOVE"/>
            </form>
        </c:forEach>
        <form class="row" action="/api/${modelType}/${model.getName()}/add" method="post">
            <input type="text" class="w-25 col-3" name="permission"/>
            <input type="text" class="w-25 col-3" name="value"/>
            <input type="text" class="w-25 col-3" name="weight"/>
            <input type="submit" class="col-3 btn btn-success text-center" value="ADD"/>
        </form>
    </div>
</div>
</body>
<footer class="container p-5 d-flex justify-content-between">
    <a>© AVSoft 2020. All Rights Reserved.</a>
    <a href="https://t.me/slime_chan">designed & developed by @SlimeChan_</a>
</footer>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>