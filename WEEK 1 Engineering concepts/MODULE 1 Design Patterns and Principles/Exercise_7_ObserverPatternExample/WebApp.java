public class WebApp implements Observer {
    public void update(String stockName, double newPrice) {
        System.out.println("Web App: " + stockName + " updated to ₹" + newPrice);
    }
}
