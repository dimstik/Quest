package by.javarush.pavlov.quest;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class QuestGameTest {
    private QuestGame game;

    @Before
    public void setUp() {
        game = new QuestGame("Player1");
    }
    @Test
    public void testConstructor() {
        assertEquals("Player1", game.getPlayerName());
        assertEquals("start", game.getCurrentStep());
    }
    @Test
    public void testGetCurrentStep() {
        assertEquals("start", game.getCurrentStep());
    }
}