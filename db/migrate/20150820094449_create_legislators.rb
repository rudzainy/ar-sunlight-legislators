require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :title
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :name_suffix
      t.string :nickname
      t.string :party
      t.string :district
      t.boolean :in_office
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :congress_office
      t.string :bioguide_id
      t.string :votesmart_id
      t.string :fec_id
      t.string :govtrack_id
      t.string :crp_id
      t.string :twitter_id
      t.string :congresspedia_url
      t.string :youtube_url
      t.string :facebook_id
      t.string :official_rss
      t.string :senate_class
      t.date :birthdate
      t.timestamp null: false
    end

    create_table :states do |t|
      t.string :name # no.7 in array
    end

    create_table :political_parties do |t|
      t.string :name # no.8 in array
    end
  end
end