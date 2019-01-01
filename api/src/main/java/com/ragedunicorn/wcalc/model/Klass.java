package com.ragedunicorn.wcalc.model;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;
import java.util.stream.Collectors;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Klass {
  private Long id;

  private String klassName;

  private List<Tree> treeList;

  /**
   * Create a new Object of Klass based on a KlassEntity.
   *
   * @param klassEntity A KlassEntity that should get converted to a Klass
   */
  public Klass(KlassEntity klassEntity) {
    this.id = klassEntity.getId();
    this.klassName = klassEntity.getKlassName();
  }

  /**
   * Create a new Object of Klass based on an KlassEntity.
   *
   * @param klassEntity A KlassEntity that should get converted to a Klass
   * @param fullResult  Whether relations to other tables should be resolved or not
   */
  public Klass(KlassEntity klassEntity, boolean fullResult) {
    this.id = klassEntity.getId();
    this.klassName = klassEntity.getKlassName();

    if (fullResult) {
      this.treeList = klassEntity.getTreeEntities().stream()
        .map(treeEntity -> new Tree(treeEntity, true))
        .collect(Collectors.toList());
    }
  }

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

  public List<Tree> getTreeList() {
    return treeList;
  }

  public void setTreeList(List<Tree> treeList) {
    this.treeList = treeList;
  }

  @Override
  public String toString() {
    return "Klass{"
      + "id=" + id
      + ", klassName='" + klassName + '\''
      + ", treeList=" + treeList
      + '}';
  }
}
