package com.ragedunicorn.wcalc;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static io.restassured.RestAssured.given;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;

/**
 * KlassBaseTest class tests for a response where all klasses are returned
 */
@RunWith(Parameterized.class)
public class
KlassBaseTest extends  BaseTest {
  private static final Logger logger = LoggerFactory.getLogger(KlassBaseTest.class);

  private String version;
  private String apiPath = "/klass";

  public KlassBaseTest(String version) {
    this.version = version;
  }

  @Parameterized.Parameters
  public static Object[] data() {
    return new Object[] { "/classic", "/bc", "/wotlk" };
  }

  @Test
  public void BaseSuccessStatusCodeTest() {
    given()
      .when()
      .get(this.version + this.apiPath)
      .then()
      .statusCode(200);
  }

  @Test
  public void BaseFullResponseSuccessStatusCodeTest() {
    given()
      .param("full", "true")
      .when()
      .get(this.version + this.apiPath)
      .then()
      .statusCode(200);
  }

  @Test
  public void BaseFullResponseInvalidParamTest() {
    given()
      .param("full", "invalid")
      .when()
      .get(this.version + this.apiPath)
      .then()
      .statusCode(200);
  }

  @Test
  public void InvalidVersionTest() {
    String invalidVersion = "/invalidVersion";

    given()
      .when()
      .get(invalidVersion + this.apiPath)
      .then()
      .statusCode(404);
  }

  @Test
  public void CacheResponseTest() {
    given()
      .when()
      .get(this.version + this.apiPath)
      .then()
      .header("Cache-Control", "max-age=3600");
  }

  @Test
  public void SchemaValidationTest() {
    given()
      .when()
      .get(this.version + this.apiPath)
      .then()
      .assertThat().body(matchesJsonSchemaInClasspath("schemas/klasses_schema.json"));
  }

  @Test
  public void FullSchemaValidationTest() {
    given()
      .param("full", "true")
      .when()
      .get(this.version + this.apiPath)
      .then()
      .assertThat().body(matchesJsonSchemaInClasspath("schemas/klasses_full_schema.json"));
  }
}
