package factory.packages;
import documents.packages.Document;
import documents.packages.WordDocument;

public class WordDocumentFactory extends DocumentFactory{
	 public Document createDocument() {
	        return new WordDocument();
	    }
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
