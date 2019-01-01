package com.ragedunicorn.wcalc.util;

import java.util.Enumeration;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebListener
public class ContainerContextClosedHandler implements ServletContextListener {
  private static final Logger logger = LoggerFactory.getLogger(ContainerContextClosedHandler.class);

  @Override
  public void contextInitialized(ServletContextEvent servletContextEvent) {
    logger.info("Servlet context initialized: "
      + servletContextEvent.getServletContext().getServerInfo());
  }

  @Override
  public void contextDestroyed(ServletContextEvent servletContextEvent) {
    logger.info("Servlet context destroyed");

    closeEntityManagerUtility();
    unregisterJdbcDrivers();
  }

  private void closeEntityManagerUtility() {
    logger.debug("Closing EntityManagerUtility");
    EntityManagerUtility.close();
  }

  private void unregisterJdbcDrivers() {
    Enumeration<java.sql.Driver> drivers = java.sql.DriverManager.getDrivers();
    while (drivers.hasMoreElements()) {
      java.sql.Driver driver = drivers.nextElement();
      try {
        java.sql.DriverManager.deregisterDriver(driver);
        logger.info("Deregistering JDBC driver '{}'", driver);
      } catch (Exception e) {
        logger.error("Failed to deregister JDBC driver", e);
      }
    }
  }
}
