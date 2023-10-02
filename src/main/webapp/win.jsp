<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Текстовый квест</title>
</head>
<body>
<h1>Поздравляю, ${playerName}!</h1>
<p>Вы успешно закончили квест и вернулись домой.</p>
<form action="quest" method="post">
<input type="submit" name="restart" value="Начать заново">
</form>
</body>
</html>
