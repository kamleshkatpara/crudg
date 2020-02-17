import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Location } from '@angular/common';
import { {pascalCase} } from './{camelCase}.model';
import { {pascalCase}Service } from './{camelCase}s.service';

@Component({
  selector: 'app-{camelCase}-detail',
  templateUrl: './{camelCase}-detail.component.html'
})
export class {pascalCase}DetailComponent implements OnInit {
  @Input() {camelCase}: {pascalCase};

  constructor(
    private route: ActivatedRoute,
    private {camelCase}Service: {pascalCase}Service,
    private location: Location,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.get{pascalCase}();
  }

  get{pascalCase}(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.{camelCase}Service.get{pascalCase}(id).subscribe({camelCase} => this.{camelCase} = {camelCase});
  }

  goBack(): void {
    if (window.history.length > 1) {
      this.location.back()
    } else {
      this.router.navigate(['/'])
    }
  }
}
