import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';
import { {pascalCase} } from './{camelCase}.model';

@Injectable({
  providedIn: 'root'
})

export class {pascalCase}Service {

  private {camelCase}ApiUrl = '/api/{camelCase}s';

  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  constructor(private http: HttpClient) { }

  get{pascalCase}s(): Observable<{pascalCase}[]> {
    return this.http.get<{pascalCase}[]>(this.{camelCase}ApiUrl)
      .pipe(
        tap(_ => this.log('fetched {camelCase}')),
        catchError(this.handleError<{pascalCase}[]>('get{pascalCase}', []))
      );
  }

  get{pascalCase}No404<Data>(id: number): Observable<{pascalCase}> {
    const url = `${this.{camelCase}ApiUrl}/${id}`;
    return this.http.get<{pascalCase}[]>(url)
      .pipe(
        map({pascalCase} => {pascalCase}[0]),
        tap(h => {
          const outcome = h ? `fetched` : `did not find`;
          this.log(`${outcome} {camelCase} id=${id}`);
        }),
        catchError(this.handleError<{pascalCase}>(`get{pascalCase} id=${id}`))
      );
  }

  get{pascalCase}(id: number): Observable<{pascalCase}> {
    const url = `${this.{camelCase}ApiUrl}/${id}`;
    return this.http.get<{pascalCase}>(url).pipe(
      tap(_ => this.log(`fetched {camelCase} id=${id}`)),
      catchError(this.handleError<{pascalCase}>(`get{pascalCase} id=${id}`))
    );
  }

  search{pascalCase}es(term: string): Observable<{pascalCase}[]> {
    if (!term.trim()) {
      return of([]);
    }
    return this.http.get<{pascalCase}[]>(`${this.{camelCase}ApiUrl}/?name=${term}`).pipe(
      tap(x => x.length ?
        this.log(`found {camelCase} matching "${term}"`) :
        this.log(`no {camelCase} matching "${term}"`)),
      catchError(this.handleError<{pascalCase}[]>('search{pascalCase}s', []))
    );
  }

  add{pascalCase}({camelCase}: {pascalCase}): Observable<{pascalCase}> {
    return this.http.post<{pascalCase}>(this.{camelCase}ApiUrl, {camelCase}, this.httpOptions).pipe(
      tap((new{pascalCase}: {pascalCase}) => this.log(`added {pascalCase} w/ id=${new{pascalCase}.id}`)),
      catchError(this.handleError<{pascalCase}>('add{pascalCase}'))
    );
  }

  delete{pascalCase}({camelCase}: {pascalCase} | number): Observable<{pascalCase}> {
    const id = typeof {camelCase} === 'number' ? {camelCase} : {camelCase}.id;
    const url = `${this.{camelCase}ApiUrl}/${id}`;

    return this.http.delete<{pascalCase}>(url, this.httpOptions).pipe(
      tap(_ => this.log(`deleted {camelCase} id=${id}`)),
      catchError(this.handleError<{pascalCase}>('delete{pascalCase}'))
    );
  }

  update{pascalCase}(id: number, {camelCase}: {pascalCase}): Observable<any> {
    return this.http.put(`${this.{camelCase}ApiUrl}/${id}`, {camelCase}, this.httpOptions).pipe(
      tap(_ => this.log(`updated {camelCase} id=${id}`)),
      catchError(this.handleError<any>('update{pascalCase}'))
    );
  }

  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      this.log(`${operation} failed: ${error.message}`);
      return of(result as T);
    };
  }

  private log(message: string) {
    console.log(`{pascalCase}Service: ${message}`);
  }
}
