<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Тестовый квест</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<h1>Ты принял вызов.Подняться на мостик к капитану?</h1>
<form action="quest" method="post">
    <div class="form-check">
<input class="form-check-input" type="radio" name="choice" id="riseChoice" value="yes" required>
        <label class="form-check-label" for="riseChoice">
            Подняться
        </label>
    </div>
    <div class="form-check">
<input class="form-check-input" type="radio" name="choice" id="refuseChoice" value="no" required
        <label class="form-check-label" for="refuseChoice">
            Отказаться
        </label>
    </div>
<input type="submit" class="btn btn-primary" value="Следующий вопрос">
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
