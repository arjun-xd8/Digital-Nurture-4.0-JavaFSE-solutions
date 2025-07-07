package com.dhananjay;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalculatorTest {
	
	private Calculator calculator;
	
	@Before
	public void setUp() throws Exception {
		 calculator = new Calculator();
		 System.out.println("Setting up Calculator instance.");
	}
	
	 @After
	 public void tearDown() {
	     calculator = null;
	     System.out.println("Tearing down Calculator instance.");
	 }

	@Test
	public void testAdd() {
		int result = calculator.add(10, 5);
		assertEquals(15, result);
	}
	
	 @Test
	 public void testSubtract() {
	     int result = calculator.subtract(10, 4);
	     assertEquals(6, result);
	 }

}
