:- object(shiva_dance).
% the object that makes the world move.

  :-public(start/0).

  start :- writeln('OK Shiva is dancing').

  :- public(tick/0).
  tick :-
    field::grow_grass,
    field::with_foxes(live),  % the foxes are quicker!
    field::with_bunnies(live).

:- end_object.
