<h2>{pascalCase}s</h2>

<app-{camelCase}-create (add{camelCase})="new{pascalCase}($event)"></app-{camelCase}-create>

<p>
    <label>Search:
        <input type="text" [(ngModel)]="term">
    </label>
</p>

<ul class="{camelCase}">
    <li *ngFor="let {camelCase} of {camelCase}s |filter:term">
        <span>{{ {camelCase}.{$mydata.0} }}</span>:
        <a routerLink="detail/{{{camelCase}.{$mydata.0}}}">
            {{ {camelCase}.{$mydata.1} }}
        </a>
        <button routerLink="edit/{{{camelCase}.{$mydata.0}}}">Edit</button>
        <button (click)="delete({camelCase})">Delete</button>
    </li>
</ul>