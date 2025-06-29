public class CustomerRepositoryImpl implements CustomerRepository {

    public String findCustomerById(String id) {
        // Mocking data
        return "Customer[id=" + id + ", name=Dhananjay]";
    }
}
