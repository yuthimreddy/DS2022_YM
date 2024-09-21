#!/bin/bash

clear
echo "Let's build a mad-lib!"

read -p "1. Name a fruit: " NOUN1
read -p "2. Name an unusual vegetable: " NOUN2
read -p "3. Name an adjective to describe your best friend: " ADJ3
read -p "4. Name your second favorite fruit: " NOUN4
read -p "5. Name a adjective to describe your parents: " ADJ5
read -p "6. Name your favorite movie: " NOUN6
read -p "7. Name an adjective to describe your worst enemy: " ADJ7
read -p "8. Name an adjective to describe how you feel when you are with your friends: " ADJ8
echo " "

echo "The $NOUN1 is a mighty fruit. Fruits in general are far superior than vegetables. For instance, take the $NOUN2.
It can't hold a light to the $ADJ3 $NOUN1. But, if you combine the powers of $NOUN1 with $NOUN4, you get a brand new flavor.
The same $ADJ5 flavor that Remy talked about in everyone's favorite film, Ratatouille. Yeah, Ratatouille, the best movie ever.
Oh you thought your favorite movie is $NOUN6. WRONG. That $ADJ7 movie could never compare to the masterpiece that is Ratatouille.
Ratatouille is not just a movie, it evokes a great sense of $ADJ8. It's not just a movie, its a lifestyle."
