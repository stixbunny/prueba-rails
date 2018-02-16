# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all
10.times do |i|
  if i.even?
    # comp = ☑
    comp = true
  else
    #comp = ☐
    comp = false
  end
  Todo.create(description: "Soy la tarea #{i}", completed: comp)
end
