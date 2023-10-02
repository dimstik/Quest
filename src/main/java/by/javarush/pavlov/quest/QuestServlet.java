package by.javarush.pavlov.quest;

import java.io.*;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class QuestServlet extends HttpServlet {
    private QuestGame game;
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        game = new QuestGame("");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String step = game.getCurrentStep();

        if (step.equals("start")) {
            request.getRequestDispatcher("/start.jsp").forward(request, response);
        } else if (step.equals("acceptUFO")) {
            request.getRequestDispatcher("/acceptUFO.jsp").forward(request, response);
        } else if (step.equals("goToBridge")) {
            request.getRequestDispatcher("/goToBridge.jsp").forward(request, response);
        } else if (step.equals("revealIdentity")) {
            request.getRequestDispatcher("/revealIdentity.jsp").forward(request, response);
        } else if (step.equals("win")) {
            request.getRequestDispatcher("/win.jsp").forward(request, response);
        } else if (step.equals("lose")) {
            request.getRequestDispatcher("/lose.jsp").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String step = game.getCurrentStep();
        String restartButton =request.getParameter("restart");
        if (restartButton != null) {
            game = new QuestGame("");
            game.setCurrentStep("start");
            response.sendRedirect("quest");
            return;
        }

        if (step.equals("start")) {
            String playerName = game.getPlayerName();
            game = new QuestGame(playerName);
            game.setCurrentStep("acceptUFO");
            response.sendRedirect("quest");
        } else if (step.equals("acceptUFO")) {
            String choice = request.getParameter("choice");
            if ("accept".equals(choice)) {
                game.setCurrentStep("goToBridge");
            } else {
                game.setCurrentStep("lose");
            }
            response.sendRedirect("quest");
        } else if (step.equals("goToBridge")){
            String choice = request.getParameter("choice");
            if ("yes".equals(choice)) {
                game.setCurrentStep("revealIdentity");
            } else {
                game.setCurrentStep("lose");
            }
            response.sendRedirect("quest");
        } else if (step.equals("revealIdentity")) {
            String choice = request.getParameter("choice");
            if ("truth".equals(choice)) {
                game.setCurrentStep("win");
            } else {
                game.setCurrentStep("lose");
            }
            response.sendRedirect("quest");
        }
    }
}