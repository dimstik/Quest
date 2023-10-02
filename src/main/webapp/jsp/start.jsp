<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Текстовый квест</title>
</head>
<body>
<h1>Добро пожаловать в текстовый квест</h1>
<form action="quest" method="post">
    Введите имя игрока: <input type="text" name="playerName" required>
    <input type="submit" value="Начать игру">
</form>
</body>
</html>