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

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}