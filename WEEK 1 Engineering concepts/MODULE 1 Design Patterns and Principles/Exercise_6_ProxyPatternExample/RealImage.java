public class RealImage implements Image {
    private String fileName;

    public RealImage(String fileName) {
        this.fileName = fileName;
        loadFromServer(); // simulates heavy loading
    }

    private void loadFromServer() {
        System.out.println("Loading image from server: " + fileName);
    }

    public void display() {
        System.out.println("Displaying image: " + fileName);
    }
}
