package com.ragedunicorn.wcalc;

import io.restassured.RestAssured;
import org.junit.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.util.Properties;

public class BaseTest {
  private static final Logger logger = LoggerFactory.getLogger(BaseTest.class);

  private Properties properties = new Properties();

  @Before
  public void setup() {
    loadProperties();
    setupRestAssured();
  }

  private void loadProperties() {
    ClassLoader cl = ClassLoader.getSystemClassLoader();

    try (final InputStream stream = cl.getResourceAsStream("wcalc-api.properties")) {
      this.properties.load(stream);
    } catch (Exception e) {
      throw new RuntimeException("Failed to load properties", e);
    }
  }

  private void setupRestAssured() {
    RestAssured.baseURI = properties.getProperty("baseUrl") + properties.getProperty("basePath");
  }
}
