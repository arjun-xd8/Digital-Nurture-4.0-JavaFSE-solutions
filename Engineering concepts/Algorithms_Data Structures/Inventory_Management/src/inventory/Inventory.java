package inventory;
import java.util.HashMap;

public class Inventory {
	HashMap<Integer, Product> products = new HashMap<>();

    public void addProduct(Product product) {
        products.put(product.productId, product);
    }

    public void updateProduct(int productId, String newName, int newQuantity, double newPrice) {
        if (products.containsKey(productId)) {
            Product product = products.get(productId);
            product.productName = newName;
            product.quantity = newQuantity;
            product.price = newPrice;
        } else {
            System.out.println("Product not found.");
        }
    }

    
    public void deleteProduct(int productId) {
        if (products.remove(productId) == null) {
            System.out.println("Product not found.");
        }
    }

    
    public void displayAll() {
        for (Product p : products.values()) {
            p.display();
        }
    }
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
