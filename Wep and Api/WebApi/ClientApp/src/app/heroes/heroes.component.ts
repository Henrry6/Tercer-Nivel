import { Component, OnInit } from '@angular/core'
import { Heroe } from '../heroe'
import { Altura } from '../altura'


@Component({
  selector: 'heroes-app',
  templateUrl: "./heroes.component.html"


})

export class HeroesComponent implements OnInit {

  hero: Heroe = {
        id: 1,
        name: 'SuperMan'
    };

    altura: Altura = {
        id: 1,
        altura: 165,
        estudiante: 'Henrry Alvrado',

    }
  constructor() { }

  ngOnInit() {
  }

}
