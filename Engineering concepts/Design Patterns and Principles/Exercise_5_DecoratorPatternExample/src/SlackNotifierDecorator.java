public class SlackNotifierDecorator extends NotifierDecorator{
	 public SlackNotifierDecorator(Notifier notifier) {
	        super(notifier);
	    }

	    public void send(String message) {
	        super.send(message); // first send previous notifications
	        System.out.println("Sending Slack message: " + message);
	    }
}
