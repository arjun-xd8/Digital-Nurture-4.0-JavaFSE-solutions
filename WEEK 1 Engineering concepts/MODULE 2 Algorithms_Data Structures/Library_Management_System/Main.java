import java.util.*;

public class Main {
    public static void main(String[] args) {
        List<Book> books = new ArrayList<>();
        books.add(new Book(1, "Java Programming", "James Gosling"));
        books.add(new Book(2, "Effective Java", "Joshua Bloch"));

        // Call the method from the utility class
        Book result = BookSearchUtil.linearSearchByTitle(books, "Effective Java");

        if (result != null) {
            System.out.println("Found: " + result);
        } else {
            System.out.println("Book not found");
        }
    }
}
