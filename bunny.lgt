:- object(bunny).
  :- use_module(library(gui_tracer), [gtrace/0]).

  :- uses(gensym, [reset_gensym/0, gensym/2]).

	:- public(new/1).
	:- mode(new(-object_identifier), one).
	:- info(new/1, [
		comment is 'Creates a new bunny.',
		argnames is ['Id']
	]).

   	:- public(live/0).
   	:- info(live/0, [
   		comment is 'Miss Bunny, do your thing for a cycle.'
   	]).

   	:- public(die/0).
   	:- info(die/0, [
   		comment is 'Kill the wabbit!'
   	]).

	new(Bunny) :-
		self(Self),
    gensym(b, Bunny),
		create_object(Bunny, [extends(Self)], [], [hunger_(0)]).

  :- private(hunger_/1).
  :- dynamic(hunger_/1).

  live :-
  % why arent bunnies getting hungry?
    ::hunger_(H),
    write('Bunny has hunger '),
    writeln(H),
    ::retractall(hunger_(_)),
    NH is H + 1,
    ::asserta(hunger_(NH)),
    act.

  act :-
    ::hunger_(H),
    H > 15,
    self(S),
    write('Bunny '),
    write(S),
    writeln(' dies of hunger'),
    ::die.
  act :-
    self(S),
    field::sniff_fox(S, Dir),
    writeln('Bunny hops away'),
    field::move_away_from(S, Dir).
  act :-
    ::hunger_(H),
    H > 4,
    self(S),
    write('Bunny'),
    write(S),
    writeln(' eats '),
    field::eat_grass(S, Food),
    ::hunger_(H),
    NewH is max(0, H - Food),
    retractall(hunger_(_)),
    asserta(hunger_(NewH)).
  act :-
    self(Self),
    write('Bunny '),
    write(Self),
    writeln(' Plays').

  die :-
    self(Self),
    write('Bunny '),
    write(Self),
    writeln(' dies').

:- end_object.
