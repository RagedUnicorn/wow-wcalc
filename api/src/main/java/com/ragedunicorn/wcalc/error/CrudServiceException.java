package com.ragedunicorn.wcalc.error;

public class CrudServiceException extends Exception {
  public CrudServiceException(String message) {
    super(message);
  }

  public CrudServiceException(String message, Throwable throwable) {
    super(message, throwable);
  }
}
