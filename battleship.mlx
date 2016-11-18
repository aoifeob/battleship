playagain=

'y';
while

playagain=='y' %loop to restart the game if the user wants to play again
clc

%clears the screen to start a new game
grid=zeros(10,10);

%generates a 10x10 grid
for shiplength=1:1:5 %loop will generate 4 more ships
orientation=round(rand);

% determines horizontal or vertical
% pick random locations
if orientation == 1 %horizontal
while true
trial_x=round(rand*(length(grid)-shiplength))+1;

%determines x co-ordinate
trial_y=round(rand*9)+1;

%determines y co-ordinate
% place ship
counter = 0;

for i = 1:1:shiplength-1
counter = counter + grid(trial_x+i,trial_y);

end
if counter ==0;
break
end
end
grid(trial_x,trial_y)=shiplength;

for i = 1:1:shiplength-1
grid(trial_x+i,trial_y)=shiplength;

end
else % vertical
while true
trial_y=round(rand*(length(grid)-shiplength))+1;

%determines x co-ordinate
trial_x=round(rand*9)+1;

%determines y co-ordinate
% place ship
counter = 0;

for i = 1:1:shiplength-1
counter = counter + grid(trial_x,trial_y+i);

end
if counter ==0;
break
end
end
grid(trial_x,trial_y)=shiplength;

for i = 1:1:shiplength-1
grid(trial_x,trial_y+i)=shiplength;

end
end
end
gameover=

'n';
misses=0;

%stores the number of misses
hits=0;

%stores the number of hits
while gameover=='n'
userokay=

'n';
while userokay=='n'
user_x=input(

'Please enter the x co-ordinate you wish to fire at: ');
user_y=input(

'Please enter the y co-ordinate you wish to fire at: '); %asks user to input co-ordinates they wish to fire a missile at
if (user_x<11 && user_y<11 && user_x>0 && user_y>0)
userokay=

'y'; %makes sure the co-ordinates are on the grid
else disp('The co-ordinates you entered are not valid. Please try again')
end
end
if grid(user_x, user_y)==0
disp(

'Miss!') %displayed if the missile does not hit a ship
grid(user_x, user_y)=9;

%changes the 0 to a 9 so the program does not count the same miss twice
misses=misses+1;

%counts the number of misses
elseif grid(user_x, user_y)==8
disp(

'You previously entered these co-ordinates and already hit a ship.') %tells the user they already hit a ship at these co-ordinates
elseif grid(user_x, user_y)==9
disp(

'You previously entered these co-ordinates and did not hit a ship.') %tells the user they previously fired a missile at these co-ordinates and missed
else disp ('Hit!') %displayed if the missile hits a ship
grid(user_x, user_y)=8;

%changes that segment of the ship to an 8 to differentiate it from segments that have not been hit
hits=hits+1;

end
if hits==15
gameover=

'y'; %ends the game when all segments of all ships have been hit
end
end
sprintf(

'Game over! %f of your missiles missed before you sank all the battleships.', misses) %displays number of misses
playerokay=

'n';
while playerokay=='n' %checks the user inputs a valid response when asked to play again
playagain=input(

'Would you like to play again? y/n: '); %asks user if they want to play another game
num2str(playagain);

if playagain=='n'
disp(

'Thank you for playing.') %thanks the user for playing if they do not want to play another game
playerokay=

'y';
else
disp(

'That was not a valid selection.')
end
end
end
