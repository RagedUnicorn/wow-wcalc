package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.TreeEntity;
import com.ragedunicorn.wcalc.util.EntityManagerUtility;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

import javax.persistence.EntityManager;

public class TreeServiceImpl extends BaseCrudService implements TreeService {
  private Version version;

  private EntityManager entityManager;

  @Override
  public EntityManager getEntityManager() {
    entityManager = EntityManagerUtility.getEntityManager(version);
    return entityManager;
  }

  @Override
  public void closeEntityManager() {
    if (entityManager.isOpen()) {
      entityManager.close();
    }
  }

  /**
   * Retrieve all TalentEntities.
   *
   * @param version Version of the calculator - {@link Version}
   * @return A list of TalentEntities (may be empty)
   * @throws CrudServiceException Generic CrudException on error
   */
  public List<TreeEntity> getAllTrees(Version version) throws CrudServiceException {
    this.version = version;
    return findByNamedQuery("getAllTrees");
  }

  /**
   * Retrieve a specific TreeEntity by its id.
   *
   * @param version Version of the calculator - {@link Version}
   * @param id      Id of a TreeEntity
   * @return A single TreeEntity
   * @throws CrudServiceException Generic CrudException on error
   */
  public TreeEntity getTreeById(Version version, Long id) throws CrudServiceException {
    this.version = version;
    return findById(TreeEntity.class, id);
  }
}
