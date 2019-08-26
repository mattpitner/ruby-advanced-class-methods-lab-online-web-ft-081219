require 'pry' 

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  # def artist_name=(name)
  #   @artist_name = name 
  # end 
  
  # def name 
  #   @name
  # end 
  
  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    song.save 
    song.name = name 
    song 
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song 
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save
    song 
  end 
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end 
  
  def self.new_from_filename(file_name)
    split_arr = file_name.split(" - ")
    artist_name = split_arr[0]
    song_title = split_arr[1].gsub(".mp3", "")
    song = self.new_by_name(song_title)
    song.artist_name = artist_name
    song
  end 
  
  def self.create_from_filename(file_name)
   song = new_from_filename(file_name)
   song.save
    
  end 
  
  def self.destroy_all
    @@all.clear   
  end 
  
end