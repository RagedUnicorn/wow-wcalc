package com.ragedunicorn.wcalc.util;

import java.io.IOException;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.core.MultivaluedMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class CorsResponseFilter implements ContainerResponseFilter {
  private static final Logger logger = LoggerFactory.getLogger(CorsResponseFilter.class);

  /**
   * CORS filter for intercepting and adding headers.
   *
   * @param requestContext  request context
   * @param responseContext response context
   * @throws IOException if an I/O exception occurs
   */
  @Override
  public void filter(ContainerRequestContext requestContext,
                     ContainerResponseContext responseContext) throws IOException {
    logger.debug("Invoked cors response filter");
    MultivaluedMap<String, Object> headers = responseContext.getHeaders();

    headers.add("Access-Control-Allow-Origin", "*"); // this should be changed
    //headers.add("Access-Control-Allow-Origin", "http://somedomain.com");
    //TODO this should be based on a property making it filterable
    headers.add("Access-Control-Allow-Methods", "GET");
    headers.add("Access-Control-Allow-Headers", "X-Requested-With, Content-Type");
  }
}
