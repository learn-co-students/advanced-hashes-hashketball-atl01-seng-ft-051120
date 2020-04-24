require 'pry'

def game_hash
 {
   :home => {
     :team_name => "Brooklyn Nets",
      :colors => ['Black', 'White'],
      :players => [ 
        { :player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 },
        { :player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7 },
        { :player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15 },
        { :player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5 },
        { :player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1 }
        ]
   },
   :away => {
     :team_name => "Charlotte Hornets",
      :colors => ['Turquoise', 'Purple'],
      :players => [
        { :player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2 },
        { :player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10 },
        { :player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5 },
        { :player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 },
        { :player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12 }
        ]
   }
 }
end

def team_colors(name)
  game_hash.each do |homeAway, upkeys|
    upkeys.each do |key, value|
      if name == value 
        return game_hash[homeAway][:colors]
      end
    end
  end
end

=begin
def team_colors(name)
  if game_hash[:home][:team_name] == name 
    game_hash[:home][:colors]
  else 
    game_hash[:away][:colors]
  end 
end 
=end 

=begin
def team_names
  teams = []
  game_hash.each do |homeAway, upkeys|
    upkeys.each do |key, value|
      if key == :team_name
      teams.push(value)
      end
    end
  end
  teams
end
=end 


def team_names 
  teams = []
  game_hash.each do |key, value| 
    teams.push(game_hash[key][:team_name])
  end 
  teams
end 


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Array) && data.length > 2
      data.each do |data_item|
        data_item.each do |innerkey, innervalue|
        if innervalue == player_name
          data_item.delete(:player_name)
          return data_item
        end
        end
      end
      end
    end
  end
end


def num_points_scored(player)
  stats = player_stats(player)
  stats.each do |key, value|
    if key == :points
      return value
    end
  end
end 


def shoe_size(player)
  stats = player_stats(player)
  stats.each do |key, value|
    if key == :shoe
      return value
    end
  end
end 

def player_numbers(team)
  teamJs = []
  awayJs = []
  if team == game_hash[:home][:team_name]
    game_hash[:home][:players].each do |hash|
      hash.each do |key, value|
        if key == :number 
          teamJs.push(value)
        end
      end
    end
      teamJs
  else
    game_hash[:away][:players].each do |hash|
      hash.each do |key, value|
        if key == :number
          awayJs.push(value)
        end
      end
    end
    awayJs
  end
end

def big_shoe_rebounds 
  bigfoot = 0 
  rebounds = 0 
  game_hash.each do |homeAway, upkeys|
    upkeys[:players].each do |hash| 
      if hash[:shoe] >= bigfoot
        bigfoot = hash[:shoe]
        rebounds = hash[:rebounds]
      end
    end
  end 
  rebounds
end

def most_points_scored 
  highScore = 0 
  coolDude = nil 
  game_hash.each do |homeAway, upkeys|
    upkeys[:players].each do |innerHash|
      if innerHash[:points] >= highScore
        highScore = innerHash[:points]
        coolDude = innerHash[:player_name]
      end 
    end
  end 
  coolDude
end 

def winning_team 
  home = []
  homeName = game_hash[:home][:team_name]
  away = []
  awayName = game_hash[:away][:team_name]
  game_hash[:home][:players].each do |hash|
    home.push(hash[:points])
  end 
  game_hash[:away][:players].each do |hash|
    away.push(hash[:points])
  end 
  if home.sum > away.sum
    homeName
  else 
    awayName
  end
end 

def player_with_longest_name 
  looong = ''
  game_hash.each do |homeAway, upkeys|
    upkeys[:players].each do |hash|
      hash.each do |key, value| 
        if key == :player_name 
          if value.length >= looong.length
            looong = value 
          end 
        end 
      end
    end 
  end 
  looong
end

def long_name_steals_a_ton? 
  highsteals = 0 
  highstealer = nil
  player = player_with_longest_name
  game_hash.each do |homeAway, upkeys|
    upkeys[:players].each do |hash|
      hash.each do |key, value|
        if key == :steals && value >= highsteals
          highsteals = value
          highstealer = hash[:player_name]
        end 
      end 
    end 
  end 
  if player == highstealer
    true
  end
end 
        
  

            
  


