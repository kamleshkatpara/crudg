import { Component, OnInit, ViewChild, EventEmitter, Output } from '@angular/core';
import { NgForm, Validators, FormBuilder } from '@angular/forms';
import { {pascalCase}Service } from './{camelCase}s.service';

@Component({
  selector: 'app-{camelCase}-create',
  templateUrl: './{camelCase}-create.component.html'
})
export class {pascalCase}CreateComponent implements OnInit {
  public isSubmitted = false;

  @ViewChild('formDirective', { static: false }) private formDirective: NgForm;

  @Output() add{camelCase} = new EventEmitter<object>();

  constructor(private {camelCase}Service: {pascalCase}Service, private fb: FormBuilder) { }

  {camelCase}Form = this.fb.group({
    {for $row in $mydata} {$row.parameter}: [''{if {$row.mandatory}}, Validators.required {else} {/if}],
    {/for}
  });

  ngOnInit(): void { }

{for $row in $mydata} {if {$row.mandatory}}// need to add code here get {$row.parameter}() {else}{/if} {/for}

  add(): void {
    this.isSubmitted = true;
    if (!this.{camelCase}Form.valid) {
      console.warn('Error');
    } else {
      this.{camelCase}Service.add{pascalCase}(this.{camelCase}Form.value)
        .subscribe({camelCase} => {
          this.add{camelCase}.emit({camelCase});
          this.resetForm();
        });
    }
  }

  resetForm() {
    this.isSubmitted = false;
    this.formDirective.resetForm();
    this.{camelCase}Form.reset();
  }
}
