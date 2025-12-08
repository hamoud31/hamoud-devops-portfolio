package com.mycompany.app;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class AppTest {

    @Test
    public void testAppConstructor() {
        // Just create two instances to cover constructor
        App app1 = new App();
        App app2 = new App();
        assertNotNull(app1);
        assertNotNull(app2);
    }

    @Test
    public void testAppMessage() {
        // Cover getMessage() logic
        App app = new App();
        assertEquals("Hello World!", app.getMessage());
    }
}

