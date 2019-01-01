package com.ragedunicorn.wcalc.util;

import com.ragedunicorn.wcalc.service.DependencyService;
import com.ragedunicorn.wcalc.service.DependencyServiceImpl;
import com.ragedunicorn.wcalc.service.KlassService;
import com.ragedunicorn.wcalc.service.KlassServiceImpl;
import com.ragedunicorn.wcalc.service.TalentService;
import com.ragedunicorn.wcalc.service.TalentServiceImpl;
import com.ragedunicorn.wcalc.service.TooltipService;
import com.ragedunicorn.wcalc.service.TooltipServiceImpl;
import com.ragedunicorn.wcalc.service.TreeService;
import com.ragedunicorn.wcalc.service.TreeServiceImpl;
import org.glassfish.hk2.utilities.binding.AbstractBinder;

public class ApplicationBinder extends AbstractBinder {
  @Override
  protected void configure() {
    bindAsContract(KlassServiceImpl.class).to(KlassService.class);
    bindAsContract(TreeServiceImpl.class).to(TreeService.class);
    bindAsContract(TalentServiceImpl.class).to(TalentService.class);
    bindAsContract(TooltipServiceImpl.class).to(TooltipService.class);
    bindAsContract(DependencyServiceImpl.class).to(DependencyService.class);
  }
}
