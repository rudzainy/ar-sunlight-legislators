require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  belongs_to :state
  belongs_to :political_party
end