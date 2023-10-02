<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Тестовый квест</title>
</head>
<body>
<h1><br>Ты потерял память.</br>
Принять вызов НЛО?</h1>
<form action="quest" method="post">
<input type="radio" name="choice" value="accept" required>Принять
    <input type="radio" name="choice" value="reject" required>Отклонить
    <input type="submit" value="Следующий вопрос">
</form>
<%
    String playerName = (String) request.getSession().getAttribute("playerName");
    String clientIp = request.getRemoteAddr();
    HashMap<String,Integer> gamesPlayed = (HashMap<String, Integer>) request.getSession().getAttribute("gamesPlayed");
    int gamesCount = (gamesPlayed != null) ? gamesPlayed.getOrDefault(playerName, 0) : 0;
%>
<p>Имя игрока: <%= playerName%></p>
<p>Количество игр: <%= gamesCount%></p>
<p>Ваш IP-адрес: <%= clientIp%></p>
</body>
</html>
