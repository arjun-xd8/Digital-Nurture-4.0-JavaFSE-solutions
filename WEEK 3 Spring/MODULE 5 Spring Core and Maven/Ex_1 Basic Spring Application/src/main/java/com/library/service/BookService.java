package com.library.service;
import com.library.repository.BookRepository;
public class BookService {
	private BookRepository bookRepository;

    // Setter for Spring injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void displayBook() {
        String book = bookRepository.getBookTitle();
        System.out.println("Book: " + book);
    }
}
