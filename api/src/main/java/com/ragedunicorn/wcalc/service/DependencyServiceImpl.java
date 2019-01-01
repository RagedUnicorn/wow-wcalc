package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.DependencyEntity;
import com.ragedunicorn.wcalc.util.EntityManagerUtility;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

import javax.persistence.EntityManager;

public class DependencyServiceImpl extends BaseCrudService implements DependencyService {
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
   * Retrieve all DependencyEntities.
   *
   * @param version Version of the calculator - {@link Version}
   * @return A list of DependencyEntities (may be empty)
   * @throws CrudServiceException Generic CrudServiceException on error
   */
  public List<DependencyEntity> getAllDependencies(Version version) throws CrudServiceException {
    this.version = version;
    return findByNamedQuery("getAllDependencies");
  }

  /**
   * Retrieve a specific DependencyEntity by its Id.
   *
   * @param version Version of the calculator - {@link Version}
   * @param id      Id of a DependencyEntity
   * @return A single DependencyEntity
   * @throws CrudServiceException Generic CrudServiceException on error
   */
  public DependencyEntity getDependencyById(Version version, Long id) throws CrudServiceException {
    this.version = version;
    return findById(DependencyEntity.class, id);
  }
}
