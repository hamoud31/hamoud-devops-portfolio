package com.mycompany.app;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class AppTest {

    @Test
    public void testHttpServerResponse() throws Exception {
        // Start the server in a background thread
        new Thread(() -> {
            try {
                App.main(new String[]{});
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();

        // Wait briefly for server to start
        Thread.sleep(1000);

        // Call the HTTP endpoint
        URL url = new URL("http://localhost:8080/");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        Scanner sc = new Scanner(conn.getInputStream());
        String response = sc.nextLine();
        sc.close();

        // Assert the response
        assertEquals("Hello World!", response);
    }
}

