package com.ragedunicorn.wcalc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Immutable;

@NamedQueries({
  @NamedQuery(
    name = "getAllTalents",
    query = "From TalentEntity"
  )
})
@Cache(
  usage = CacheConcurrencyStrategy.READ_ONLY,
  region = "wcalc_cache"
)
@Immutable
@Entity
@Table(name = "talent")
public class TalentEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "talent_name", nullable = false, length = 80)
  private String talentName;

  @Column(name = "icon", nullable = false, length = 60)
  private String icon;

  @Column(name = "tier_pos", nullable = false)
  private Integer tierPos;

  @Column(name = "talent_pos", nullable = false)
  private Integer talentPos;

  @Column(name = "max_points", nullable = false)
  private Integer maxPoints;

  @Column(name = "dependency")
  private Integer dependency;

  @OneToOne(mappedBy = "talentEntity", optional = false)
  private TooltipEntity tooltipEntity;

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

  public TooltipEntity getTooltipEntity() {
    return tooltipEntity;
  }

  public void setTooltipEntity(TooltipEntity tooltipEntity) {
    this.tooltipEntity = tooltipEntity;
  }

  @Override
  public String toString() {
    return "TalentEntity{"
      + "id=" + id
      + ", talentName='" + talentName + '\''
      + ", icon='" + icon + '\''
      + ", tierPos=" + tierPos
      + ", talentPos=" + talentPos
      + ", maxPoints=" + maxPoints
      + ", dependency=" + dependency
      + ", tooltipEntity=" + tooltipEntity
      + '}';
  }
}
