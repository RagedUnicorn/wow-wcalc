import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { KlassNavigationComponent } from './klass-navigation.component';

describe('KlassNavigationComponent', () => {
  let component: KlassNavigationComponent;
  let fixture: ComponentFixture<KlassNavigationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ KlassNavigationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KlassNavigationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
