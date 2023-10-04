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
        <th style="font-weight: bold; color: black;">Параметр</th>
        <th style="font-weight: bold; color: black;">Значение</th>
    </tr>
    <tr>
        <td style="font-weight: bold; color: black;">Имя игрока:</td>
        <td style="font-weight: bold; color: black;"><%= playerName != null ? playerName : "" %></td>
    </tr>
    <tr>
        <td style="font-weight: bold; color: black;">Количество игр:</td>
        <td style="font-weight: bold; color: black;"><%= gamesCount %></td>
    </tr>
    <tr>
        <td style="font-weight: bold; color: black;">Ваш IP-адрес:</td>
        <td style="font-weight: bold; color: black;"><%= clientIp %></td>
    </tr>
</table>
</body>
</html>