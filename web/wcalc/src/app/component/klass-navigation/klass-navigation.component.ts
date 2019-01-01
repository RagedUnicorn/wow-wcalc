import {Component, Input, OnInit} from '@angular/core';
import {GameVersion} from "../../model/game-version.enum";
import {KlassService} from "../../service/klass.service";

@Component({
  selector: 'wcalc-klass-navigation',
  templateUrl: './klass-navigation.component.html',
  styleUrls: ['./klass-navigation.component.scss']
})
export class KlassNavigationComponent implements OnInit {
  @Input()
  gameVersion: GameVersion;

  public klasses: Array<{name: string, id: number}>;

  constructor(
    private klassService: KlassService
  ) {}

  ngOnInit() {
    this.klasses = this.klassService.getAvailableKlasses(this.gameVersion);
  }

}
