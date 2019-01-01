import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';

import {AppComponent} from './app.component';
import {KlassComponent} from './component/klass/klass.component';
import {TreeComponent} from './component/tree/tree.component';
import {TierComponent} from './component/tier/tier.component';
import {TalentComponent} from './component/talent/talent.component';
import {DependencyComponent} from './component/dependency/dependency.component';
import {TooltipComponent} from './component/tooltip/tooltip.component';
import {PageNotFoundComponent} from './component/page-not-found/page-not-found.component';
import {HomeComponent} from './component/home/home.component';
import {NetService} from "./service/net.service";
import {KlassService} from "./service/klass.service";
import {KlassNavigationComponent} from './component/klass-navigation/klass-navigation.component';
import {HttpClientModule} from "@angular/common/http";
import {CalculatorService} from "./service/calculator.service";

const appRoutes: Routes = [
  {path: '', component: HomeComponent},
  {path: ':version/:klass', component: KlassComponent},
  {path: ':version', component: KlassComponent},

  {path: '**', component: PageNotFoundComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    KlassComponent,
    TreeComponent,
    TierComponent,
    TalentComponent,
    TooltipComponent,
    PageNotFoundComponent,
    HomeComponent,
    KlassNavigationComponent,
    DependencyComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    RouterModule.forRoot(
      appRoutes,
      {enableTracing: true} // <-- debugging purposes only
    )
  ],
  providers: [
    NetService,
    KlassService,
    CalculatorService
  ],
  bootstrap: [AppComponent]
})
export class AppModule {

}
