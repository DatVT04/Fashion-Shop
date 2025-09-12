package entity;

public class TimeSeriesData {
    private String period;
    private int count;
    
    public TimeSeriesData() {
    }
    
    public TimeSeriesData(String period, int count) {
        this.period = period;
        this.count = count;
    }
    
    public String getPeriod() {
        return period;
    }
    
    public void setPeriod(String period) {
        this.period = period;
    }
    
    public int getCount() {
        return count;
    }
    
    public void setCount(int count) {
        this.count = count;
    }
}