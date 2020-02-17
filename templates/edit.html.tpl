<form [formGroup]="{camelCase}Form" (ngSubmit)="save()" #formDirective="ngForm">
{for $row in $mydata}
    <label>{$row.parameter}:
      <input type="{$row.type}" name="{$row.parameter}" id="{$row.parameter}" formControlName="{$row.parameter}" />
    </label>
        {/for}
    <button (click)="goBack()">go back</button>
    <button type="submit">Update</button>
</form>