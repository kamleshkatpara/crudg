<form [formGroup]="{camelCase}Form" (ngSubmit)="add()" #formDirective="ngForm">
    {for $row in $mydata}
    <label>{$row.parameter}:
        <input type="{$row.type}" name="{$row.parameter}" id="{$row.parameter}" formControlName="{$row.parameter}" />
    </label>
    {/for}
    <button type="submit">Add</button>
</form>