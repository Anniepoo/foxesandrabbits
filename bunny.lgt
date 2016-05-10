:- object(bunny,
   implements(monitoring)).

	:- public(new/1).
	:- mode(new(-object_identifier), one).
	:- info(new/1, [
		comment is 'Creates a new bunny.',
		argnames is ['Id']
	]).

	new(Bunny) :-
		self(Self),
		create_object(Bunny, [extends(Self)], [], []).

  :- private(hunger/1).
  :- dynamic(hunger/1).
  hunger(0).

:- end_object.
