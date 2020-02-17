import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { Ng2SearchPipeModule } from 'ng2-search-filter';
import { {pascalCase}CreateComponent } from './{camelCase}-create.component';
import { {pascalCase}ListComponent } from './{camelCase}-list.component';
import { {pascalCase}EditComponent } from './{camelCase}-edit.component';
import { {pascalCase}DetailComponent } from './{camelCase}-detail.component';
import { {pascalCase}sRoutingModule } from './{camelCase}s.routing.module';

@NgModule({
  declarations: [{pascalCase}ListComponent, {pascalCase}EditComponent, {pascalCase}DetailComponent, {pascalCase}CreateComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    {pascalCase}sRoutingModule,
    Ng2SearchPipeModule
  ]
})
export class {pascalCase}sModule { }
