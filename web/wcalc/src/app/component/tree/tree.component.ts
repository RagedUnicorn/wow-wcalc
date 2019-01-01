import {Component, Input, OnChanges, OnInit, SimpleChanges, ViewEncapsulation} from '@angular/core';
import {Tree} from "../../model/tree.model";
import {CalculatorService} from "../../service/calculator.service";

@Component({
  selector: 'wcalc-tree',
  encapsulation : ViewEncapsulation.None,
  templateUrl: './tree.component.html',
  styleUrls: ['./tree.component.scss']
})
export class TreeComponent implements OnInit {
  @Input()
  public position: number;

  @Input()
  public tree: Tree;

  @Input()
  public className: String;

  public range : Array<number>;

  constructor(private calculatorService : CalculatorService) {
    // create range of 11 elements for 11 tiers TODO this should correspond to the version
    this.range = Array.apply(null, {length: 11}).map(Number.call, Number);

    calculatorService.talentPointSpent.subscribe(x => this.onTalentEvent(x));
  }

  ngOnInit() {
    console.log("test: ", this.tree.getDependencies())
  }

  getTalentsByTier(tier: number) {
    return this.tree.getTalents().filter(x => x.getTierPos() == tier);
  }

  getDependenciesByTier(tier: number) {
    return this.tree.getDependencies().filter(x => x.getTierPos() == tier);
  }

  onTalentEvent(message: String) {
    console.log("received talentevent: " + message);
  }
}
