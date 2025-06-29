public class Book {
    private int bookId;
    private String title;
    private String author;

    // Constructor
    public Book(int bookId, String title, String author) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
    }

    // Getters
    public int getBookId() { return bookId; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }

    // For printing
    public String toString() {
        return "[" + bookId + "] " + title + " by " + author;
    }
    
}
