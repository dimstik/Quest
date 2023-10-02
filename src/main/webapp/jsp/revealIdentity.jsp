<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Текстовый квест</title>
</head>
<body>
<h1><br>Ты поднялся на мостик.</br>Кто ты?</h1>
<form action="quest" method="post">
  <input type="radio" name="choice" value="truth" required>Сказать правду
  <input type="radio" name="choice" value="lie" required>Солгать
  <input type="submit" value="Следующий вопрос">
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
