<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Текстовый квест</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/transparentStyle.css">
</head>
<body>
<style>
    body {
        background-image: url('<%= request.getContextPath() %>/images/ufo.jpg'); /* Укажите путь к вашему изображению */
        background-size: cover;
    }
</style>
<h1 style="font-weight: bold; color: #000000;">Добро пожаловать в текстовый квест</h1>
<form action="quest" method="post">
    <i style="font-weight: bold; color: #000000;">Введите имя игрока:</i> <input type="text" name="playerName" required class="transparent-input">
    <input type="submit" class="btn btn-primary" value="Начать игру">
</form>
<%
    String playerName = (String) request.getSession().getAttribute("playerName");
    String clientIp = request.getRemoteAddr();
    HashMap<String, Integer> gamesPlayed = (HashMap<String, Integer>) request.getSession().getAttribute("gamesPlayed");
    int gamesCount = (gamesPlayed != null) ? gamesPlayed.getOrDefault(playerName, 0) : 0;
%>
<table class="black-text-table">
    <tr>
        <th>Параметр</th>
        <th>Значение</th>
    </tr>
    <tr>
        <td>Имя игрока:</td>
        <td><%= playerName != null ? playerName : "" %></td>
    </tr>
    <tr>
        <td>Количество игр:</td>
        <td><%= gamesCount %></td>
    </tr>
    <tr>
        <td>Ваш IP-адрес:</td>
        <td><%= clientIp %></td>
    </tr>
</table>
</body>
</html>