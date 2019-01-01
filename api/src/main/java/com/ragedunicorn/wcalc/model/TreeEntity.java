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
    name = "getAllTrees",
    query = "FROM TreeEntity"
  )
})
@Cache(
  usage = CacheConcurrencyStrategy.READ_ONLY,
  region = "wcalc_cache"
)
@Immutable
@Entity
@Table(name = "tree")
public class TreeEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "tree_name", nullable = false, length = 20)
  private String treeName;

  @Column(name = "tree_pos", nullable = false)
  private Integer treePos;

  @OneToMany(
    fetch = FetchType.EAGER,
    cascade = CascadeType.ALL,
    orphanRemoval = true
  )
  @JoinColumn(name = "tree_id")
  private Set<TalentEntity> talentEntities = new HashSet<>();

  @OneToMany(
    fetch = FetchType.EAGER,
    cascade = CascadeType.ALL,
    orphanRemoval = true
  )
  @JoinColumn(name = "tree_id")
  private Set<DependencyEntity> dependencyEntities = new HashSet<>();

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTreeName() {
    return treeName;
  }

  public void setTreeName(String treeName) {
    this.treeName = treeName;
  }

  public Integer getTreePos() {
    return treePos;
  }

  public void setTreePos(Integer treePos) {
    this.treePos = treePos;
  }

  public Set<TalentEntity> getTalentEntities() {
    return talentEntities;
  }

  public void setTalentEntities(Set<TalentEntity> talentEntities) {
    this.talentEntities = talentEntities;
  }

  public Set<DependencyEntity> getDependencyEntities() {
    return dependencyEntities;
  }

  public void setDependencyEntities(Set<DependencyEntity> dependencyEntities) {
    this.dependencyEntities = dependencyEntities;
  }

  @Override
  public String toString() {
    return "TreeEntity{"
      + "id=" + id
      + ", treeName='" + treeName + '\''
      + ", treePos=" + treePos
      + ", talentEntities=" + talentEntities
      + ", dependencyEntities=" + dependencyEntities
      + '}';
  }
}
