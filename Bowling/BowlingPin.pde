public class BowlingPin {
    private boolean isStanding;
    private int x;
    private int y;

    public BowlingPin(int x, int y) {
        this.isStanding = true;
        this.x = x;
        this.y = y;
    }
    
    public boolean isStanding() {
        return isStanding;
    }

    public void setStanding(boolean standing) {
        isStanding = standing;
    }

    public int getXCoordinate() {
        return x;
    }

    public void setXCoordinate(int xCoordinate) {
        this.x = xCoordinate;
    }

    public int getYCoordinate() {
        return y;
    }

    public void setYCoordinate(int yCoordinate) {
        this.y = yCoordinate;
    }
}
