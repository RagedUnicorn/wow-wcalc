package com.ragedunicorn.wcalc.rest;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.error.NotFoundException;
import com.ragedunicorn.wcalc.error.ServiceException;
import com.ragedunicorn.wcalc.model.Talent;
import com.ragedunicorn.wcalc.model.TalentEntity;
import com.ragedunicorn.wcalc.model.Tooltip;
import com.ragedunicorn.wcalc.service.TalentServiceImpl;
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

import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("/{version}/talent")
public class TalentResource {
  private static final Logger logger = LoggerFactory.getLogger(TalentResource.class);

  @Inject
  private TalentServiceImpl talentService;

  /**
   * Retrieve all Talents.
   *
   * @param version Version of the calculator - {@link Version}
   * @param fullResult whether relations to other tables should be resolved or not
   * @return A json representation of all Talents
   */
  @GET
  @CacheControl("max-age=3600")
  @Produces(MediaType.APPLICATION_JSON)
  public List<Talent> getTalents(
    @PathParam("version") Version version,
    @DefaultValue("false") @QueryParam("full") boolean fullResult
  ) {
    List<TalentEntity> talentEntities;
    List<Talent> talents;

    try {
      talentEntities = talentService.getAllTalents(version);

      if (CollectionUtils.isEmpty(talentEntities)) {
        throw new NotFoundException("No talents found");
      }

      talents = talentEntities.stream()
        .map(talentEntity -> new Talent(talentEntity, fullResult))
        .collect(Collectors.toList());
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving talents", e);
      throw new ServiceException("General ServiceException while retrieving talents");
    }

    return talents;
  }

  /**
   * Retrieve a specific Talent by its id.
   *
   * @param version Version of the calculator - {@link Version}
   * @param id         Id of a specific Talent
   * @param fullResult whether relations to other tables should be resolved or not
   * @return A json representation of a specific Talent
   */
  @GET
  @CacheControl("max-age=3600")
  @Path("/{id}")
  @Produces(MediaType.APPLICATION_JSON)
  public Talent getTalentById(
    @PathParam("version") Version version,
    @PathParam("id") Long id,
    @DefaultValue("false") @QueryParam("full") boolean fullResult
  ) {
    Talent talent;

    try {
      TalentEntity talentEntity = talentService.getTalentById(version, id);

      if (talentEntity == null) {
        throw new NotFoundException(
          String.format("Talent with id: %d not found", id)
        );
      }

      talent = new Talent(talentEntity);

      if (fullResult) {
        Tooltip tooltip = new Tooltip(talentEntity.getTooltipEntity());
        talent.setTooltip(tooltip);
      }
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving talent", e);
      throw new ServiceException(
        String.format(
          "General ServiceException while retrieving talent with id: %d", id)
      );
    }

    return talent;
  }
}
