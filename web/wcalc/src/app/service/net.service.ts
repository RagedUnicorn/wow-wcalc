import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable()
export class NetService {
  private baseUrl = "http://localhost:8080/wcalc-api/wcalc/";

  constructor(private http: HttpClient) {}

  public getKlass(version, id) {
    console.log("getKlass called");
    return this.http.get(this.baseUrl + version + "/klass/" + id + "?full=true");
  }
}
