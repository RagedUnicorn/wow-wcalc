package com.ragedunicorn.wcalc.model;

import java.util.HashSet;
import java.util.Set;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Immutable;

@NamedQueries({
  @NamedQuery(
    name = "getAllKlasses",
    query = "FROM KlassEntity"
  )
})
@Cache(
  usage = CacheConcurrencyStrategy.READ_ONLY,
  region = "wcalc_cache"
)
@Immutable
@Entity
@Table(name = "class")
public class KlassEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "class_name")
  private String klassName;

  @OneToMany(
    fetch = FetchType.EAGER,
    cascade = CascadeType.ALL,
    orphanRemoval = true
  )
  @JoinColumn(name = "class_id")
  private Set<TreeEntity> treeEntities = new HashSet<>();

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getKlassName() {
    return klassName;
  }

  public void setKlassName(String klassName) {
    this.klassName = klassName;
  }

  public Set<TreeEntity> getTreeEntities() {
    return treeEntities;
  }

  @Override
  public String toString() {
    return "KlassEntity{"
      + "id=" + id
      + ", klassName='" + klassName + '\''
      + ", treeEntities=" + treeEntities
      + '}';
  }
}
