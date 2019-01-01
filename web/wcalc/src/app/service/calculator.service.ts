import {EventEmitter, Injectable} from '@angular/core';
import {Klass} from "../model/klass.model";
import {GameVersion} from "../model/game-version.enum";
import {Calculator} from "../model/calculator.model";
import {Tree} from "../model/tree.model";
import {Talent} from "../model/talent.model";

@Injectable()
export class CalculatorService {
  private _calculatorState: Calculator;

  public talentPointSpent: EventEmitter<String> = new EventEmitter<String>();

  constructor() {}

  public initializeCalculatorForClass(version: GameVersion, klass: Klass) {
    this._calculatorState = new Calculator(version, klass);
  }

  public spendTalentPoint(treePosition: number, talentId: number) : boolean {
    let tree : Tree = this._calculatorState.getTreeByPosition(treePosition);
    let talent : Talent = this.findTalentById(tree, talentId);
    let spentPoints : number = talent.getSpentPoints();

    if (spentPoints >= talent.getMaxPoints()) {
      console.log("Talent is already maxed out");
      return false;
    }

    talent.setSpentPoints(spentPoints++);
    return true;
  }

  public removeTalentPoint(treePosition : number, talentId: number) : boolean {
    let tree : Tree = this._calculatorState.getTreeByPosition(treePosition);
    let talent : Talent = this.findTalentById(tree, talentId);
    let spentPoints : number = talent.getSpentPoints();

    if (spentPoints > 0) {
      talent.setSpentPoints(spentPoints--);
    }

    return false;
  }

  private findTalentById(tree: Tree, talentId: number) : Talent {
    return tree.getTalents().find(x => x.getId() === talentId);
  }

  public resetCalculatorForClass(klass: String) {
    // TODO iterate over klass and reset
    // this._klass
  }
}
