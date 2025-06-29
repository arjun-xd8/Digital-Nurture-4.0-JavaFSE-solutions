package employee;

public class Main {
    public static void main(String[] args) {
        EmployeeManager manager = new EmployeeManager(10);

        manager.addEmployee(new Employee(101, "Alice", "Manager", 60000));
        manager.addEmployee(new Employee(102, "Bob", "Developer", 45000));
        manager.addEmployee(new Employee(103, "Charlie", "Tester", 40000));

        System.out.println("\nAll Employees:");
        manager.displayAllEmployees();

        System.out.println("\nSearching for Employee with ID 102:");
        Employee emp = manager.searchEmployee(102);
        if (emp != null) emp.display();
        else System.out.println("Employee not found.");

        System.out.println("\nDeleting Employee with ID 101:");
        manager.deleteEmployee(101);

        System.out.println("\nAll Employees After Deletion:");
        manager.displayAllEmployees();
    }
}

