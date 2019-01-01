package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.TalentEntity;
import com.ragedunicorn.wcalc.util.EntityManagerUtility;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

import javax.persistence.EntityManager;

public class TalentServiceImpl extends BaseCrudService implements TalentService {
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
  public List<TalentEntity> getAllTalents(Version version) throws CrudServiceException {
    this.version = version;
    return findByNamedQuery("getAllTalents");
  }

  /**
   * Retrieve a specific TalentEntity by its id.
   *
   * @param version Version of the calculator - {@link Version}
   * @param id      Id of a TalentEntity
   * @return A single TalentEntity
   * @throws CrudServiceException Generic CrudException on error
   */
  public TalentEntity getTalentById(Version version, Long id) throws CrudServiceException {
    this.version = version;
    return findById(TalentEntity.class, id);
  }
}
