package factory.packages;
import documents.packages.Document;
import documents.packages.ExcelDocument;

public class ExcelDocumentFactory extends DocumentFactory{
	public Document createDocument() {
		return new ExcelDocument();
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
