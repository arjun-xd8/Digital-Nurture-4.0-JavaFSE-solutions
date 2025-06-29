package com.dhananjay;
import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Test;
import org.mockito.Mockito;
public class MyServiceTest {
	@Test
    public void testExternalApi() {
        // Step 1: Create mock
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Step 2: Stub the method
        when(mockApi.getData()).thenReturn("Mock Data");

        // Step 3: Use the mock in the service
        MyService service = new MyService(mockApi);
        String result = service.fetchData();

        // Step 4: Assert the expected output
        assertEquals("Mock Data", result);
    }
	
	@Test
	public void testVerifyInteraction() {
	    // Step 1: Create a mock object
	    ExternalApi mockApi = Mockito.mock(ExternalApi.class);

	    // Step 2: Use mock in service
	    MyService service = new MyService(mockApi);
	    service.fetchData();

	    // Step 3: Verify that getData() was called exactly once
	    verify(mockApi, times(1)).getData();

	}

}
