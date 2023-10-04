package by.javarush.pavlov.quest;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.junit.Test;
import java.io.IOException;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.*;

public class QuestServletTest {
    @Test
    public void testServletInitialization() throws ServletException {
        QuestServlet servlet = new QuestServlet();
        ServletConfig config = mock(ServletConfig.class);
        when(config.getServletName()).thenReturn("QuestServlet");
        servlet.init(config);

        assertNotNull(servlet); // Проверяем, что сервлет успешно инициализирован
    }
}