/*
Pertenece
La funcion recibe como parametros el valor a buscar y la lista en donde se quiere buscar.
Primero se checa si la lista tiene un elemento y si dicho elemento es el valor a buscar y regresa true o false dependiendo del resultado.
Si la lista tiene mas de un elemento, se checa si el primer elemento corresponde al valor a buscar.
En caso contrario se llama de nuevo a la funcion con la cola de la lista y el mismo valor a buscar.
*/
pertenece(E,[X]) :- E=:=X, write("Si encuentra en la lista").
pertenece(E,[X]) :- write("No se encuentra en la lista").
pertenece(E,[X|XS]) :- E =:= X, write("Si se encuentra en la lista").
pertenece(E,[X|XS]) :- E =\= X, pertenece(E,XS).

/*
Size
La funcion recibe como parametros la lista.
Si la lista solo contiene un elemento entonces retorna un 1.
En caso contrario se divide la lista en su head y su cola para despues llamar al mismo metodo que recibira la cola de la lista y el contador.
Despues a la variable R se le asigna el contador +1 cada que pase por ese caso.
*/
size([U],1).
size([X|XS],R) :- size(XS,Count), R is 1 + Count.

/*
Concatenacion
La funcion recibe dos listas como parametros.
Esta funcion nos ayuda a unir las dos listas que se ingresan.
L2 es la la segunda lista mientras que la otra lista se ira partiendo para quitar cada una de los heads de la lista con cada recursividad.
La recursividad termina cuando se encuentre una lista vacia y R se convierte en la segunda Lista.
*/
concatenar([],L2,L2).
concatenar([X|XS],L2,[X|R]) :- concatenar(XS,L2,R).

/*
Funcion Eliminar
La funcion recibe el valor a eliminar y la lista de donde se va a eliminar.
Esta solamanente concatenara los valores de la lista introducida solo si el elemento que esta recorriendo no coincida
con el valor que se desea eliminar.
La funcion se vuelve a llamar y se detiene hasta que el valor Res se vuelva una lista vacia o bien las dos divisiones
sean completamente vacias
*/
eliminar(_,[],[]).
eliminar(E,[E],[]).
eliminar(E,[X|XS],Res) :- E =:= X, eliminar(E,XS,Res).
eliminar(E,[X|XS],[X|Res]) :- E =\= X, eliminar(E,XS,Res).

/*
Agregar un elemento a la lista
Esta recibe como parametros al valor a agregar, la lista y el valor R.
Lo unico que hace es concatenar el valor a la cabeza de la lista.
*/
agregar(Elem,R1,[Elem|R1]).

/*
Par e impares
Esta funcion recibe como parametro la lista que se quiera separar en pares e impares y las dos variables en las que se quieran almacenar.
Cuando se reciba una lista vacia entonces regresa las listas vacias.
Despues se jala el primer termino de la lista para concatenarla a la lista de una de las dos variables dependiendo de si el primer elemento
es par o impar. De ahi se llama de nuevo a la funcion con los mismos parametros.
*/
separar([],[],[]).
separar([X|Tail],[X|R1],R2) :- X mod 2 =:= 0, separar(Tail,R1,R2).
separar([X|Tail],R1,[X|R2]) :- X mod 2 =\= 0, separar(Tail,R1,R2).

/*
Ascendente
La funcion recibe una lista como parametro.
La funcion toma los dos primeros valores de la lista y compara si el primero es menor que el segundo.
Si la cola todavia tiene parametros entonces llama de nuevo a la funcion, ingresando la cola de la lista concatenada con el segundo termino de la lista.
*/
ascendente([X1,X2|[]]) :- X1 < X2.
ascendente([X1,X2|Tail]) :- X1 < X2, ascendente([X2|Tail]).

/*
Descendente
Esta funcion es muy similar a la anterior con la minima diferencia de que ahora compara si el primer elemento
de la lista es mayor al segundo elemento de la lista.
*/
descendente([X1,X2|[]]) :- X1 > X2.
descendente([X1,X2|Tail]) :- X1 > X2, descendente([X2|Tail]).

/*
Aplanar
La funcion permite regresar una lista simple de una lista con listas dentro de el.
Tambien usa la funcion de concatenar que se vió anteriormente.
*/
aplanar([],[]).
aplanar([X|R],[X|P]) :- atomic(X), aplanar(R,P).
aplanar([X|R],P) :- not(atomic(X)), aplanar(X,P_X), aplanar(R,P_R), concatenar(P_X,P_R,P).

/*
menorHead
La funcion recorre la lista ingresada y obtiene los dos primeros elementos y solo se agrega a la lista resultante
 si el segundo elemento es mayor al primer elemento despues llama a la misma funcion, pasandole como parametros 
 el primer elemento junto con el resto de elementos. La recursividad se detiene cuando la lista que se desee concatenar
 se encuentra vacia.
*/
menor([_|[]],[]).
menor([A1,A2|B],[A2|L]) :- A1 > A2, menor([A1|B],L).
menor([A1,A2|B],L) :- A1 =< A2, menor([A1|B],L).

/*
mayorHead
Es igual que la anterior funcion solo que este compara si el primer elemento es menor entonces lo agrega a la lista resultante.
*/
mayor([_|[]],[]).
mayor([A1,A2|B],[A2|L]) :- A1 < A2, mayor([A1|B],L).
mayor([A1,A2|B],L) :- A1 >= A2, mayor([A1|B],L).

/*
Invertir
La funcion permite regresar la lista con los elementos invertidos.
*/
invertir([],[]).
invertir([X|XS],L) :- invertir(XS,Z), concatenar(Z,[X],L).