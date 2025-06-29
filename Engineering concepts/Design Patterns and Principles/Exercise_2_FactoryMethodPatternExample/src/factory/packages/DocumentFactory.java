package factory.packages;
import documents.packages.Document;

public abstract class DocumentFactory {
	 public abstract Document createDocument();
	 // abstract = no body, only method definition
	 // Forces child classes to override and implement it
	 
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}
