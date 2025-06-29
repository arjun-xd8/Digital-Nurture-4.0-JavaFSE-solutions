package sorting;

public class Main {
	public static void bubbleSort(Order[] orders) {
	    int n = orders.length;
	    for (int i = 0; i < n - 1; i++) {
	        for (int j = 0; j < n - i - 1; j++) {
	            if (orders[j].totalPrice > orders[j + 1].totalPrice) {
	                Order temp = orders[j];
	                orders[j] = orders[j + 1];
	                orders[j + 1] = temp;
	            }
	        }
	    }
	}
	public static void quickSort(Order[] orders, int low, int high) {
	    if (low < high) {
	        int pivotIndex = partition(orders, low, high);
	        quickSort(orders, low, pivotIndex - 1);
	        quickSort(orders, pivotIndex + 1, high);
	    }
	}

	private static int partition(Order[] orders, int low, int high) {
	    double pivot = orders[high].totalPrice;
	    int i = low - 1;

	    for (int j = low; j < high; j++) {
	        if (orders[j].totalPrice < pivot) {
	            i++;
	            Order temp = orders[i];
	            orders[i] = orders[j];
	            orders[j] = temp;
	        }
	    }

	    Order temp = orders[i + 1];
	    orders[i + 1] = orders[high];
	    orders[high] = temp;

	    return i + 1;
	}
	public static void main(String[] args) {
        Order[] orders = {
            new Order(1, "Alice", 950.0),
            new Order(2, "Bob", 500.0),
            new Order(3, "Charlie", 1200.0),
            new Order(4, "Daisy", 700.0)
        };
        System.out.println("Before Bubble Sort:");
        for (Order o : orders) o.display();

        bubbleSort(orders);

        System.out.println("\nAfter Bubble Sort:");
        for (Order o : orders) o.display();

        orders = new Order[] {
            new Order(1, "Alice", 950.0),
            new Order(2, "Bob", 500.0),
            new Order(3, "Charlie", 1200.0),
            new Order(4, "Daisy", 700.0)
        };

        quickSort(orders, 0, orders.length - 1);

        System.out.println("\nAfter Quick Sort:");
        for (Order o : orders) o.display();
    }
}



