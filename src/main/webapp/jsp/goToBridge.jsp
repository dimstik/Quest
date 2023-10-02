<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Тестовый квест</title>
</head>
<body>
<h1><br>Ты принял вызов.</br>Подняться на мостик к капитану?</h1>
<form action="quest" method="post">
<input type="radio" name="choice" value="yes" required>Подняться
<input type="radio" name="choice" value="no" required>Отказаться
<input type="submit" value="Следующий вопрос">
    <%
        String playerName = (String) request.getSession().getAttribute("playerName");
        String clientIp = request.getLocalAddr();
        HashMap<String, Integer> gamesPlayed = (HashMap<String, Integer>) request.getSession().getAttribute("gamesPlayed");
        int gamesCount = (gamesPlayed != null) ? gamesPlayed.getOrDefault(playerName, 0) : 0;
    %>
    <p>Имя игрока: <%= playerName %></p>
    <p>Количество игр: <%= gamesCount %></p>
    <p>Ваш IP-адрес: <%= clientIp %></p>
</form>
</body>
</html>
