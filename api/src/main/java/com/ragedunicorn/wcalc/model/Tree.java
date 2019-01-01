package com.ragedunicorn.wcalc.model;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;
import java.util.stream.Collectors;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Tree {
  private Long id;

  private String treeName;

  private Integer treePos;

  private List<Talent> talents;

  private List<Dependency> dependencies;

  /**
   * Create a new Object of Tree based in a TreeEntity.
   *
   * @param treeEntity A TreeEntity that should get converted to a Tree
   */
  public Tree(TreeEntity treeEntity) {
    this.id = treeEntity.getId();
    this.treePos = treeEntity.getTreePos();
    this.treeName = treeEntity.getTreeName();
  }

  /**
   * Create a new Object of Tree based in a TreeEntity.
   *
   * @param treeEntity A TreeEntity that should get converted to a Tree
   * @param fullResult Whether relations to other tables should be resolved or not
   */
  public Tree(TreeEntity treeEntity, boolean fullResult) {
    this.id = treeEntity.getId();
    this.treePos = treeEntity.getTreePos();
    this.treeName = treeEntity.getTreeName();

    if (fullResult) {
      this.talents = treeEntity.getTalentEntities().stream()
        .map(talent -> new Talent(talent, true))
        .collect(Collectors.toList());
      this.dependencies = treeEntity.getDependencyEntities().stream()
        .map(Dependency::new)
        .collect(Collectors.toList());
    }
  }

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

  public List<Talent> getTalents() {
    return talents;
  }

  public void setTalents(List<Talent> talents) {
    this.talents = talents;
  }

  public List<Dependency> getDependencies() {
    return dependencies;
  }

  public void setDependencies(List<Dependency> dependencies) {
    this.dependencies = dependencies;
  }

  @Override
  public String toString() {
    return "Tree{"
      + "id=" + id
      + ", treeName='" + treeName + '\''
      + ", treePos=" + treePos
      + ", talents=" + talents
      + ", dependencies=" + dependencies
      + '}';
  }
}
