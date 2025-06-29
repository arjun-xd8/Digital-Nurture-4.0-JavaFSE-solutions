
public class Logger {
	    //  2a: Private static instance
	    private static Logger instance;

	    //  2b: Private constructor to prevent outside object creation
	    private Logger() {
	        System.out.println("Logger initialized.");
	    }

	    //  2c: Public method to get the instance
	    public static Logger getInstance() {
	        if (instance == null) {
	            instance = new Logger(); // only creates once
	        }
	        return instance;
	    }

	    public void log(String message) {
	        System.out.println("[LOG] " + message);
	    }

	public static void main(String[] args) {
		// Try getting logger instance multiple times
		// because getInstance() is a static method — and static methods belong to the class, not an object.
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        logger1.log("This is the first message.");
        logger2.log("This is the second message.");

        if (logger1 == logger2) {
            System.out.println("Both logger instances are the same (Singleton works!).");
        } else {
            System.out.println("Different instances (Singleton failed!).");
        }
	}

}
