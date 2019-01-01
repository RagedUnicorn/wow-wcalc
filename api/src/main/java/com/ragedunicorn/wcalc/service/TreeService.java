package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.TreeEntity;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

public interface TreeService {
  List<TreeEntity> getAllTrees(Version version) throws CrudServiceException;

  TreeEntity getTreeById(Version version, Long id) throws CrudServiceException;
}
