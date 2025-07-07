import java.util.List;

public class BookSearchUtil {

    public static Book linearSearchByTitle(List<Book> books, String title) {
        for (Book book : books) {
            if (book.getTitle().equalsIgnoreCase(title)) {
                return book;
            }
        }
        return null;
    }

    // You can also add binarySearchByTitle here later if needed
}
