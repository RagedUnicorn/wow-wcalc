package com.ragedunicorn.wcalc;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static io.restassured.RestAssured.given;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;

/**
 * TooltipBaseTest class tests for a response where all tooltips are returned
 */
@RunWith(Parameterized.class)
public class TooltipBaseTest extends  BaseTest {
  private static final Logger logger = LoggerFactory.getLogger(TooltipBaseTest.class);

  private String version;
  private String apiPath = "/tooltip";

  public TooltipBaseTest(String version) {
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
      .assertThat().body(matchesJsonSchemaInClasspath("schemas/tooltips_schema.json"));
  }
}
