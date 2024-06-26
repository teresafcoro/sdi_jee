<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Vista productos</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:useBean id="counter" class="com.uniovi.sdi.Counter" scope="application"/>
<jsp:setProperty name="counter" property="increase" value="1"/>
<!-- Barra de Navegación superior -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="nav-item"><a class="nav-link" href="products">Productos</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp">Index</a></li>
        </ul>
        <div class="nav navbar-right">
            <div class="center-block"> <jsp:getProperty name="counter" property="total"/> Visitas </div>
        </div>
    </div>
</nav>
<!-- Contenido -->
<div class="container" id="main-container">
    <h2>Vista productos</h2>
    <ul>
        <c:forEach var="product" items="${storeProducts}">
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div>
                    <img src="<c:out value="${product.image}"/>"/>
                    <div><c:out value="${product.name}"/></div>
                </div>
            </div>
        </c:forEach>
    </ul>
    <a href="index.jsp">Volver</a>
</div>
</body>
</html>