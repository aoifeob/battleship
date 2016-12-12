playagain='y';
while playagain=='y'%loop to restart the game if the user wants to play again

grid=zeros(10,10) %generates a 10x10 grid

shiplength_1=6; %length of the first ship
shipfits='n'; %flag variable
while shipfits=='n'; %generates co-ordinates until the ship fits the grid
    trial_x=round(rand*9)+1; %determines x co-ordinate of ship
    trial_y=round(rand*9)+1; %determines y co-ordinate of ship
    orientation=round(rand); %determines whether ship is horizontal (1) or vertical (0)
    if (trial_x + shiplength_1)*(orientation)<11 && (trial_y + shiplength_1)*(1-orientation)<11
        shipfits='y'; %ends the loop when the ship fits
    end
end

for i=0:shiplength_1-1 
    if orientation==0
grid(trial_x, trial_y+i)=1;
    else
        grid(trial_x+i, trial_y)=1;
    end
end %places the ship on the grid, replacing 0 elements of the matrix with 1 elements

for shiplength=2:5 %loop will generate 4 more ships
    shipfits='n'; %flag variable
    while shipfits=='n'
        trial_x=round(rand*9)+1; %determines x co-ordinate
        trial_y=round(rand*9)+1; %determines y co-ordinate
        orientation=round(rand); % determines horizontal or vertical
        offset=0; 
        while offset<=shiplength&&shipfits=='y' %this loop ensures no ships are in the way before placing a ship
            if(grid(trial_x+offset, trial_y)==1 || grid(trial_x, trial_y+offset)==1)
                shipfits=='n'
                shiplength=shiplength-1; %this is here so a ship length won't be missed.
            end
            offset=offset+1;
        end
        for j=0:shiplength-1 %places the ship on the grid, replacing the 0 in the matrix with a number corresponding to the length of the ship
            if orientation==0
                grid(trial_x, trial_y+j)=shiplength;
            else grid(trial_x+j, trial_y)=shiplength;
            end
        end
    end
end

    user_x=input('Please enter the x co-ordinate you wish to fire at: ');
    user_y=inpuy('Please enter the y co-ordinate you wish to fire at: '); %asks user to input co-ordinates they wish to fire a missile at
    goes=0; %stores the number of misses
    if grid(user_x, user_y)==0
        disp('Miss!'); %displayed if the missile does not hit a ship
        grid(user_x, user_y)=9; %changes the 0 to a 9 so the program does not count the same miss twice
        goes=goes+1; %counts the number of misses
    elseif grid(user_x, user_y)==8
        disp('You previously entered these co-ordinates and already hit a ship.'); %tells the user they already hit a ship at these co-ordinates
    elseif grid(user_x, user_y)==9
        disp('You previously entered these co-ordinates and did not hit a ship.'); %tells the user they previously fired a missile at these co-ordinates and missed
    else disp ('Hit!'); %displayed if the missile hits a ship
        grid(user_x, user_y)=8; %changes that segment of the ship to an 8 to differentiate it from segments that have not been hit
    end
end

%endgame code
sprintf('Game over!  %f of your missiles missed before you sank all the battleships.', goes); %displays number of misses
playagain=input('Would you like to play again? y/n'); %asks user if they want to play another game
if playagain=='n'
    disp('Thank you for playing.'); %thanks the user for playing if they do not want to play another game
end