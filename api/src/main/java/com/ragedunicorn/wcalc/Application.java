package com.ragedunicorn.wcalc;

import com.ragedunicorn.wcalc.util.ApplicationBinder;
import com.ragedunicorn.wcalc.util.CacheControlFilter;
import com.ragedunicorn.wcalc.util.CorsResponseFilter;
import com.ragedunicorn.wcalc.util.EntityManagerUtility;

import java.lang.management.ManagementFactory;
import javax.management.MBeanServer;

import net.sf.ehcache.CacheException;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.management.ManagementService;

import org.glassfish.jersey.server.ResourceConfig;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Application extends ResourceConfig {
  private static final Logger logger = LoggerFactory.getLogger(Application.class);

  /**
   * Application upstart invocation.
   */
  public Application() {
    logger.info("Upstart of wcalc application");

    new EntityManagerUtility(); // forcing creation of persistence units

    register(new ApplicationBinder());
    register(new CorsResponseFilter());
    register(new CacheControlFilter());
    packages(true, "com.ragedunicorn.wcalc.rest");

    registerEhcache();
  }



  /**
   * Register EhCache to MBeanServer for inspection with e.g. jconsole.
   */
  // todo should only be done for development
  private void registerEhcache() {
    MBeanServer mbeanserver = ManagementFactory.getPlatformMBeanServer();

    CacheManager.ALL_CACHE_MANAGERS.forEach(cacheManager -> {
      if (cacheManager.getName().equals("classic_manager")
        || cacheManager.getName().equals("bc_manager")
        || cacheManager.getName().equals("wotlk_manager")) {
        try {
          ManagementService.registerMBeans(cacheManager, mbeanserver, false, false, false, true);
        } catch (CacheException e) {
          logger.error("Failed to register cacheManager " + cacheManager.getName(), e);
        }
      }
    });
  }
}
