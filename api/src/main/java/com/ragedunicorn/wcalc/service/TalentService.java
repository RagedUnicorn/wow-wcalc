package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.TalentEntity;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

public interface TalentService {
  List<TalentEntity> getAllTalents(Version version) throws CrudServiceException;

  TalentEntity getTalentById(Version version, Long id) throws CrudServiceException;
}
