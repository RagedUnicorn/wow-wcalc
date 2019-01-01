package com.ragedunicorn.wcalc.model;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Talent {
  private Long id;

  private String talentName;

  private String icon;

  private Integer tierPos;

  private Integer talentPos;

  private Integer maxPoints;

  private Integer dependency;

  private Tooltip tooltip;

  /**
   * Create a new Object of Talent based in a TalentEntity.
   *
   * @param talentEntity A TalentEntity that should get converted to a Talent
   */
  public Talent(TalentEntity talentEntity) {
    this.id = talentEntity.getId();
    this.talentName = talentEntity.getTalentName();
    this.icon = talentEntity.getIcon();
    this.tierPos = talentEntity.getTierPos();
    this.talentPos = talentEntity.getTalentPos();
    this.maxPoints = talentEntity.getMaxPoints();
    this.dependency = talentEntity.getDependency();
  }

  /**
   * Create a new Object of Talent based in a TalentEntity.
   *
   * @param talentEntity A TalentEntity that should get converted to a Talent
   * @param fullResult   Whether relations to other tables should be resolved or not
   */
  public Talent(TalentEntity talentEntity, boolean fullResult) {
    this.id = talentEntity.getId();
    this.talentName = talentEntity.getTalentName();
    this.icon = talentEntity.getIcon();
    this.tierPos = talentEntity.getTierPos();
    this.talentPos = talentEntity.getTalentPos();
    this.maxPoints = talentEntity.getMaxPoints();
    this.dependency = talentEntity.getDependency();

    if (fullResult) {
      this.tooltip = new Tooltip(talentEntity.getTooltipEntity());
    }
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTalentName() {
    return talentName;
  }

  public void setTalentName(String talentName) {
    this.talentName = talentName;
  }

  public String getIcon() {
    return icon;
  }

  public void setIcon(String icon) {
    this.icon = icon;
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

  public Integer getMaxPoints() {
    return maxPoints;
  }

  public void setMaxPoints(Integer maxPoints) {
    this.maxPoints = maxPoints;
  }

  public Integer getDependency() {
    return dependency;
  }

  public void setDependency(Integer dependency) {
    this.dependency = dependency;
  }

  public Tooltip getTooltip() {
    return tooltip;
  }

  public void setTooltip(Tooltip tooltip) {
    this.tooltip = tooltip;
  }

  @Override
  public String toString() {
    return "Talent{"
      + "id=" + id
      + ", talentName='" + talentName + '\''
      + ", icon='" + icon + '\''
      + ", tierPos=" + tierPos
      + ", talentPos=" + talentPos
      + ", maxPoints=" + maxPoints
      + ", dependency=" + dependency
      + ", tooltip=" + tooltip
      + '}';
  }
}
