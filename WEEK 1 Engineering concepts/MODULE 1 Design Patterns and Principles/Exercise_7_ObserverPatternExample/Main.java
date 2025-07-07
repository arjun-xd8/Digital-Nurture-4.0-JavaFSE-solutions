public class Main {
    public static void main(String[] args) {
        StockMarket tcsStock = new StockMarket("TCS", 3600.0);

        Observer mobileApp = new MobileApp();
        Observer webApp = new WebApp();

        tcsStock.register(mobileApp);
        tcsStock.register(webApp);

        // Update price
        tcsStock.setPrice(3625.0);
        tcsStock.setPrice(3590.0);

        // Deregister one observer
        tcsStock.deregister(mobileApp);

        // Update again
        tcsStock.setPrice(3700.0);
    }
}
