import {GameVersion} from "./game-version.enum";
import {Tree} from "./tree.model";
import {Klass} from "./klass.model";

export class Calculator {
  private _version: GameVersion;
  private _klassName: String;
  private _klass: Klass;

  constructor(version: GameVersion, klass: Klass) {
    this._version = version;
    this._klassName = klass.getKlassName();
    this._klass = klass;
  }

  getTreeByPosition(position: number) : Tree {
    return this._klass.getTreeByPosition(position);
  }
}
