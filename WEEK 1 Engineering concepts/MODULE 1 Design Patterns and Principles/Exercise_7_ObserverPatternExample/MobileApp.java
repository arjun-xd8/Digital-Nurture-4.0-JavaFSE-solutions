public class MobileApp implements Observer {
    public void update(String stockName, double newPrice) {
        System.out.println("Mobile App: " + stockName + " updated to ₹" + newPrice);
    }
}
