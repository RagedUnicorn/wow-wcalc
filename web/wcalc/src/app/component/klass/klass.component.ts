import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from "@angular/router";
import {NetService} from "../../service/net.service";
import 'rxjs/Rx';
import {Klass} from "../../model/klass.model";
import {KlassService} from "../../service/klass.service";
import {Tree} from "../../model/tree.model";
import {GameVersion} from "../../model/game-version.enum";
import {Dependency} from "../../model/dependency.model";

@Component({
  selector: 'wcalc-klass',
  templateUrl: './klass.component.html',
  styleUrls: ['./klass.component.scss'],
  providers: [KlassService]
})
export class KlassComponent implements OnInit {

  private version: GameVersion;
  private klass: string;
  private klassId: number;
  public klassData: Klass;
  public klasses: Array<{name: string, id: number}>;
  public treeList: Tree[];

  constructor(
    private route: ActivatedRoute,
    private netService: NetService,
    private klassService: KlassService
  ) {}

  ngOnInit() {
    this.route.paramMap
      .subscribe(params => {
        this.version = GameVersion[params.get("version").toUpperCase()];
        this.klass = params.get("klass");

        if (!this.version) {
          console.error("Invalid state");
          return;
        }

        this.klasses = this.getAvailableKlasses();

        if (!this.klass) {
          // use first klass by default
          this.klass = this.klasses[0].name;
          this.klassId = this.klasses[0].id;
        } else {
          this.klassId = this.klasses.find(x => x.name == this.klass).id;
        }

        this.loadKlassData(this.version, this.klassId);
      }, error => {
        console.log(error);
      });
  }

  private getAvailableKlasses() : Array<{name: string, id: number}> {
    return this.klassService.getAvailableKlasses(this.version)
  }

  private loadKlassData(version: GameVersion, id: number) {
    this.netService.getKlass(version, id)
      .subscribe(response => {
        console.log(response);
        this.klassData = new Klass(response);
        this.sortTreesByTreePos()
      }, error => {
        console.log("Failure while retrieving KlassData", error);
      });
  }

  private sortTreesByTreePos() {
    this.treeList = this.klassData.getTreeList().sort(function(a, b) {
      if (a.getTreePos() < b.getTreePos()) {
        return -1;
      }

      if (a.getTreePos() > b.getTreePos()) {
        return 1
      }

      return 0;
    });
  }
}
