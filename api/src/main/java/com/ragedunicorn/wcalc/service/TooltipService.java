package com.ragedunicorn.wcalc.service;

import com.ragedunicorn.wcalc.error.CrudServiceException;
import com.ragedunicorn.wcalc.model.TooltipEntity;
import com.ragedunicorn.wcalc.util.Version;

import java.util.List;

public interface TooltipService {
  List<TooltipEntity> getAllTooltips(Version version) throws CrudServiceException;

  TooltipEntity getTooltipById(Version version, Long id) throws CrudServiceException;
}
