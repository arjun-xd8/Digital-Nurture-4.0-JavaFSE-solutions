package searching;
import java.util.Arrays;
import java.util.Comparator;
public class Main {

	public static void sortById(Product[] products) {
	    Arrays.sort(products, Comparator.comparingInt(p -> p.productId));
	}
  public static Product linearSearch(Product[] products, int targetId) {
        for (Product p : products) {
            if (p.productId == targetId) {
                return p;
            }
        }
        return null;
  }
  public static Product binarySearch(Product[] products, int targetId) {
	    int low = 0, high = products.length - 1;
	    while (low <= high) {
	        int mid = (low + high) / 2;
	        if (products[mid].productId == targetId) {
	            return products[mid];
	        } else if (products[mid].productId < targetId) {
	            low = mid + 1;
	        } else {
	            high = mid - 1;
	        }
	    }
	    return null;
	}
  
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Product[] products = {
            new Product(105, "Keyboard", "Electronics"),
            new Product(101, "Pen", "Stationery"),
            new Product(103, "Notebook", "Stationery"),
            new Product(102, "Mouse", "Electronics")
        };
        Product found1 = linearSearch(products, 103);
        System.out.print("Linear Search Result: ");
        if (found1 != null) found1.display();
        else System.out.println("Product not found.");
        sortById(products);
        Product found2 = binarySearch(products, 103);
        System.out.print("Binary Search Result: ");
        if (found2 != null) found2.display();
        else System.out.println("Product not found.");
    }
		
	

}
