import {Component, Input, OnInit} from '@angular/core';
import {Dependency} from "../../model/dependency.model";

/*
  TODO use .arrow-inactive and .arrow-active to show state of the depnendency
*/

@Component({
  selector: 'wcalc-dependency',
  templateUrl: './dependency.component.html',
  styleUrls: ['./dependency.component.scss']
})
export class DependencyComponent implements OnInit {
  @Input()
  dependency: Dependency;

  public alignment: String;
  public arrowDirection: String;

  constructor() { }

  ngOnInit() {
    console.log("initialized a new dependency with: ", this.dependency);
  }

  public getDependencyClass() : String {
    let klassName: String;
    let range = this.dependency.getRange();
    let alignment = this.dependency.getAlignment();
    let direction = this.dependency.getJustify();
    let combined = this.dependency.getCombined();

    if (alignment === "vertical") {
      klassName = "v-arrow";
    } else if (alignment === "plain") {
      klassName = "p-arrow";
    } else {
      klassName = "h-arrow";
    }

    if (combined) {
      klassName = klassName + "-combined";
    }

    if (direction) {
      if (direction === "right") {
        klassName = klassName + "-right";
      } else {
        klassName = klassName + "-left";
      }
    }

    if (range === 1) {
      klassName = klassName + "-short";
    } else if (range === 2) {
      klassName = klassName + "-middle";
    } else if (range === 3) {
      klassName = klassName + "-long";
    } else {
      // do nothing
    }

    return klassName;
  }
}
