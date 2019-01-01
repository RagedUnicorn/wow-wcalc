package com.ragedunicorn.wcalc.model;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Dependency {
  private Long id;

  private Integer tierPos;

  private Integer talentPos;

  private String alignment;

  private String justify;

  private Boolean combined;

  private String idName;

  private Integer range;

  private Integer dependency;

  /**
   * Create a new Object of Dependency based in a DependencyEntity.
   *
   * @param dependencyEntity A DependencyEntity that should get converted to a Dependency
   */
  public Dependency(DependencyEntity dependencyEntity) {
    this.id = dependencyEntity.getId();
    this.tierPos = dependencyEntity.getTierPos();
    this.talentPos = dependencyEntity.getTalentPos();
    this.alignment = dependencyEntity.getAlignment();
    this.justify = dependencyEntity.getJustify();
    this.combined = dependencyEntity.getCombined();
    this.range = dependencyEntity.getRange();
    this.dependency = dependencyEntity.getDependency();
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Integer getTierPos() {
    return tierPos;
  }

  public void setTierPos(Integer tierPos) {
    this.tierPos = tierPos;
  }

  public Integer getTalentPos() {
    return talentPos;
  }

  public void setTalentPos(Integer talentPos) {
    this.talentPos = talentPos;
  }

  public String getAlignment() {
    return alignment;
  }

  public void setAlignment(String alignment) {
    this.alignment = alignment;
  }

  public String getJustify() {
    return justify;
  }

  public void setJustify(String justify) {
    this.justify = justify;
  }

  public Boolean getCombined() {
    return combined;
  }

  public void setCombined(Boolean combined) {
    this.combined = combined;
  }

  public String getIdName() {
    return idName;
  }

  public void setIdName(String idName) {
    this.idName = idName;
  }

  public Integer getRange() {
    return range;
  }

  public void setRange(Integer range) {
    this.range = range;
  }

  public Integer getDependency() {
    return dependency;
  }

  public void setDependency(Integer dependency) {
    this.dependency = dependency;
  }

  @Override
  public String toString() {
    return "Dependency{"
      + "id=" + id
      + ", tierPos=" + tierPos
      + ", talentPos=" + talentPos
      + ", alignment='" + alignment + '\''
      + ", justify='" + justify + '\''
      + ", combined=" + combined
      + ", idName='" + idName + '\''
      + ", range=" + range
      + ", dependency=" + dependency
      + '}';
  }
}
