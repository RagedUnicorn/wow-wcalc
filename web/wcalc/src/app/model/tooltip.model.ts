export class Tooltip {
  private _id: number;
  private _locale: string;
  private _rank1: string;
  private _rank2: string;
  private _rank3: string;
  private _rank4: string;

  constructor(tooltipData: any) {
    this._id = tooltipData.id;
    this._locale = tooltipData.locale;
    this._rank1 = tooltipData.rank1;
    this._rank2 = tooltipData.rank2;
    this._rank3 = tooltipData.rank3;
    this._rank4 = tooltipData.rank4;
  }

  getId(): number {
    return this._id;
  }

  getLocale(): string {
    return this._locale;
  }

  getRank1(): string {
    return this._rank1;
  }

  getRank2(): string {
    return this._rank2;
  }

  getRank3(): string {
    return this._rank3;
  }

  getRank4(): string {
    return this._rank4;
  }
}
