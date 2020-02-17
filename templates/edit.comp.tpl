import { Component, OnInit, Input, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Location } from '@angular/common';
import { {pascalCase} } from './{camelCase}.model';
import { {pascalCase}Service } from './{camelCase}s.service';
import { NgForm, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-{camelCase}-edit',
  templateUrl: './{camelCase}-edit.component.html'
})
export class {pascalCase}EditComponent implements OnInit {

  @Input() {camelCase}: {pascalCase};
  public isSubmitted = false;

  @ViewChild('formDirective', { static: false }) private formDirective: NgForm;

  constructor(
    private route: ActivatedRoute,
    private {camelCase}Service: {pascalCase}Service,
    private location: Location,
    private fb: FormBuilder,
    private router: Router
  ) { }

  {camelCase}Form = this.fb.group({
    {for $row in $mydata} {$row.parameter}: [''{if {$row.mandatory}}, Validators.required {else} {/if}],
    {/for}
  });

  ngOnInit(): void {
    this.get{pascalCase}();
  }

{for $row in $mydata} 
{if {$row.mandatory}}// need to add code here 
get {$row.parameter}() 
( return this.heroForm.get('{$row.parameter}'));
{else}{/if}
 {/for}

  get{pascalCase}(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.{camelCase}Service.get{pascalCase}(id)
      .subscribe({camelCase} => {
        this.{camelCase}Form.setValue({{for $row in $mydata}
          {$row.parameter}: {camelCase}.{$row.parameter},{/for}
        })
      });
  };

  save(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.{camelCase}Service.update{pascalCase}(id, this.{camelCase}Form.value).subscribe(() => this.goBack());
  }

  goBack(): void {
    if (window.history.length > 1) {
      this.location.back()
    } else {
      this.router.navigate(['/'])
    }
  }

}
