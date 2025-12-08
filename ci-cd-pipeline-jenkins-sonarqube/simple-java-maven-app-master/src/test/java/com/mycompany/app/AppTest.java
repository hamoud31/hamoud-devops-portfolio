package com.mycompany.app;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class AppTest {

    @Test
    public void testAppMessage() {
        // Simply create an instance of App
        App app = new App();
        // Call getMessage() to cover code
        assertEquals("Hello World!", app.getMessage());
    }
}

