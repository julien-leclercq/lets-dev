User.destroy_all
Desk.destroy_all
DeskUserMembership.destroy_all

users = %w(arnaud berenger danny elie samuel sofiane)

puts 'Creating users'
database_users = users.map do |u|
  puts "    #{u}"
  user = User.new(
      username: u,
      email: "#{u}@lets-dev.fr",
      password: "#{u}@lets-dev.fr",
      password_confirmation: "#{u}@lets-dev.fr",
      confirmed_at: Time.now)
  user.skip_confirmation!
  user.save
  user
end

puts 'Creating current desk'
current_desk = Desk.create(started_at: Time.now - 6.months, ended_at: Time.now + 6.months)
puts "Adding #{database_users.last.username} to current desk"
DeskUserMembership.create(desk: current_desk, user: database_users.last)
