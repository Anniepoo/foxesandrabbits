%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  This file is part of Logtalk <http://logtalk.org/>
%  Copyright 1S8-2016 Paulo Moura <pmoura@logtalk.org>
%
%  Licensed under the Apache License, Version 2.0 (the "License");
%  you may not use this file except in compliance with the License.
%  You may obtain a copy of the License at
%
%      http://www.apache.org/licenses/LICENSE-2.0
%
%  Unless required by applicable law or agreed to in writing, software
%  distributed under the License is distributed on an "AS IS" BASIS,
%  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%  See the License for the specific language governing permissions and
%  limitations under the License.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this is the actual field object, since it's a singleton
% though I'm cheaping out on the real singleton pattern

:- object(field,
   implements(monitoring)).
:- use_module(random_loader, [random/3]).

   :- info([
       version is 0.1,
       date is 2016/05/09,
       author is 'Anne Ogborn',
       comment is 'A field where the bunnies and foxes can live happily together'
   ]).
   :- initialization(init).

   :- public(grow_grass/0).
   :- info(grow_grass/0, [
     comment is 'Makes the grass get longer'
   ]).

   :- public(print_field/0).
   :- info(print_field/0, [
     comment is 'Displays the field using ascii graphics'
   ]).

   :- private(wabbit/3).
   :- private(fox/3).
   :- private(grass/3).
   :- dynamic([wabbit/3,fox/3,grass/3]).

   init :-
     reset_grass,
     forall(wabbit(Name, _, _), Name::die),
     forall(fox(Name, _, _), Name::die),
     retractall(wabbit(_,_,_)),
     retractall(fox(_,_,_)),
     bestrew_wabbits,
     bestrew_foxes,
     shiva_dance::start.

% one less than the size of the field
   field_size(15).

     % todo make a protocol for animals that both foxes and bunnies implement
     % and have a bestrew predicate
   bestrew_foxes :-
     random(2, 12, NumFoxes),
     forall(between(1, NumFoxes, _), add_a_fox).

   bestrew_wabbits :-
       random(2, 12, NumWabbits),
       forall(between(1, NumWabbits, _), add_a_wabbit).

   add_a_wabbit :-
       field_size(S),
       random(0, S, X),
       random(0, S, Y),
       bunny::new(Name),
       asserta(wabbit(Name, X, Y)).

   add_a_fox :-
      field_size(S),
       random(0, S, X),
       random(0, S, Y),
       fox::new(Name),
       asserta(fox(Name, X, Y)).

   map_field(Goal) :-
     field_size(S),
     between(0,S,X),
     between(0,S,Y),
     call(Goal, X, Y),
     fail.
   map_field(_).

   reset_grass :-
      retractall(grass(_,_,_)),
      map_field(reset_grass).

  reset_grass(X, Y) :-
      asserta(grass(X, Y, 9)).

  % randomly grow some grass
  grow_grass :-
      map_field(grow_grass).

  grow_grass :-
      field_size(S),
      random(0, S, X),
      random(0, S, Y),
      grass(X, Y, Height),
      NewHeight is Height + 1,
      retractall(grass(X, Y, _)),
      asserta(grass(X, Y, NewHeight)),
      fail.
  grow_grass.

  print_field :-
    field_size(S),
    between(0,S,Y),
    print_row(Y),
    writeln(''),
    fail.
  print_field.

  print_row(Row) :-
    field_size(S),
    between(0,S,X),
    print_cell(X, Row),
    fail.
  print_row(_).

  print_cell(X, Y) :- print_cell_(X, Y), !.
  print_cell_(X, Y) :-
    fox(_, X,Y),
    wabbit(_, X, Y),
    write('@#$! ').
    print_cell_(X, Y) :-
      fox(_, X,Y),
      write(' ^.^ ').
    print_cell_(X, Y) :-
      wabbit(_, X,Y),
      write('>:c. ').
    print_cell_(X, Y) :-
      grass(X,Y, Height),
      grass_symbol(Height, Symbol),
      write(Symbol).

  grass_symbol(X, 'WWWW ') :- X >= 9.
  grass_symbol(8, 'WwWW ').
  grass_symbol(7, 'WwWw ').
  grass_symbol(6, 'wwWw ').
  grass_symbol(5, 'wwww ').
  grass_symbol(4, 'w_ww ').
  grass_symbol(3, 'w_w_ ').
  grass_symbol(2, 'w___ ').
  grass_symbol(1, '__w_ ').
  grass_symbol(_, '____ ').
:- end_object.
