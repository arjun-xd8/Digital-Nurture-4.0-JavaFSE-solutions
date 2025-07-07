
public class Main {

	public static void main(String[] args) {
		// The Decorator Pattern lets you add extra behavior to an object without changing its actual class.
		 // STEP 1: Base Notifier - Email only
        Notifier emailNotifier = new EmailNotifier();

        // STEP 2: Add SMS on top of Email
        Notifier smsNotifier = new SMSNotifierDecorator(emailNotifier);

        // STEP 3: Add Slack on top of SMS + Email
        Notifier allNotifier = new SlackNotifierDecorator(smsNotifier);

        // STEP 4: Send notification through all channels
        allNotifier.send("Server Down!");
	}

}
