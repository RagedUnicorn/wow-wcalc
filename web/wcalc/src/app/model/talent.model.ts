import {Tooltip} from "./tooltip.model";
import {TalentState} from "./talent-state.enum";

export class Talent {
  private _id: number;
  private _state: TalentState;
  private _talentName: string;
  private _icon: string;
  private _tierPos: number;
  private _talentPos: number;
  private _maxPoints: number;
  private _spentPoints: number;
  private _dependency: number;
  private _tooltip: Tooltip;

  constructor(talentData: any) {
    this._id = talentData.id;
    this._state = TalentState.INACTIVE;
    this._talentName = talentData.talentName;
    this._icon = talentData.icon;
    this._tierPos = talentData.tierPos;
    this._talentPos = talentData.talentPos;
    this._maxPoints = talentData.maxPoints;
    this._spentPoints = 0;
    this._dependency = talentData.dependency;
    this._tooltip = new Tooltip(talentData.tooltip);
  }

  getId(): number {
    return this._id;
  }

  getState(): TalentState {
    return this._state;
  }

  getTalentName(): string {
    return this._talentName;
  }

  getIcon(): string {
    return this._icon;
  }

  getTierPos(): number {
    return this._tierPos
  }

  getTalentPos(): number {
    return this._talentPos;
  }

  getMaxPoints(): number {
    return this._maxPoints
  }

  getSpentPoints(): number {
    return this._spentPoints;
  }

  setSpentPoints(amount: number) {
    this._spentPoints = amount
  }

  getDependency(): number {
    return this._dependency;
  }

  getTooltip(): Tooltip {
    return this._tooltip;
  }
}
