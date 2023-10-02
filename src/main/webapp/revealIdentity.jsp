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
</body>
</html>
