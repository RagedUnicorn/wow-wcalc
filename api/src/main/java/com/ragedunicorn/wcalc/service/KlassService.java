package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.KlassEntity;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

public interface KlassService {
  List<KlassEntity> getAllKlasses(Version version) throws CrudServiceException;

  KlassEntity getKlassById(Version version, Long id) throws CrudServiceException;
}
