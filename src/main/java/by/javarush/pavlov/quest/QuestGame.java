package by.javarush.pavlov.quest;

public class QuestGame {
    private String playerName;
    private String currentStep;

    public QuestGame(String playerName) {
        this.playerName = playerName;
        this.currentStep = currentStep;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setCurrentStep(String currentStep) {
        this.currentStep = currentStep;
    }

    public String getCurrentStep() {
        return currentStep;
    }
}
