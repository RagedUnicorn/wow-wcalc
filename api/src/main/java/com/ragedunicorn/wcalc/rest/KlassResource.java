package com.ragedunicorn.wcalc.rest;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.error.NotFoundException;
import com.ragedunicorn.wcalc.error.ServiceException;
import com.ragedunicorn.wcalc.model.Klass;
import com.ragedunicorn.wcalc.model.KlassEntity;
import com.ragedunicorn.wcalc.service.KlassServiceImpl;
import com.ragedunicorn.wcalc.util.CacheControl;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("/{version}/klass")
public class KlassResource {
  private static final Logger logger = LoggerFactory.getLogger(KlassResource.class);

  @Inject
  private KlassServiceImpl klassService;

  /**
   * Retrieve all Klasses.
   *
   * @param version    Version of the calculator - {@link Version}
   * @param fullResult whether relations to other tables should be resolved or not
   * @return A json representation of all Klasses
   */
  @GET
  @CacheControl("max-age=3600")
  @Produces(MediaType.APPLICATION_JSON)
  public List<Klass> getKlasses(
    @PathParam("version") Version version,
    @DefaultValue("false") @QueryParam("full") boolean fullResult
  ) {
    List<KlassEntity> klassEntities;
    List<Klass> klasses;

    try {
      klassEntities = klassService.getAllKlasses(version);

      if (klassEntities == null) {
        throw new NotFoundException("No klasses found");
      }

      klasses = klassEntities.stream()
        .map(klassEntity -> new Klass(klassEntity, fullResult))
        .collect(Collectors.toList());
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving klasses", e);
      throw new ServiceException("General ServiceException while klasses dependencies");
    }

    return klasses;
  }

  /**
   * Retrieve a specific Klass by its id.
   *
   * @param version    Version of the calculator - {@link Version}
   * @param id         Id of a specific Klass
   * @param fullResult whether relations to other tables should be resolved or not
   * @return A json representation of a specific Klass
   */
  @GET
  @CacheControl("max-age=3600")
  @Path("/{id}")
  @Produces(MediaType.APPLICATION_JSON)
  public Klass getKlassById(
    @PathParam("version") Version version,
    @PathParam("id") Long id,
    @DefaultValue("false") @QueryParam("full") boolean fullResult
  ) {
    Klass klass;
    KlassEntity klassEntity;

    try {
      klassEntity = klassService.getKlassById(version, id);

      if (klassEntity == null) {
        throw new NotFoundException(
          String.format("Klass with id: %d not found", id)
        );
      }

      klass = new Klass(klassEntity, fullResult);
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving klass", e);
      throw new ServiceException(
        String.format(
          "General ServiceException while retrieving klass with id: %d", id)
      );
    }

    return klass;
  }
}
