package factory.packages;
import documents.packages.Document;
import documents.packages.PdfDocument;

public class PdfDocumentFactory extends DocumentFactory{
	public Document createDocument() {
        return new PdfDocument();
    }
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
