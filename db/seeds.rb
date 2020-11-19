# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_ingredient= Ingredient.create(name: "lemon")
second_ingredient= Ingredient.create(name: "ice")
third_ingredient= Ingredient.create(name: "mint leaves")

first_cocktail = Cocktail.create(name: "Daikiri")
first_cocktail.doses.create(description: "1 piece", ingredient_id: first_ingredient.id)
second_cocktail = Cocktail.create(name: "Margarita")
second_cocktail.doses.create(description: "2 cubes", ingredient_id: second_ingredient.id)
third_cocktail = Cocktail.create(name: "Old fashionned")
third_cocktail.doses.create(description: "shit load", ingredient_id: third_ingredient.id)
