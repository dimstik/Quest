<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Тестовый квест</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1><br>Ты потерял память.</br>
Принять вызов НЛО?</h1>
<form action="quest" method="post">
    <div class="form-check">
<input class="form-check-input" type="radio" name="choice"  id="acceptChoice" value="accept" required>
        <label class="form-check-label" for="acceptChoice">
            Принять
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="choice" id="declineChoice" value="decline">
        <label class="form-check-label" for="declineChoice">
            Отклонить
        </label>
    </div>
    <input type="submit" class="btn btn-primary" value="Следующий вопрос">
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
