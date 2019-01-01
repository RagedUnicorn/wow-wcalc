package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.apache.commons.collections4.CollectionUtils;

public abstract class BaseCrudService {
  public abstract EntityManager getEntityManager();

  public abstract void closeEntityManager();

  /**
   * Saves an Entity.
   *
   * @param t Entity to be saved
   * @return The saved Entity
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> T save(T t) throws CrudServiceException {
    try {
      getEntityManager().persist(t);
      return t;
    } catch (Exception e) {
      throw new CrudServiceException(e.getMessage(), e);
    } finally {
      closeEntityManager();
    }
  }

  /**
   * Saves a list of entities.
   *
   * @param t List of entities to be saved
   * @return List of entities saved
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> List<T> save(List<T> t) throws CrudServiceException {
    try {
      if (CollectionUtils.isNotEmpty(t)) {
        for (T o : t) {
          getEntityManager().persist(o);
        }
      } else {
        throw new CrudServiceException("List of entities to save was empty!");
      }
      return t;
    } catch (Exception e) {
      throw new CrudServiceException(e.getMessage(), e);
    } finally {
      closeEntityManager();
    }
  }

  /**
   * Updates an Entity.
   *
   * @param t the Entity to be updated
   * @return The updated Entity
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> T update(T t) throws CrudServiceException {
    try {
      return getEntityManager().merge(t);
    } catch (Exception e) {
      throw new CrudServiceException(e.getMessage(), e);
    } finally {
      closeEntityManager();
    }
  }

  /**
   * Updates all Entities in Collection.
   *
   * @param t The Entity to be updated
   * @return The updated Entity
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> Collection<T> update(List<T> t) throws CrudServiceException {
    try {
      if (CollectionUtils.isNotEmpty(t)) {
        for (int i = 0; i < t.size(); i++) {
          T updated = getEntityManager().merge(t.get(i));
          t.set(i, updated);
        }
      } else {
        throw new CrudServiceException("List of entities to update was empty!");
      }
      return t;
    } catch (Exception e) {
      throw new CrudServiceException(e.getMessage(), e);
    } finally {
      closeEntityManager();
    }
  }

  /**
   * Deletes an Entity.
   *
   * @param t The Entity to be deleted
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> void delete(T t) throws CrudServiceException {
    try {
      T temp = getEntityManager().merge(t);
      getEntityManager().remove(temp);
    } catch (Exception e) {
      throw new CrudServiceException(e.getMessage(), e);
    } finally {
      closeEntityManager();
    }
  }

  /**
   * Deletes all Entities in the List.
   *
   * @param t The Entity to be deleted
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> void delete(List<T> t) throws CrudServiceException {
    try {
      if (CollectionUtils.isNotEmpty(t)) {
        for (T o : t) {
          T temp = getEntityManager().merge(o);
          getEntityManager().remove(temp);
        }
      } else {
        throw new CrudServiceException("List of entities to delete is empty!");
      }
    } catch (Exception e) {
      throw new CrudServiceException(e.getMessage(), e);
    } finally {
      closeEntityManager();
    }
  }

  /**
   * Finds an model by Class and ID.
   *
   * @param clazz Class of the Entity
   * @param id    ID of the Entity
   * @return The found Entity or Null if none was found
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> T findById(Class<T> clazz, Object id) throws CrudServiceException {
    try {
      return getEntityManager().find(clazz, id);
    } catch (Exception e) {
      throw new CrudServiceException(e.getMessage(), e);
    } finally {
      closeEntityManager();
    }
  }

  /**
   * Finds a list of entities by a {@link javax.persistence.NamedQuery}.
   *
   * @param name The name of the {@link javax.persistence.NamedQuery}
   * @return List of the found entities (may be empty)
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> List<T> findByNamedQuery(String name) throws CrudServiceException {
    return findByNamedQuery(name, null, null);
  }

  /**
   * Finds a list of entities by a {@link javax.persistence.NamedQuery} with params.
   *
   * @param name    The name of the {@link javax.persistence.NamedQuery}
   * @param maxRows Max number of results
   * @return List of the found entities (may be empty).
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> List<T> findByNamedQuery(String name, Integer maxRows) throws CrudServiceException {
    return findByNamedQuery(name, null, maxRows);
  }

  /**
   * Finds a list of entities by a {@link javax.persistence.NamedQuery} with params.
   *
   * @param name   The name of the {@link javax.persistence.NamedQuery}
   * @param params Map of params
   * @return List of the found entities (may be empty)
   * @throws CrudServiceException Generic CrudException on error
   */
  public <T> List<T> findByNamedQuery(String name, Map<String, Object> params)
      throws CrudServiceException {
    return findByNamedQuery(name, params, null);
  }

  /**
   * Finds a list of entities by a {@link javax.persistence.NamedQuery} with params and pagination.
   *
   * @param name    The name of the {@link javax.persistence.NamedQuery}
   * @param params  Map of params
   * @param maxRows Maximum amount of rows to return
   * @return List of the found entities (may be empty)
   * @throws CrudServiceException Generic CrudException on error
   */
  @SuppressWarnings("unchecked")
  public <T> List<T> findByNamedQuery(String name, Map<String, Object> params, Integer maxRows)
      throws CrudServiceException {
    try {
      Query query = getEntityManager().createNamedQuery(name);

      if (params != null) {
        for (Map.Entry<String, Object> entry : params.entrySet()) {
          query.setParameter(entry.getKey(), entry.getValue());
        }
      }

      if (maxRows != null) {
        query.setMaxResults(maxRows);
      }

      return query.getResultList();
    } catch (Exception e) {
      throw new CrudServiceException(e.getMessage(), e);
    } finally {
      closeEntityManager();
    }
  }
}
