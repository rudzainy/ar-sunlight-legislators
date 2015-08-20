require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  self.inheritance_column = :title

  def name
    @name = ""
    @name += self.firstname unless self.firstname.nil?
    @name += " " + self.middlename unless self.middlename.nil?
    @name += " " + self.lastname  unless self.lastname.nil?
  end
end