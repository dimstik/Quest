package by.javarush.pavlov.quest;

import java.io.*;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

public class QuestServlet extends HttpServlet {
    private QuestGame game;
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        game = new QuestGame("");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String step = game.getCurrentStep();
        String playerName = game.getPlayerName();

        if (step.equals("/start")) {
            request.getRequestDispatcher("/start").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}