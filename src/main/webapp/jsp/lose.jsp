<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Тестовый квест</title>
</head>
<body>
<h1>Конец игры</h1>
<p>Вы проиграли. Не расстраивайтесь, хотите начать заново?</p>
<form action="quest" method="post">
    <input type="submit" name="restart" value="Начать заново">
</form>
<%
    String playerName = (String) request.getSession().getAttribute("playerName");
    String clientIp = request.getLocalAddr();
    HashMap<String, Integer> gamesPlayed = (HashMap<String, Integer>) request.getSession().getAttribute("gamesPlayed");
    int gamesCount = (gamesPlayed != null) ? gamesPlayed.getOrDefault(playerName, 0) : 0;
%>
<p>Имя игрока: <%= playerName %></p>
<p>Количество игр: <%= gamesCount %></p>
<p>Ваш IP-адрес: <%= clientIp %></p>
</body>
</html>
