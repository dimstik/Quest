package by.javarush.pavlov.quest;

import java.io.*;
import java.util.HashMap;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class QuestServlet extends HttpServlet {
    private QuestGame game = new QuestGame("");
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        game = new QuestGame("");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String step = game.getCurrentStep();

        if (step.equals("start")) {
            request.getRequestDispatcher("/jsp/start.jsp").forward(request, response);
        } else if (step.equals("acceptUFO")) {
            request.getRequestDispatcher("/jsp/acceptUFO.jsp").forward(request, response);
        } else if (step.equals("goToBridge")) {
            request.getRequestDispatcher("/jsp/goToBridge.jsp").forward(request, response);
        } else if (step.equals("revealIdentity")) {
            request.getRequestDispatcher("/jsp/revealIdentity.jsp").forward(request, response);
        } else if (step.equals("win")) {
            request.getRequestDispatcher("/jsp/win.jsp").forward(request, response);
        } else if (step.equals("lose")) {
            request.getRequestDispatcher("/jsp/lose.jsp").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String step = game.getCurrentStep();
        String restartButton =request.getParameter("restart");
        if (restartButton != null) {
            game = new QuestGame("");
            game.setCurrentStep("start");
            // Также можно сбросить имя игрока в сессии, если оно хранится там
            HttpSession session = request.getSession();
            session.removeAttribute("playerName");
            request.getRequestDispatcher("/jsp/start.jsp").forward(request, response);
            return;
        }

        if (step.equals("start")) {
            String playerName = request.getParameter("playerName");
            game = new QuestGame(playerName);
            game.setCurrentStep("acceptUFO");
            HttpSession session = request.getSession();
            session.setAttribute("playerName", playerName);
            if (playerName != null && !playerName.isEmpty()) {
                HashMap<String,Integer> gamesPlayed = (HashMap<String, Integer>) session.getAttribute("gamesPlayed");
                if (gamesPlayed == null) {
                    gamesPlayed = new HashMap<>();
                    gamesPlayed.put(playerName, 1);
                } else {
                    int currentGamesPlayed = gamesPlayed.getOrDefault(playerName, 0);
                    gamesPlayed.put(playerName, currentGamesPlayed + 1);
                }
                session.setAttribute("gamesPlayed", gamesPlayed);
            }
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