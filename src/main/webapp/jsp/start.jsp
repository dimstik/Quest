<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Текстовый квест</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>Добро пожаловать в текстовый квест</h1>
<form action="quest" method="post">
    Введите имя игрока: <input type="text" name="playerName" required>
    <input type="submit" class="btn btn-primary" value="Начать игру">
</form>
<%
    String playerName = (String) request.getSession().getAttribute("playerName");
    String clientIp = request.getRemoteAddr();
    HashMap<String, Integer> gamesPlayed = (HashMap<String, Integer>) request.getSession().getAttribute("gamesPlayed");
    int gamesCount = (gamesPlayed != null) ? gamesPlayed.getOrDefault(playerName, 0) : 0;
%>
<p>Имя игрока: <%= playerName %></p>
<p>Количество игр: <%= gamesCount %></p>
<p>Ваш IP-адрес: <%= clientIp %></p>
</body>
</html>