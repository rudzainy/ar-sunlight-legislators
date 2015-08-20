require_relative 'models/legislator'
require_relative 'models/rep'
require_relative 'models/sen'
require_relative 'models/del'
require_relative 'models/com'

print "Enter a state code (2 letters)"
state = gets.chomp.upcase

p "Senators:"
sens = Sen.where(state: state).order(lastname: :desc)
sens.each do |sen|
  p "  #{sen.name} (#{sen.party})"
end
p "Representatives:"
reps = Rep.where(state: state).order(lastname: :desc)
reps.each do |rep|
  p "  #{rep.name} (#{rep.party})"
end
puts

sens_in_office = Sen.where(in_office: true)
reps_in_office = Rep.where(in_office: true)

male_sens = sens_in_office.where(gender: "M")
female_sens = sens_in_office.where(gender: "F")
male_reps = reps_in_office.where(gender: "M")
female_reps = reps_in_office.where(gender: "F")

num_male_reps = male_reps.all.count
num_female_reps = female_reps.all.count
num_male_sens = male_sens.all.count
num_female_sens = female_sens.all.count

gender = gets.chomp.downcase

total_senators = num_male_sens + num_female_sens
total_representatives = num_male_reps + num_female_reps

if (gender == "f" || gender == "female")
  sens_percentage = (num_female_sens.to_f / total_senators.to_f * 100).round(2)
  puts "Female Senators: #{num_female_sens} (#{sens_percentage}%)"
  reps_percentage = (num_female_reps.to_f / total_representatives.to_f * 100).round(2)
  puts "Female Representatives: #{num_female_reps} (#{reps_percentage}%)"

elsif (gender == "m" || gender == "male")
  sens_percentage = (num_male_sens.to_f / total_senators.to_f * 100).round(2)
  puts "Male Senators: #{num_male_sens} (#{sens_percentage}%)"
  reps_percentage = (num_male_reps.to_f / total_representatives.to_f * 100).round(2)
  puts "Male Representatives: #{num_male_reps} (#{reps_percentage}%)"
end
puts

state_reps = Rep.where(in_office: true).group(:state).order(state: :asc).count
state_sens = Sen.where(in_office: true).group(:state).order(state: :asc).count
puts

state_sens.each do |state|
  puts "#{state[0]}: #{state[1]} Senators, #{state_reps[state[0]]} Representatives"
end
puts

p "Senators: #{Sen.all.count}"
p "Representatives: #{Rep.all.count}"

Legislator.delete_all(in_office: false)
puts

p "Senators: #{Sen.all.count}"
p "Representatives: #{Rep.all.count}"
