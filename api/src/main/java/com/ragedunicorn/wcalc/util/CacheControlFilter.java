package com.ragedunicorn.wcalc.util;

import java.io.IOException;
import java.lang.annotation.Annotation;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.ext.Provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Provider
public class CacheControlFilter implements ContainerResponseFilter {
  private static final Logger logger = LoggerFactory.getLogger(CacheControlFilter.class);

  /**
   * Cache filter for intercepting and adding cache control headers.
   *
   * @param requestContext  request context
   * @param responseContext response context
   * @throws IOException if an I/O exception occurs
   */
  @Override
  public void filter(ContainerRequestContext requestContext,
                     ContainerResponseContext responseContext) throws IOException {
    logger.debug("Invoked cache-control filter");

    for (Annotation annotation : responseContext.getEntityAnnotations()) {
      if (annotation.annotationType() == CacheControl.class) {
        String value = ((CacheControl) annotation).value();
        responseContext.getHeaders().putSingle(HttpHeaders.CACHE_CONTROL, value);
        break;
      }
    }
  }
}
