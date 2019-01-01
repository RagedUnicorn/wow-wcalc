package com.ragedunicorn.wcalc.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Immutable;

@NamedQueries({
  @NamedQuery(
    name = "getAllTooltips",
    query = "From TooltipEntity"
  )
})
@Cache(
  usage = CacheConcurrencyStrategy.READ_ONLY,
  region = "wcalc_cache"
)
@Immutable
@Entity
@Table(name = "tooltip")
public class TooltipEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "locale", length = 3)
  private String locale;

  @Column(name = "rank_1", length = 1000)
  private String rank1;

  @Column(name = "rank_2", length = 1000)
  private String rank2;

  @Column(name = "rank_3", length = 1000)
  private String rank3;

  @Column(name = "rank_4", length = 1000)
  private String rank4;

  @OneToOne(
    fetch = FetchType.EAGER,
    cascade = CascadeType.ALL,
    orphanRemoval = true
  )
  @JoinColumn(name = "talent_id")
  private TalentEntity talentEntity;

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

  public TalentEntity getTalentEntity() {
    return talentEntity;
  }

  public void setTalentEntity(TalentEntity talentEntity) {
    this.talentEntity = talentEntity;
  }

  @Override
  public String toString() {
    return "TooltipEntity{"
      + "id=" + id
      + ", locale='" + locale + '\''
      + ", rank1='" + rank1 + '\''
      + ", rank2='" + rank2 + '\''
      + ", rank3='" + rank3 + '\''
      + ", rank4='" + rank4 + '\''
      + ", talentEntity=" + talentEntity
      + '}';
  }
}
