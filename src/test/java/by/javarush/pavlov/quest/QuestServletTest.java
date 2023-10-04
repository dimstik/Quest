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

        assertNotNull(servlet);
    }
    @Test
    public void testDoGetStartStep() throws ServletException, IOException {
        QuestServlet servlet = new QuestServlet();
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("gamesPlayed")).thenReturn(null);
        RequestDispatcher requestDispatcher = mock(RequestDispatcher.class);
        when(request.getRequestDispatcher("/jsp/start.jsp")).thenReturn(requestDispatcher);

        servlet.doGet(request, response);

        verify(requestDispatcher).forward(request, response);
    }
    @Test
    public void testDoPostRestart() throws ServletException, IOException {
        QuestServlet servlet = new QuestServlet();
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        when(request.getParameter("restart")).thenReturn("true");
        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("gamesPlayed")).thenReturn(null);
        RequestDispatcher requestDispatcher = mock(RequestDispatcher.class);

        // Настройка мока requestDispatcher
        when(request.getRequestDispatcher("/jsp/start.jsp")).thenReturn(requestDispatcher);

        servlet.doPost(request, response);

        // Проверяем, что запрос был перенаправлен на начальную JSP с использованием одного и того же мока requestDispatcher
        verify(requestDispatcher).forward(request, response);
    }
}