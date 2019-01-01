package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.TooltipEntity;
import com.ragedunicorn.wcalc.util.EntityManagerUtility;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

import javax.persistence.EntityManager;

public class TooltipServiceImpl extends BaseCrudService implements TooltipService {
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
   * Retrieve all TooltipEntities.
   *
   * @param version Version of the calculator - {@link Version}
   * @return A list of TooltipEntities (may be empty)
   * @throws CrudServiceException Generic CrudException on error
   */
  public List<TooltipEntity> getAllTooltips(Version version) throws CrudServiceException {
    this.version = version;
    return findByNamedQuery("getAllTooltips");
  }

  /**
   * Retrieve a specific TooltipEntitiy by its id.
   *
   * @param version Version of the calculator - {@link Version}
   * @param id      Id of a TooltipEntity
   * @return A single TooltipEntity
   * @throws CrudServiceException Generic CrudException on error
   */
  public TooltipEntity getTooltipById(Version version, Long id) throws CrudServiceException {
    this.version = version;
    return findById(TooltipEntity.class, id);
  }
}
