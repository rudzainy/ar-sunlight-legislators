require_relative '../../db/config'

class State < ActiveRecord::Base
  has_many :legislators
end