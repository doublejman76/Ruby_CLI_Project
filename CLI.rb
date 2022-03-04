

######################################################################
######################################################################
######                  Text Adventure Game
######1) Check if player is alive
######2) Let the player leave the room
######3) Check to see if a monster is in the room
######4) Allow searching for treasure
######5) Different types of rooms
######6) Random Number Generator
######7) Did we find treasure? - naming the treasure
######8) Monsters deal damage - health to zero = game over
######################################################################
######################################################################

def create_room
    "You are in a room. You see a door."
end

def treasure
    [
      "Gold", "Silver", "Diamonds", "Rubies"
    ].sample
end

### RNG GENERATOR ###
def roll_dice(number_of_dice, size_of_dice)
    total = 0
    1.upto(number_of_dice) do
        total = total + rand(size_of_dice) + 1
    end
    return total
end
############### DICE ROLLS ##########################
def has_monster?
    if roll_dice(2, 6) >= 8
        true
    else
        false    
    end
end
def has_escaped?
    if roll_dice(2, 6) >= 11
        true
    else
        false    
    end
end
def monster_attack?
    if roll_dice(2, 6) >= 9
        true
    else
        false    
    end
end
def defeat_monster?
    if roll_dice(2, 6) >= 2
        true
    else
        false    
    end
end
def has_treasure?
    if roll_dice(2, 6) >= 1
        true
    else
        false    
    end
end
############ Variables ############
number_of_rooms_explored = 1
treasure_count = 0
damage_points = 5
escaped = false
monster = 0
current_room = create_room

### New Game Introduction ###
puts "You are trapped in a dungeon. See if you can find treasure before you escape!"
puts "Watch out for monsters! They will get you!"
puts "To play, type one of the given commands."

############ Game Loop #####################
while damage_points > 0 and not escaped do

############################################  
############## Game code ###################
############################################

############# Player Actions ###############
actions = ["m - move", "s - search"]

puts "Room # #{number_of_rooms_explored}"
puts current_room


### Monster Encounter ###
        if has_monster?
           puts "Ahhhh! A monster!! A monster is approaching."
           actions << "f - fight"
    end

print "What do you do? (#{actions.join(',')}) : "

### Monster Attacks
    player_action = gets.chomp
        if monster and monster_attack?
            damage_points = damage_points -1
            puts "OUCH, you got hit!"
        end
### Player Commands
        if player_action == "m"
            current_room = create_room
            number_of_rooms_explored = number_of_rooms_explored + 1
            monster = has_monster?
            escaped = has_escaped?
        elsif player_action == "s"
            if has_treasure?
                puts "You have found #{treasure}!!"
                treasure_count = treasure_count + 1
            else
                puts "You searched, but you found nothing."    
            end
            #Rigged Condition - searching triggers monsters

            if not monster
                monster = has_monster?
            end
        elsif player_action == "f"
                if defeat_monster?
                    monster = false
                    puts "you defeated the monster!"
                else
                    puts "You missed!"    
                end
        else
            puts "Please follow directions, I need you to try harder."
        end
        puts ""
end

    if damage_points > 0
           puts "Good job, you made it!"
           puts "You explored #{number_of_rooms_explored} rooms."
           puts "and found #{treasure_count} treasures."
    else
           puts "Oh no! you didn't make it!"
           puts "You explored #{number_of_rooms_explored} rooms, before you died."
           puts "You tried so hard, and got so far...."
           puts "but in the end, it doesn't even matter..."
    end