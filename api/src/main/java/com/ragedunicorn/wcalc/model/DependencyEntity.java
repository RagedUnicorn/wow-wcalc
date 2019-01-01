package com.ragedunicorn.wcalc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.QueryHint;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Immutable;

@NamedQueries({
  @NamedQuery(
    name = "getAllDependencies",
    query = "FROM DependencyEntity",
    hints = {@QueryHint(name = "org.hibernate.cacheable", value = "true")}
  )
})
@Cache(
  usage = CacheConcurrencyStrategy.READ_ONLY,
  region = "wcalc_cache"
)
@Immutable
@Entity
@Table(name = "dependency")
public class DependencyEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "tier_pos", nullable = false)
  private Integer tierPos;

  @Column(name = "talent_pos", nullable = false)
  private Integer talentPos;

  @Column(name = "alignment", nullable = false, length = 30)
  private String alignment;

  @Column(name = "justify", length = 20)
  private String justify;

  @Column(name = "combined", nullable = false)
  private Boolean combined;

  @Column(name = "range", nullable = false)
  private Integer range;

  @Column(name = "dependency", nullable = false)
  private Integer dependency;

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
    return "DependencyEntity{"
      + "id=" + id
      + ", tierPos=" + tierPos
      + ", talentPos=" + talentPos
      + ", alignment='" + alignment + '\''
      + ", justify='" + justify + '\''
      + ", combined=" + combined
      + ", range=" + range
      + ", dependency=" + dependency
      + '}';
  }
}
