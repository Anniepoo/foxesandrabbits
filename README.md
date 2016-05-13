# Foxes and Rabbits

A simple example of using Logtalk to do 'something real', in this case
simulate a fairly silly little world consisting of some bunnies and foxes in
a grassy field.

Usage -

make run

    (lots of spew omitted )

% [ /home/anniepoo/logtalkpractice/foxesandrabbits/bunny.lgt loaded ]
OK Shiva is dancing
% [ /home/anniepoo/logtalkpractice/foxesandrabbits/field.lgt loaded ]
% [ /home/anniepoo/logtalkpractice/foxesandrabbits/diagrammaker.lgt loaded ]
% [ /home/anniepoo/logtalkpractice/foxesandrabbits/loader.lgt loaded ]
% 2 compilation warnings
?- shiva_dance::tick.
Fox o5 lives
Fox o4 lives
Fox o3 lives
Fox o2 lives
Fox o1 lives
Bunny b2 has hunger 0
Bunny b2 Plays
Bunny b1 has hunger 0
Bunny b1 Plays
true.

?- shiva_dance::tick.
Fox o5 lives
Fox o4 lives
Fox o3 lives
Fox o2 lives
Fox o1 lives
Bunny b2 has hunger 1
Bunny b2 Plays
Bunny b1 has hunger 1
Bunny b1 Plays
true.

?- shiva_dance::tick.
Fox o5 lives
Fox o4 lives
Fox o3 lives
Fox o2 lives
Fox o1 lives
Bunny b2 has hunger 2
Bunny b1 has hunger 2
Bunny b1 Plays
true.

?- field::print_field.
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW  ^.^ WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW  ^.^ WWWW WWWW >:c. WWWW WWWW
WWWW WWWW  ^.^ WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW  ^.^ WWWW WWWW >:c. WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW  ^.^ WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW WWWW
true.
