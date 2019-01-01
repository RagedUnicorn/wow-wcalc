package com.ragedunicorn.wcalc;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static io.restassured.RestAssured.given;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;

/**
 * DependencySpecificTest class tests for a response where a specific dependency is returned
 */
@RunWith(Parameterized.class)
public class DependencySpecificTest extends BaseTest {
  private static final Logger logger = LoggerFactory.getLogger(DependencySpecificTest.class);

  private String version;
  private String apiPath = "/dependency";

  public DependencySpecificTest(String version) {
    this.version = version;
  }

  @Parameterized.Parameters
  public static Object[] data() {
    return new Object[] { "/classic", "/bc", "/wotlk" };
  }

  @Test
  public void BaseSuccessStatusCodeTest() {
    String id = "/1";

    given()
      .when()
      .get(this.version + this.apiPath + id)
      .then()
      .statusCode(200);
  }

  @Test
  public void InvalidVersionTest() {
    String id = "/1";
    String invalidVersion = "/somestring";

    given()
      .when()
      .get(invalidVersion + this.apiPath + id)
      .then()
      .statusCode(404);
  }

  @Test
  public void InvalidIdParameter() {
    String id = "/notanumber";

    given()
      .when()
      .get(this.version + this.apiPath + id)
      .then()
      .statusCode(404);
  }

  @Test
  public void CacheResponseTest() {
    String id = "/1";

    given()
      .when()
      .get(this.version + this.apiPath + id)
      .then()
      .header("Cache-Control", "max-age=3600");
  }

  @Test
  public void SchemaValidationTest() {
    String id = "/1";

    given()
      .when()
      .get(this.version + this.apiPath + id)
      .then()
      .assertThat().body(matchesJsonSchemaInClasspath("schemas/dependency_schema.json"));
  }
}
