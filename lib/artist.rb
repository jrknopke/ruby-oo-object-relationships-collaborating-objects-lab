require 'pry'
class Artist
    attr_accessor :name, :artist
    attr_writer :songs
    
    @@all = []

    def initialize(name)
        @songs = []
        @name = name
        save
    end

    def add_song(song)
        song.artist = self 
        @songs << song
    end

    # return array of all songs that belong to instance of Artist 
    def songs
        artist_songs = []
        Song.all.each do |song|
             if song.artist == self
                artist_songs << song
             end
         end
        artist_songs
    end
    
    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        self.all.find {|artist| artist.name == name} || Artist.new(name)
    end

    def print_songs
        @songs.each{|song| puts song.name}
    end
end