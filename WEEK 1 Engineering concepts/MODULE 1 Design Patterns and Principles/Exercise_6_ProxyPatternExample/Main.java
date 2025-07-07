public class Main {
    public static void main(String[] args) {
        Image img1 = new ProxyImage("photo1.jpg");

        // Image loads here
        img1.display();  
        
        // Now only display, no loading
        img1.display();
    }
}
