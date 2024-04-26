# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

s = Student.create(name: "Test Student")
a = Assignment.create(name: "Test Assignment")
sa = a.student_assignments.create(student: s)
sa.new_event("click-and-drag")
sa.new_event("clipboard")

s2 = Student.create(name: "Jacob Windle")
sa2 = a.student_assignments.create(student: s2)
