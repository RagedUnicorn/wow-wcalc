package com.ragedunicorn.wcalc.rest;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.error.NotFoundException;
import com.ragedunicorn.wcalc.error.ServiceException;
import com.ragedunicorn.wcalc.model.Tooltip;
import com.ragedunicorn.wcalc.model.TooltipEntity;
import com.ragedunicorn.wcalc.service.TooltipServiceImpl;
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


@Path("/{version}/tooltip")
public class TooltipResource {
  private static final Logger logger = LoggerFactory.getLogger(TooltipResource.class);

  @Inject
  private TooltipServiceImpl tooltipService;

  /**
   * Retrieve all Tooltips.
   *
   * @param version Version of the calculator - {@link Version}
   * @return A json representation of all Tooltips
   */
  @GET
  @CacheControl("max-age=3600")
  @Produces(MediaType.APPLICATION_JSON)
  public List<Tooltip> getTooltips(
    @PathParam("version") Version version
  ) {
    List<Tooltip> tooltips;

    try {
      List<TooltipEntity> tooltipEntities = tooltipService.getAllTooltips(version);

      if (CollectionUtils.isEmpty(tooltipEntities)) {
        throw new NotFoundException("No tooltips found");
      }

      tooltips = tooltipEntities.stream()
        .map(Tooltip::new)
        .collect(Collectors.toList());
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving tooltips", e);
      throw new ServiceException("General ServiceException while retrieving tooltips");
    }

    return tooltips;
  }

  /**
   * Retrieve a specific Tooltip by its id.
   *
   * @param version Version of the calculator - {@link Version}
   * @param id      Id of a specific Tooltip
   * @return A json representation of a specific Tooltip
   */
  @GET
  @CacheControl("max-age=3600")
  @Path("/{id}")
  @Produces(MediaType.APPLICATION_JSON)
  public Tooltip getTooltipById(
    @PathParam("version") Version version,
    @PathParam("id") Long id
  ) {
    TooltipEntity tooltipEntity;

    try {
      tooltipEntity = tooltipService.getTooltipById(version, id);
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving tooltip", e);
      throw new ServiceException(
        String.format(
          "General ServiceException while retrieving tooltip with id: %d", id)
      );
    }

    if (tooltipEntity == null) {
      throw new NotFoundException(
        String.format("Tooltip with id: %d not found", id)
      );
    }

    return new Tooltip(tooltipEntity);
  }
}
