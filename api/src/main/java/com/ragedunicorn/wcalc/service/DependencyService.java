package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.DependencyEntity;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

public interface DependencyService {
  List<DependencyEntity> getAllDependencies(Version version) throws CrudServiceException;

  DependencyEntity getDependencyById(Version version, Long id) throws CrudServiceException;
}
