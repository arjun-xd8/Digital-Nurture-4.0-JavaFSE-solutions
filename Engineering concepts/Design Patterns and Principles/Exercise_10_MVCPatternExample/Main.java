public class Main {
    public static void main(String[] args) {
        // Create Model
        Student student = new Student("Dhananjay", "S123", "A");

        // Create View
        StudentView view = new StudentView();

        // Create Controller
        StudentController controller = new StudentController(student, view);

        // Display initial details
        controller.updateView();

        // Update model data using controller
        controller.setStudentName("Dhananjaya Sahoo");
        controller.setStudentGrade("A+");

        // Display updated details
        controller.updateView();
    }
}
