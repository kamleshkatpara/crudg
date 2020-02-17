<div *ngIf="{camelCase}">
    <div><span>{$mydata.0}: </span>{{{camelCase}.{$mydata.0}}}</div>
    <p>{{{camelCase}.{$mydata.1} | uppercase}} Details</p>
    <button (click)="goBack()">go back</button>
</div>