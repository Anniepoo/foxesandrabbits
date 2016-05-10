:- object(bunny,
   implements(monitoring)).

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
		create_object(Bunny, [extends(Self)], [], []).

  :- private(hunger/1).
  :- dynamic(hunger/1).
  hunger(0).

    live :-
      self(Self),
      write('Bunny '),
      write(Self),
      writeln(' lives').

    die :-
      self(Self),
      write('Bunny '),
      write(Self),
      writeln(' dies').

:- end_object.
