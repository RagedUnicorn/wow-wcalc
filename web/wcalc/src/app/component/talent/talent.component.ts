import {Component, Input, OnInit} from '@angular/core';
import {Talent} from "../../model/talent.model";
import {TalentState} from "../../model/talent-state.enum";
import {Dependency} from "../../model/dependency.model";
import {CalculatorService} from "../../service/calculator.service";

@Component({
  selector: 'wcalc-talent',
  templateUrl: './talent.component.html',
  styleUrls: ['./talent.component.scss']
})
export class TalentComponent implements OnInit {
  @Input()
  public talent: Talent;

  @Input()
  public dependencies: Array<Dependency>;

  public talentState: TalentState;

  TT = {
    TalentState: TalentState
  };

  constructor(
    private calculatorService : CalculatorService
  ) {}

  ngOnInit() {
    if (this.talent) {
      this.updateTalentState()
    }
  }

  private updateTalentState() {
    // activate first row by default
    if (this.talent.getTierPos() == 0) {
      this.talentState = TalentState.ACTIVE;
    } else {
      this.talentState = TalentState.INACTIVE;
    }
  }

  onTalentLeftClick() {
    console.log("Should add talent point to talent with id: " + this.talent.getId());
    this.calculatorService.talentPointSpent.emit("leftClick");
  }

  onTalentRightClick() {
    console.log("Should remove talent point from talent with id: " + this.talent.getId());
    this.calculatorService.talentPointSpent.emit("rightClick");
    return false; // prevent default browser behavior
  }
}
