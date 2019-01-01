package com.ragedunicorn.wcalc.util;

public enum Version {
  classic,
  bc,
  wotlk;

  /**
   * This method is specifically used by jersey to resolve the version pathparam in an url.
   *
   * @param version Versionname to retrieve
   * @return the value of the matching element
   */
  public static Version fromString(final String version) {
    return Version.valueOf(version);
  }
}
