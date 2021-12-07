require "pry"
class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        self.first_name + " " + self.last_name
    end

    def list_roles
        char_name = ''
        char_role = ''
     self.characters.all.map do |character|
        char_name << character.name
     end
     self.shows.all.map do |show|
        char_role << show.name
     end
     "#{char_name} - #{char_role}"
    end
end