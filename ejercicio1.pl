ve_peliculas(roberto,suspenso).
ve_peliculas(jaanai,suspenso).
ve_peliculas(abimael,suspenso).
ve_peliculas(leonardo,romance).
ve_peliculas(miguel,terror).

escucha_musica(abelino,reggae).
escucha_musica(jose,rock).
escucha_musica(izmucaneth,reggae).
escucha_musica(rolando,rock).
escucha_musica(maldonado,regional).

consume(roberto,palomitas).
consume(jaanai,palomitas).
consume(abimael,maruchan).
consume(leonardo,maruchan).
consume(miguel,ensalada).

tiene_netflix(roberto,si).
tiene_netflix(jaanai,si).
tiene_netflix(abimael,si).
tiene_netflix(leonardo,no).
tiene_netflix(miguel,si).

tiene_spotify(abelino,no).
tiene_spotify(jose,si).
tiene_spotify(izmucaneth,si).
tiene_spotify(rolando,no).
tiene_spotify(maldonado,si).

tiempo_libre(roberto,no).
tiempo_libre(jaanai,no).
tiempo_libre(abimael,no).
tiempo_libre(leonardo,no).
tiempo_libre(miguel,no).

tiene_audifonos(abelino,no).
tiene_audifonos(jose,no).
tiene_audifonos(izmucaneth,si).
tiene_audifonos(rolando,si).
tiene_audifonos(maldonado,no).

usa_audifonos(roberto,no).
usa_audifonos(jaanai,si).
usa_audifonos(abimael,no).
usa_audifonos(leonardo,si).
usa_audifonos(miguel,si).

%--1.¿Quienes prefieren ver pelicullas?
%--Se ingresa un valor para verificar la persona, la regla nos dice que tomemos dicha persona y que no importe que tipo de pelicula vea
pref_ver_Peliculas(X) :- ve_peliculas(X,Y).

%--2.¿Quienes prefieren escuchar musica?
%--Se ingresa un valor para verificar la persona, la regla nos dice que tomemos dicha persona y que no importe que tipo de musica escuche
pref_esc_Musica(X) :- escucha_musica(X,Y).

%--3.Alguien que ve peliculas de suspenso, disfruta verlas con palomitras, tiene netflix y tiempo libre, tiene una tarde perfecta.
%--Se ingresa un valor para verificar la persona, la regla nos dice que tomemos dicha persona y verifiquemos que esta
%-- vea peliculas de suspenso, consuma palomitas, tenga netflix y tenga tiempo libre para que nos arroje un verdadero en caso de cumplir con todo.
tarde_perfecta(X) :- ve_peliculas(X,suspenso), consume(X,palomitas), tiene_netflix(X,si), tiempo_libre(X,si).

%--4.Alguien que ve películas consumiendo una ensalada, tiene una vida saludable.
%--Cualquier persona puede tener una vida saludable si ve cualquier tipo de peliculas y come ensalada.
tiene_vidaSaludable(X) :- ve_peliculas(X,Y), consume(X,ensalada).

%--5.Alguien que escuche regional, tiene audifonos y la aplicación de spotify, disfruta de camino a casa.
%--La persona que escucha musica regional, tenga audifonos y tenga spotify disfrutará su camino.
disfruta_camino(X) :- escucha_musica(X,regional), tiene_audifonos(X,si), tiene_spotify(X,si).

%--6.Alguien es feliz si ve peliculas consumiendo maruchan, tiempo libre y netflix.
%--La persona que vea cualquier tipo de peliculas, consuma una maruchan, tenga tiempo libre y tenga netflix es feliz.
es_feliz(X) :- ve_peliculas(X,Y), consume(X,maruchan), tiempo_libre(X,si), tiene_netflix(X,si).

%--7.Solo pueden ser amigos quienes tienen los mismos gustos.
%--Aqui se hacen comparaciones para poder saber si dos personas son amigos teniendo el mismo gusto
son_amigos(X,Y) :- 
consume(X,palomitas), consume(Y,palomitas), ve_peliculas(X,suspenso), ve_peliculas(Y,suspenso); 
consume(X,ensalada), consume(Y,ensalada), ve_peliculas(X,suspenso), ve_peliculas(Y,suspenso); 
consume(X,maruchan), consume(Y,maruchan), ve_peliculas(X,suspenso), ve_peliculas(Y,suspenso); 
consume(X,palomitas), consume(Y,palomitas), ve_peliculas(X,terror), ve_peliculas(Y,terror); 
consume(X,ensalada), consume(Y,ensalada), ve_peliculas(X,terror), ve_peliculas(Y,terror); 
consume(X,maruchan), consume(Y,maruchan), ve_peliculas(X,terror), ve_peliculas(Y,terror); 
consume(x,palomitas), consume(Y,palomitas), ve_peliculas(X,romance), ve_peliculas(Y,romance); 
consume(x,ensalada), consume(Y,ensalada), ve_peliculas(X,romance), ve_peliculas(Y,romance); 
consume(x,maruchan), consume(Y,maruchan), ve_peliculas(X,romance), ve_peliculas(Y,romance);
escucha_musica(X,reggae), escucha_musica(Y,reggae);
escucha_musica(X,regional), escucha_musica(Y,regional);
escucha_musica(X,rock), escucha_musica(Y,rock).
