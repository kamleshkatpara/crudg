import { Routes, RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { {pascalCase}EditComponent } from './{camelCase}-edit.component';
import { {pascalCase}DetailComponent } from './{camelCase}-detail.component';
import { {pascalCase}ListComponent } from './{camelCase}-list.component';

const routes: Routes = [
  { path: '', component: {pascalCase}ListComponent },
  { path: 'detail/:id', component: {pascalCase}DetailComponent },
  { path: 'edit/:id', component: {pascalCase}EditComponent }
];

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forChild(routes)
  ],
  exports: [RouterModule]
})
export class {pascalCase}sRoutingModule { }
