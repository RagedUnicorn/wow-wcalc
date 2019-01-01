package com.ragedunicorn.wcalc.rest;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.error.NotFoundException;
import com.ragedunicorn.wcalc.error.ServiceException;
import com.ragedunicorn.wcalc.model.Dependency;
import com.ragedunicorn.wcalc.model.DependencyEntity;
import com.ragedunicorn.wcalc.service.DependencyServiceImpl;
import com.ragedunicorn.wcalc.util.CacheControl;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.commons.collections4.CollectionUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Path("/{version}/dependency")
public class DependencyResource {
  private static final Logger logger = LoggerFactory.getLogger(DependencyResource.class);

  @Inject
  private DependencyServiceImpl dependencyService;

  /**
   * Retrieve all Dependencies.
   *
   * @param version Version of the calculator - {@link Version}
   * @return A json representation of all Dependencies
   */
  @GET
  @CacheControl("max-age=3600")
  @Produces(MediaType.APPLICATION_JSON)
  public List<Dependency> getDependencies(
    @PathParam("version") Version version
  ) {
    List<Dependency> dependencies;

    try {
      List<DependencyEntity> dependencyEntities = dependencyService.getAllDependencies(version);

      if (CollectionUtils.isEmpty(dependencyEntities)) {
        throw new NotFoundException("No dependencies found");
      }

      dependencies = dependencyEntities.stream()
        .map(Dependency::new)
        .collect(Collectors.toList());
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving dependencies", e);
      throw new ServiceException("General ServiceException while retrieving dependencies");
    }

    return dependencies;
  }

  /**
   * Retrieve specific Dependency by its id.
   *
   * @param version Version of the calculator - {@link Version}
   * @param id      Id of a specific Dependency
   * @return A json representation of a specific Dependency
   */
  @GET
  @CacheControl("max-age=3600")
  @Path("/{id}")
  @Produces(MediaType.APPLICATION_JSON)
  public Dependency getDependencyById(
    @PathParam("version") Version version,
    @PathParam("id") Long id
  ) {
    DependencyEntity dependencyEntity;

    try {
      dependencyEntity = dependencyService.getDependencyById(version, id);
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving dependency", e);
      throw new ServiceException(
        String.format(
          "General ServiceException while retrieving dependency with id: %d", id)
      );
    }

    if (dependencyEntity == null) {
      throw new NotFoundException(
        String.format("Dependency with id: %d not found", id)
      );
    }

    return new Dependency((dependencyEntity));
  }
}
