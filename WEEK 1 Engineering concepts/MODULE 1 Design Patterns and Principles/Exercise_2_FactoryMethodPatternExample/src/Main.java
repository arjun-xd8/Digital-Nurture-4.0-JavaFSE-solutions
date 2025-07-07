import documents.packages.Document;
import factory.packages.DocumentFactory;
import factory.packages.WordDocumentFactory;
import factory.packages.PdfDocumentFactory;
import factory.packages.ExcelDocumentFactory;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DocumentFactory wordFactory = new WordDocumentFactory();
        Document wordDoc = wordFactory.createDocument();
        wordDoc.open();

        DocumentFactory pdfFactory = new PdfDocumentFactory();
        Document pdfDoc = pdfFactory.createDocument();
        pdfDoc.open();

        DocumentFactory excelFactory = new ExcelDocumentFactory();
        Document excelDoc = excelFactory.createDocument();
        excelDoc.open();
	}

}
