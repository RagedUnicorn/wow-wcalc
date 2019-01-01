package com.ragedunicorn.wcalc.error;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

public class ServiceException extends WebApplicationException {
  /**
   * Create an error for service exceptions.
   *
   * @param message An error message
   */
  public ServiceException(String message) {
    super(Response.status(Response.Status.INTERNAL_SERVER_ERROR)
      .entity(
        new ExceptionInfo(message)
      )
      .type(MediaType.APPLICATION_JSON)
      .build());
  }
}
