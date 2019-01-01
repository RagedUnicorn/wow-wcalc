import {Injectable} from '@angular/core';
import {GameVersion} from "../model/game-version.enum";

@Injectable()
export class KlassService {
  private classicKlasses: Array<{name: string, id: number}> = [
    {name: 'warrior', id: 1},
    {name: 'paladin', id: 2},
    {name: 'hunter', id: 3},
    {name: 'rogue', id: 4},
    {name: 'priest', id: 5},
    {name: 'shaman', id: 7},
    {name: 'mage', id: 8},
    {name: 'warlock', id: 9},
    {name: 'druid', id: 10},
  ];

  private bcKlasses: Array<{name: string, id: number}> = [
    {name: 'warrior', id: 1},
    {name: 'paladin', id: 2},
    {name: 'hunter', id: 3},
    {name: 'rogue', id: 4},
    {name: 'priest', id: 5},
    {name: 'shaman', id: 7},
    {name: 'mage', id: 8},
    {name: 'warlock', id: 9},
    {name: 'druid', id: 10},
  ];

  private wotlkKlasses: Array<{name: string, id: number}> = [
    {name: 'warrior', id: 1},
    {name: 'paladin', id: 2},
    {name: 'hunter', id: 3},
    {name: 'rogue', id: 4},
    {name: 'priest', id: 5},
    {name: 'deathknight', id: 6},
    {name: 'shaman', id: 7},
    {name: 'mage', id: 8},
    {name: 'warlock', id: 9},
    {name: 'druid', id: 10},
  ];

  constructor() { }

  getAvailableKlasses(version: GameVersion) : Array<{name: string, id: number}> {
    switch(version) {
      case GameVersion.CLASSIC: {
        return this.classicKlasses;
      }
      case GameVersion.BC: {
        return this.bcKlasses;
      }
      case GameVersion.WOTLK: {
        return this.wotlkKlasses;
      }
      default: {
        console.error("Invalid version received");
        return null;
      }
    }
  }
}
