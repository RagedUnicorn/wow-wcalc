import {Dependency} from "./dependency.model";
import {Talent} from "./talent.model";

export class Tree {
  private _id: number;
  private _treeName: string;
  private _treePos: number;
  private _talents: Talent[] = [];
  private _dependencies: Dependency[] = [];

  constructor(treeData: any) {
    this._id = treeData.id;
    this._treeName = treeData.treeName;
    this._treePos = treeData.treePos;

    for (let i = 0; i < treeData.talents.length; i++) {
      this._talents.push(new Talent(treeData.talents[i]));
    }

    for (let i = 0; i < treeData.dependencies.length; i++) {
      this._dependencies.push(new Dependency(treeData.dependencies[i]));
    }
  }

  getId(): number {
    return this._id;
  }

  getTreeName(): string {
    return this._treeName;
  }

  getTreePos(): number {
    return this._treePos;
  }

  getTalents(): Talent[] {
    return this._talents;
  }

  getDependencies(): Dependency[] {
    return this._dependencies;
  }
}
