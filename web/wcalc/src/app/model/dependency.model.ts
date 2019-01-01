export class Dependency {
  private _id: number;
  private _tierPos: number;
  private _talentPos: number;
  private _range: number;
  private _alignment: String;
  private _combined: boolean;
  private _dependency: number;
  private _justify: String;

  constructor(dependencyData: any) {
    this._id = dependencyData.id;
    this._tierPos = dependencyData.tierPos;
    this._talentPos = dependencyData.talentPos;
    this._range = dependencyData.range;
    this._alignment = dependencyData.alignment;
    this._combined = dependencyData.combined;
    this._dependency = dependencyData.dependency;
    this._justify = dependencyData.justify;
  }

  getId(): number {
    return this._id;
  }

  getTierPos(): number {
    return this._tierPos;
  }

  getTalentPos(): number {
    return this._talentPos;
  }

  getRange(): number {
    return this._range;
  }

  getAlignment(): String {
    return this._alignment;
  }

  getCombined(): boolean {
    return this._combined;
  }

  getDependency(): number {
    return this._dependency;
  }

  getJustify(): String {
    return this._justify;
  }
}
