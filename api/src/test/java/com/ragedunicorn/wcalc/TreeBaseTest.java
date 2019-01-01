package com.ragedunicorn.wcalc;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static io.restassured.RestAssured.given;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;

/**
 * TreeBaseTest class tests for a response where all trees are returned
 */
@RunWith(Parameterized.class)
public class TreeBaseTest extends  BaseTest {
  private static final Logger logger = LoggerFactory.getLogger(TreeBaseTest.class);

  private String version;
  private String apiPath = "/tree";

  public TreeBaseTest(String version) {
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

  /**
   * If the parameter full contains invalid data the api should ignore the parameter and as of this we expect a basic
   * response from the api
   */
  @Test
  public void BaseFullResponseInvalidParamTest() {
    given()
      .param("full", "invalid")
      .when()
      .get(this.version + this.apiPath)
      .then()
      .assertThat().body(matchesJsonSchemaInClasspath("schemas/trees_schema.json"));
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
      .assertThat().body(matchesJsonSchemaInClasspath("schemas/trees_schema.json"));
  }

  @Test
  public void FullSchemaValidationTest() {
    given()
      .param("full", "true")
      .when()
      .get(this.version + this.apiPath)
      .then()
      .assertThat().body(matchesJsonSchemaInClasspath("schemas/trees_full_schema.json"));
  }
}
