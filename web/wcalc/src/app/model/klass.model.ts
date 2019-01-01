import {Tree} from "./tree.model";

export class Klass {
  private _id: number;
  private _klassName: string;
  private _treeList: Tree[] = [];

  constructor(klassData: any) {
    this._id = klassData.id;
    this._klassName = klassData.klassName;

    for (let i = 0; i < klassData.treeList.length; i++) {
      this._treeList.push(new Tree(klassData.treeList[i]));
    }
  }

  getId(): number {
    return this._id;
  }

  getKlassName(): string {
    return this._klassName;
  }

  getTreeList(): Tree[] {
    return this._treeList;
  }

  /**
   *
   * @param {number} position
   * @returns {Tree}
   */
  getTreeByPosition(position: number): Tree {
    for (let tree of this._treeList) {
      if (tree.getTreePos() === position) {
        return tree;
      }
    }

    return;
  }
}
