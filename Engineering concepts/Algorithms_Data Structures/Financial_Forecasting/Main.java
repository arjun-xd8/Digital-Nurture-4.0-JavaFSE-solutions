public class Main {
    public static void main(String[] args) {
        double currentValue = 10000;     // ₹10,000
        double growthRate = 0.10;        // 10% annual growth
        int years = 5;

        double future = FinanceUtil.forecast(currentValue, growthRate, years);
        System.out.println("Predicted Value after " + years + " years: ₹" + future);
    }
}
