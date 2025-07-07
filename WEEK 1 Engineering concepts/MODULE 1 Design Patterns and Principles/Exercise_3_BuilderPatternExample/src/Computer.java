
public class Computer {
	
	// attributes
	private String cpu;
	private String ram;
	private String storage;
	private String graphicsCard;
	
	// Private constructor - only Builder can call it
	private Computer(Builder builder) {
		this.cpu = builder.cpu;
		this.ram = builder.ram;
		this.storage = builder.storage;
		this.graphicsCard = builder.graphicsCard;
	}
	
	// Nested static Builder class
	public static class Builder{
		private String cpu;
        private String ram;
        private String storage;
        private String graphicsCard;
        
        public Builder(String cpu, String ram) {
    		this.cpu = cpu;
    		this.ram = ram;
    	}
        
        public Builder setStorage(String storage) {
            this.storage = storage;
            return this;  // After setting one part, give me back the Builder so I can set the next part.
        }
        
        // return this - clean, chainable, step-by-step building.
        
        public Builder setGraphicsCard(String graphicsCard) {
        	this.graphicsCard = graphicsCard;
			return this;
        }
        
        public Computer build() {
        	return new Computer(this);
        }
	}
	
	// Just to display the built computer
    public void showSpecs() {
        System.out.println("CPU: " + cpu);
        System.out.println("RAM: " + ram);
        System.out.println("Storage: " + storage);
        System.out.println("Graphics Card: " + graphicsCard);
    }
	
	public static void main(String[] args) {
		// basic computer
		Computer basicComputer = new Computer.Builder("i3", "8GB").build();
		
		// gaming computer
		Computer gamingComputer = new Computer.Builder("i9", "32GB")
			.setStorage("1TB SSD")
			.setGraphicsCard("NVIDIA RTX 4080")
			.build();
		
		System.out.println("Basic Computer:");
        basicComputer.showSpecs();
        System.out.println("---------X---------");
        System.out.println("Gaming Computer:");
        gamingComputer.showSpecs();
		
	}

}
