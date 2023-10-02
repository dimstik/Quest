<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <input type="text" value="Следующий вопрос">
</form>
</body>
</html>
