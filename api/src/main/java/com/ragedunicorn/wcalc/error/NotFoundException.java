package com.ragedunicorn.wcalc.error;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

public class NotFoundException extends WebApplicationException {
  /**
   * Create an error for not found resource.
   *
   * @param message     An error message
   */
  public NotFoundException(String message) {
    super(Response.status(Response.Status.NOT_FOUND)
      .entity(
        new ExceptionInfo(message)
      )
      .type(MediaType.APPLICATION_JSON)
      .build());
  }
}
