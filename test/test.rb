require_relative '../app/models/legislator'
require_relative '../app/models/rep'
require_relative '../app/models/sen'

p "Finding reps and sens of a state"
reps = Rep.where(state: "TX")
sens = Sen.where(state: "TX")

reps.each { |x| p "name: #{x.firstname} state: #{x.state} title: #{x.title}" }
sens.each { |x| p "name: #{x.firstname} state: #{x.state} title: #{x.title}" }
puts

p "Finding reps and sens of a political party"
reps = Rep.where(party: "D")
sens = Sen.where(party: "D")

reps.each { |x| p "name: #{x.firstname} party: #{x.party} title: #{x.title}" }
sens.each { |x| p "name: #{x.firstname} party: #{x.party} title: #{x.title}" }
puts

p "Finding info of a given sen/rep"
rep = Rep.all.sample
sen = Sen.all.sample

p "#name: {rep.firstname} phone: #{rep.phone} fax: #{rep.fax} website: #{rep.website} webform: #{rep.webform} party: #{rep.party} gender: #{rep.gender} birthdate: #{rep.birthdate} twitter_id: #{rep.twitter_id}"

p "#name: {sen.firstname} phone: #{sen.phone} fax: #{sen.fax} website: #{sen.website} webform: #{sen.webform} party: #{sen.party} gender: #{sen.gender} birthdate: #{sen.birthdate} twitter_id: #{sen.twitter_id}"
