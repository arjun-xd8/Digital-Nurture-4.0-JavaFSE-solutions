public class Main {
    public static void main(String[] args) {
        // Step 1: Create Repository
        CustomerRepository repository = new CustomerRepositoryImpl();

        // Step 2: Inject it into the Service
        CustomerService service = new CustomerService(repository);

        // Step 3: Use the service
        service.displayCustomer("C001");
    }
}
