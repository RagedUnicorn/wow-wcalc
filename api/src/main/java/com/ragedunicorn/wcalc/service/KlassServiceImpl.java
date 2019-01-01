package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.KlassEntity;
import com.ragedunicorn.wcalc.util.EntityManagerUtility;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;
import javax.persistence.EntityManager;

public class KlassServiceImpl extends BaseCrudService implements KlassService {
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
   * Retrieve all KlassEntities.
   *
   * @param version Version of the calculator - {@link Version}
   * @return A list of KlassEntities (may be empty)
   * @throws CrudServiceException Generic CrudException on error
   */
  public List<KlassEntity> getAllKlasses(Version version) throws CrudServiceException {
    this.version = version;
    return findByNamedQuery("getAllKlasses");
  }

  /**
   * Retrieve a specific KlassEntity by its id.
   *
   * @param version Version of the calculator - {@link Version}
   * @param id      Id of a KlassEntity
   * @return A single KlassEntity
   * @throws CrudServiceException Generic CrudException on error
   */
  public KlassEntity getKlassById(Version version, Long id) throws CrudServiceException {
    this.version = version;
    return findById(KlassEntity.class, id);
  }
}
