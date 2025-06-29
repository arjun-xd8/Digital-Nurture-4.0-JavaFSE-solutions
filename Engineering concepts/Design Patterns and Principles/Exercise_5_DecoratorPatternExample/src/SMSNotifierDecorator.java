public class SMSNotifierDecorator extends NotifierDecorator {
	public SMSNotifierDecorator(Notifier notifier) {
        super(notifier);
    }

    public void send(String message) {
        super.send(message);  // first send email
        System.out.println("Sending SMS: " + message);
    }
}
