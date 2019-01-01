package com.ragedunicorn.wcalc.rest;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.error.NotFoundException;
import com.ragedunicorn.wcalc.error.ServiceException;
import com.ragedunicorn.wcalc.model.Talent;
import com.ragedunicorn.wcalc.model.Tree;
import com.ragedunicorn.wcalc.model.TreeEntity;
import com.ragedunicorn.wcalc.service.TreeServiceImpl;
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


@Path("/{version}/tree")
public class TreeResource {
  private static final Logger logger = LoggerFactory.getLogger(TreeResource.class);

  @Inject
  private TreeServiceImpl treeService;

  /**
   * Retrieve all Trees.
   *
   * @param version    Version of the calculator - {@link Version}
   * @param fullResult whether relations to other tables should be resolved or not
   * @return A json representation of all Trees
   */
  @GET
  @CacheControl("max-age=3600")
  @Produces(MediaType.APPLICATION_JSON)
  public List<Tree> getTrees(
    @PathParam("version") Version version,
    @DefaultValue("false") @QueryParam("full") boolean fullResult
  ) {
    List<TreeEntity> treeEntities;
    List<Tree> trees;

    try {
      treeEntities = treeService.getAllTrees(version);

      if (CollectionUtils.isEmpty(treeEntities)) {
        throw new NotFoundException("No trees found");
      }

      trees = treeEntities.stream()
        .map(treeEntity -> new Tree(treeEntity, fullResult))
        .collect(Collectors.toList());
    } catch (CrudServiceException e) {
      logger.error("ServiceException while retrieving tress", e);
      throw new ServiceException("General ServiceException while retrieving trees");
    }

    return trees;
  }

  /**
   * Retrieve a specific Tree by its id.
   *
   * @param version    Version of the calculator - {@link Version}
   * @param id         Id of a specific Tree
   * @param fullResult whether relations to other tables should be resolved or not
   * @return A json representation of a specific Tree
   */
  @GET
  @CacheControl("max-age=3600")
  @Path("/{id}")
  @Produces(MediaType.APPLICATION_JSON)
  public Tree getTreeById(
    @PathParam("version") Version version,
    @PathParam("id") Long id,
    @DefaultValue("false") @QueryParam("full") boolean fullResult
  ) {
    TreeEntity treeEntity;
    Tree tree;

    try {
      treeEntity = treeService.getTreeById(version, id);

      if (treeEntity == null) {
        logger.debug("No tree found by id: [" + id + "]");
        throw new NotFoundException(
          String.format("Tree with id: %d not found", id)
        );
      }

      tree = new Tree(treeEntity);

      if (fullResult) {
        List<Talent> talents = treeEntity.getTalentEntities().stream()
          .map(talentEntity -> new Talent(talentEntity, true))
          .collect(Collectors.toList());
        tree.setTalents(talents);
      }
    } catch (CrudServiceException e) {
      throw new ServiceException(
        String.format(
          "General ServiceException while retrieving tree with id: %d", id)
      );
    }

    return tree;
  }
}
