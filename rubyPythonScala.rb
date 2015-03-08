#!/usr/bin/env ruby

# Ruby Python Scala game (Rock, Paper, Scissors)
# Arad Reed

# Required for overwriting screen
require 'curses'

Curses.init_screen
Curses.echo

choices = ["ruby", "python", "scala"]
playing = true

games_total = 0
$games_scored = 0
$user_score = 0
$comp_score = 0

def comp_wins 
  Curses.setpos(4, 0)
  Curses.clrtoeol
  Curses.addstr "Computer wins.. :-("
  Curses.refresh
  $comp_score += 1
  $games_scored += 1
end

def user_wins
  Curses.setpos(4, 0)
  Curses.clrtoeol
  Curses.addstr "You win! :-D"
  Curses.refresh
  $user_score += 1
  $games_scored += 1
end

Curses.setpos(0,0)
Curses.addstr "Welcome to Ruby, Python, Scala!"
Curses.refresh

while (playing)
  choice = ""
  
  Curses.setpos(1, 0)
  
  Curses.addstr "You: #{$user_score} \t Computer: #{$comp_score} \t Games counted: #{$games_scored} \t Games: #{games_total}"
  Curses.refresh
  
  while (!choices.include? choice)
    Curses.setpos(3,0)
    Curses.clrtoeol
    Curses.addstr "Enter your choice (ruby, python, scala): "
    Curses.refresh
    choice = Curses.getstr()
  end 

  computerChoice = choices[Random.rand(3)]

  if (computerChoice == choice)
    Curses.setpos(4, 0)
    Curses.clrtoeol
    Curses.addstr "It's a tie -_-"
    Curses.refresh
  
  elsif (choice == "ruby")
    if (computerChoice == "python")
      comp_wins
    else
      user_wins
    end 
    
  elsif (choice == "scala")
    if (computerChoice == "ruby")
      comp_wins
    else
      user_wins
    end

  elsif (choice == "python")
    if (computerChoice == "scala")
      comp_wins
    else 
      user_wins
    end
  end 
  
  games_total += 1
end

Curses.close_screen