package com.ragedunicorn.wcalc.model;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Tooltip {
  private Long id;

  private String locale;

  private String rank1;

  private String rank2;

  private String rank3;

  private String rank4;

  /**
   * Create a new Object of Tooltip based in a TooltipEntity.
   *
   * @param tooltipEntity A TooltipEntity that should get converted to a Tooltip
   */
  public Tooltip(TooltipEntity tooltipEntity) {
    this.id = tooltipEntity.getId();
    this.locale = tooltipEntity.getLocale();
    this.rank1 = tooltipEntity.getRank1();
    this.rank2 = tooltipEntity.getRank2();
    this.rank3 = tooltipEntity.getRank3();
    this.rank4 = tooltipEntity.getRank4();
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getLocale() {
    return locale;
  }

  public void setLocale(String locale) {
    this.locale = locale;
  }

  public String getRank1() {
    return rank1;
  }

  public void setRank1(String rank1) {
    this.rank1 = rank1;
  }

  public String getRank2() {
    return rank2;
  }

  public void setRank2(String rank2) {
    this.rank2 = rank2;
  }

  public String getRank3() {
    return rank3;
  }

  public void setRank3(String rank3) {
    this.rank3 = rank3;
  }

  public String getRank4() {
    return rank4;
  }

  public void setRank4(String rank4) {
    this.rank4 = rank4;
  }

  @Override
  public String toString() {
    return "Tooltip{"
      + "id=" + id
      + ", locale='" + locale + '\''
      + ", rank1='" + rank1 + '\''
      + ", rank2='" + rank2 + '\''
      + ", rank3='" + rank3 + '\''
      + ", rank4='" + rank4 + '\''
      + '}';
  }
}
