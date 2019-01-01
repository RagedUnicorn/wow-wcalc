import { TestBed, inject } from '@angular/core/testing';

import { KlassService } from './klass.service';

describe('KlassService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [KlassService]
    });
  });

  it('should be created', inject([KlassService], (service: KlassService) => {
    expect(service).toBeTruthy();
  }));
});
