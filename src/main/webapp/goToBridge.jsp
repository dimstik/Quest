<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</form>
</body>
</html>
