require_relative '../config'

class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets, id: false do |t|
      t.column :id, 'int(32) PRIMARY KEY'
      t.integer :legislator_id, null: false
      t.string :text
    end
  end
end