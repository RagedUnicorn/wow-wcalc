package com.ragedunicorn.wcalc.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EntityManagerUtility {
  private static final Logger logger = LoggerFactory.getLogger(EntityManagerUtility.class);

  private static final EntityManagerFactory classicEntityFactory;
  private static final EntityManagerFactory bcEntityFactory;
  private static final EntityManagerFactory wotlkEntityFactory;

  private static final String PERSISTENCE_UNIT_NAME_CLASSIC = "com.ragedunicorn.wcalc.classic";
  private static final String PERSISTENCE_UNIT_NAME_BC = "com.ragedunicorn.wcalc.bc";
  private static final String PERSISTENCE_UNIT_NAME_WOTLK = "com.ragedunicorn.wcalc.wotlk";

  static {
    try {
      classicEntityFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME_CLASSIC);
    } catch (Exception e) {
      logger.error("Failed to initialize entityfactory for classic", e);
      throw new RuntimeException("Failed to initialize entityfactory for classic", e);
    }
  }

  static {
    try {
      bcEntityFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME_BC);
    } catch (Exception e) {
      logger.error("Failed to initialize entityfactory for bc", e);
      throw new RuntimeException("Failed to initialize entityfactory for bc", e);
    }
  }

  static {
    try {
      wotlkEntityFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME_WOTLK);
    } catch (Exception e) {
      logger.error("Failed to initialize entityfactory for wotlk", e);
      throw new RuntimeException("Failed to initialize entityfactory for wotlk", e);
    }
  }

  /**
   * Get the correct Entitymanager based on a specific {@link Version}.
   *
   * @param version Version of the calculator - {@link Version}
   * @return An Entitymanager
   */
  public static EntityManager getEntityManager(Version version) {
    switch (version) {
      case classic:
        return getClassicEntityManager();
      case bc:
        return getBcEntityManager();
      case wotlk:
        return getWotlkEntityManager();
      default:
        logger.warn(String.format(
          "Did not find an Entitymanager with name %s - using default Entitymanager", version));
        return getClassicEntityManager();
    }
  }

  private static EntityManager getClassicEntityManager() {
    return classicEntityFactory.createEntityManager();
  }

  private static EntityManager getBcEntityManager() {
    return bcEntityFactory.createEntityManager();
  }

  private static EntityManager getWotlkEntityManager() {
    return wotlkEntityFactory.createEntityManager();
  }

  /**
   * Closing all factories.
   */
  static void close() {
    classicEntityFactory.close();
    bcEntityFactory.close();
    wotlkEntityFactory.close();
  }
}
