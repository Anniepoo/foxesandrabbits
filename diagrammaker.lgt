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

% tool to make diagrams

:- object(diagrammaker).
  :- uses(entity_diagram, [directory/2] ).
  :- uses(os, [expand_path/2, decompose_file_name/4, working_directory/1]).

   :- info([
       version is 0.1,
       date is 2016/05/11,
       author is 'Anne Ogborn',
       comment is 'tool that makes the diagrams for foxes and rabbits'
   ]).

   :- public(make_diagrams/0).

   make_diagrams :-
     working_directory(Dir),
     Options = [
     url_prefixes('https://github.com/Anniepoo/foxesandrabbits/blob/master/',
     'http://partyserver.rocks/foxesandrabbits/'),
      title('Foxes and Rabbits'),
      output_directory('./docs/dot/'),
      omit_path_prefixes([Dir])
     ],
     diagrams::directory('foxesandrabbits', '.', Options),
     xref_diagram::entity(field, Options). % TODO give this its own options

:- end_object.
