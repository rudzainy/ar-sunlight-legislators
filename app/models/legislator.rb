require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  self.inheritance_column = :title
end