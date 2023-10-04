<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Тестовый квест</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<h1>Конец игры</h1>
<p>Вы проиграли. Не расстраивайтесь, хотите начать заново?</p>
<form action="quest" method="post">
    <input type="submit" class="btn btn-primary" name="restart" value="Начать заново">
</form>
<%
    String playerName = (String) request.getSession().getAttribute("playerName");
    String clientIp = request.getLocalAddr();
    HashMap<String, Integer> gamesPlayed = (HashMap<String, Integer>) request.getSession().getAttribute("gamesPlayed");
    int gamesCount = (gamesPlayed != null) ? gamesPlayed.getOrDefault(playerName, 0) : 0;
%>
<table>
    <tr>
        <th>Параметр</th>
        <th>Значение</th>
    </tr>
    <tr>
        <td>Имя игрока:</td>
        <td><%= playerName %></td>
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
