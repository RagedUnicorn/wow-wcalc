package com.ragedunicorn.wcalc.error;

public class ExceptionInfo {
  private String message;

  ExceptionInfo(String message) {
    this.message = message;
  }

  public String getMessage() {
    return message;
  }
}
