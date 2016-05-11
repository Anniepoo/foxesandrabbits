:- object(fox,
   implements(animal)).

   	:- public(new/1).
   	:- mode(new(-object_identifier), one).
   	:- info(new/1, [
   		comment is 'Creates a new fox.',
   		argnames is ['Id']
   	]).

   	:- public(live/0).
   	:- info(live/0, [
   		comment is 'Mr. Fox, do your thing for a cycle.'
   	]).

   	:- public(die/0).
   	:- info(die/0, [
   		comment is 'fox responds by dying.'
   	]).

   	new(Fox) :-
   		self(Self),
   		create_object(Fox, [extends(Self)], [], []).

    :- private(hunger/1).
    :- dynamic(hunger/1).
    hunger(0).

    live :-
      self(Self),
      write('Fox '),
      write(Self),
      writeln(' lives').

    die :-
      self(Self),
      write('Fox '),
      write(Self),
      writeln(' dies').

  %%%%%%%%%%%%%%%%%%% animal protocol %%%%%%%%%%%%%%%%%%%%%%

    species(fox).

:- end_object.
