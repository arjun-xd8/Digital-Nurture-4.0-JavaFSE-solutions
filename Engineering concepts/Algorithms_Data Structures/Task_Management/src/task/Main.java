package task;

public class Main {
    public static void main(String[] args) {
        TaskList list = new TaskList();

        list.addTask(new Task(1, "Design", "Pending"));
        list.addTask(new Task(2, "Develop", "In Progress"));
        list.addTask(new Task(3, "Test", "Not Started"));

        System.out.println("All Tasks:");
        list.traverseTasks();

        System.out.println("\nSearching for Task ID 2:");
        Task t = list.searchTask(2);
        if (t != null) t.display();
        else System.out.println("Task not found.");

        System.out.println("\nDeleting Task ID 1:");
        list.deleteTask(1);

        System.out.println("\nTasks After Deletion:");
        list.traverseTasks();
    }

}
