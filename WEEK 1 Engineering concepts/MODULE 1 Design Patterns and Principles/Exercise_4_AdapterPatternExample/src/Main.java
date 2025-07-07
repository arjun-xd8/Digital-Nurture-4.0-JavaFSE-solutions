public class Main {

	public static void main(String[] args) {
		/*
		 * Adapter Pattern
		 You have a class like PayPalGateway.makePayment()
		 But your app expects processPayment()
		 So, you write an adapter that translates processPayment() → makePayment()
		 */
		
        // Using PayPal
        PayPalGateway paypal = new PayPalGateway();
        PaymentProcessor paypalProcessor = new PayPalAdapter(paypal);
        paypalProcessor.processPayment(1500);

        // Using Stripe
        StripeGateway stripe = new StripeGateway();
        PaymentProcessor stripeProcessor = new StripeAdapter(stripe);
        stripeProcessor.processPayment(3000);
	}

}
