import { Component, OnInit } from '@angular/core';
import { {pascalCase}Service } from './{camelCase}s.service';
import { {pascalCase} } from './{camelCase}.model';

@Component({
  selector: 'app-{camelCase}-list',
  templateUrl: './{camelCase}-list.component.html'
})

export class {pascalCase}ListComponent implements OnInit {
  public {camelCase}s: {pascalCase}[];
  public term: string = '';

  constructor(private {camelCase}Service: {pascalCase}Service) { }

  ngOnInit(): void {
    this.get{pascalCase}s();
  }

  new{pascalCase}({camelCase}) {
    this.{camelCase}s.push({camelCase});
  }

  get{pascalCase}s(): void {
    this.{camelCase}Service.get{pascalCase}s().subscribe({camelCase}s => this.{camelCase}s = {camelCase}s);
  }

  delete({camelCase}: {pascalCase}): void {
    if (confirm(`Delete {camelCase} with id ${{camelCase}.id} ?`)) {
      this.{camelCase}s = this.{camelCase}s.filter(h => h !== {camelCase});
      this.{camelCase}Service.delete{pascalCase}({camelCase}).subscribe();
    }
  }

}
