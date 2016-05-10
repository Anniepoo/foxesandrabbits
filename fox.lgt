:- object(fox,
   implements(monitoring)).


   	:- public(new/1).
   	:- mode(new(-object_identifier), one).
   	:- info(new/1, [
   		comment is 'Creates a new fox.',
   		argnames is ['Id']
   	]).

   	new(Fox) :-
   		self(Self),
   		create_object(Fox, [extends(Self)], [], []).

    :- private(hunger/1).
    :- dynamic(hunger/1).
    hunger(0).

:- end_object.
