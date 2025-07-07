package task;
class Node {
    Task data;
    Node next;

    public Node(Task data) {
        this.data = data;
        this.next = null;
    }
}

public class TaskList {
    private Node head;

    public void addTask(Task task) {
        Node newNode = new Node(task);
        if (head == null) {
            head = newNode;
        } else {
            Node temp = head;
            while (temp.next != null)
                temp = temp.next;
            temp.next = newNode;
        }
    }

    public void traverseTasks() {
        if (head == null) {
            System.out.println("No tasks available.");
            return;
        }
        Node temp = head;
        while (temp != null) {
            temp.data.display();
            temp = temp.next;
        }
    }

    public Task searchTask(int id) {
        Node temp = head;
        while (temp != null) {
            if (temp.data.taskId == id)
                return temp.data;
            temp = temp.next;
        }
        return null;
    }

    public void deleteTask(int id) {
        if (head == null) {
            System.out.println("List is empty.");
            return;
        }

        if (head.data.taskId == id) {
            head = head.next;
            System.out.println("Task with ID " + id + " deleted.");
            return;
        }

        Node prev = head;
        Node curr = head.next;

        while (curr != null && curr.data.taskId != id) {
            prev = curr;
            curr = curr.next;
        }

        if (curr == null) {
            System.out.println("Task with ID " + id + " not found.");
        } else {
            prev.next = curr.next;
            System.out.println("Task with ID " + id + " deleted.");
        }
    }
}

