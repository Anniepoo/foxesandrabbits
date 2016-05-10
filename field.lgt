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
  :- uses(bunny, [new/1]).
  :- uses(fox, [new/1]).
  :- uses(random, [random_between/3]).

   :- info([
       version is 0.1,
       date is 2016/05/09,
       author is 'Anne Ogborn',
       comment is 'A field where the bunnies and foxes can live happily together'
   ]).
   :- initialization(init).

   :- dynamic wabbit/3,fox/3.

   init :-
     ::reset_grass,
     foreach(wabbit(Name, _, _), Name::die),
     foreach(fox(Name, _, _), Name::die),
     ::retractall(wabbit(_,_,_)),
     ::retractall(fox(_,_,_)),
     ::bestrew_wabbits,
     ::bestrew_foxes,
     shiva_dance::start.

% one less than the size of the field
   field_size(19).

     % todo make a protocol for animals that both foxes and bunnies implement
     % and have a bestrew predicate
   bestrew_foxes :-
     random_between(2, 12, NumFoxes),
     foreach(between(1, NumFoxes, _), ::add_a_fox).

   bestrew_wabbits :-
       random_between(2, 12, NumWabbits),
       foreach(between(1, NumWabbits, _), ::add_a_wabbit).

   add_a_wabbit :-
       field_size(S),
       random_between(0, S, X),
       random_between(0, S, Y),
       bunny::new(Name),
       ::asserta(wabbit(Name, X, Y)).

   add_a_fox :-
      field_size(S),
       random_between(0, S, X),
       random_between(0, S, Y),
       bunny::new(Name),
       ::asserta(fox(Name, X, Y)).

   map_field(Goal) :-
     field_size(S),
     between(0,S,X),
     between(0,S,Y),
     call(Goal, X, Y),
     fail.
   map_field(_).

   reset_grass :-
      ::retractall(grass(_._,_)),
      ::map_field(reset_grass).

  % randomly grow some grass
  :- public(grow_grass/0).
  grow_grass :-
      ::map_field(grow_grass).

  grow_grass
      field_size(S),
      random_between(0, S, X),
      random_between(0, S, Y),
      grass(X, Y, Height),
      NewHeight is succ(Height),
      ::retractall(grass(X, Y, _)),
      ::asserta(grass(X, Y, NewHeight)),
      fail.
  grow_grass.

:- end_object.
