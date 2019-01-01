import {Component, Input, OnInit} from '@angular/core';
import {Talent} from "../../model/talent.model";
import {Dependency} from "../../model/dependency.model";

@Component({
  selector: 'wcalc-tier',
  templateUrl: './tier.component.html',
  styleUrls: ['./tier.component.scss']
})
export class TierComponent implements OnInit {
  @Input()
  public talents: Array<Talent>;

  @Input()
  dependencies: Array<Dependency>;

  constructor() { }

  ngOnInit() {
    this.sortTalentsByTalentPos();
  }

  /**
   *
   * @param {number} pos
   * @returns {Talent}
   */
  public getTalentByPos(pos: number) : Talent {
    return this.talents.find(x => x.getTalentPos() == pos);
  }

  public getDependenciesByPos(pos: number) : Array<Dependency> {
    return this.dependencies.filter(x => x.getTalentPos() == pos);
  }

  private sortTalentsByTalentPos() {
    this.talents = this.talents.sort(function(a, b) {
      if (a.getTalentPos() < b.getTalentPos()) {
        return -1;
      }

      if (a.getTalentPos() > b.getTalentPos()) {
        return 1
      }

      return 0;
    });
  }
}
