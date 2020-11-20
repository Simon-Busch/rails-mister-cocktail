# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"


Cocktail.destroy_all

COCKTAILS_URL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=gin"
result = JSON.parse(open(COCKTAILS_URL).read)

result["drinks"].each do |data|
  new_cocktail = Cocktail.create(name: data["strDrink"],
    img_url: data["strDrinkThumb"])
  i=1
  until i >5 do 
    new_ingredient = Ingredient.create(name: data["strIngredient#{i}"])
    i +=1
    dose = Dose.create(description: data["strMeasure#{i}"],
      cocktail_id: new_cocktail.id,
      ingredient_id: new_ingredient.id
    )
  end
  new_ingredient = Ingredient.create(name: data["strIngredient1"])
end


# Cocktail.destroy_all
# Ingredient.destroy_all
# Dose.destroy_all


# first_ingredient= Ingredient.create(name: "lemon")
# second_ingredient= Ingredient.create(name: "ice")
# third_ingredient= Ingredient.create(name: "Orange zest")

# first_cocktail = Cocktail.create(name: "Daikiri")
# first_cocktail.doses.create(description: "1 piece", ingredient_id: first_ingredient.id)
# second_cocktail = Cocktail.create(name: "Margarita")
# second_cocktail.doses.create(description: "2 cubes", ingredient_id: second_ingredient.id)
# third_cocktail = Cocktail.create(name: "Old fashionned")
# third_cocktail.doses.create(description: "shit load", ingredient_id: third_ingredient.id)

# Dose.create!(description: "1 piece", ingredient_id: first_ingredient.id, cocktail_id: first_cocktail.id)




# second_dose= Dose.new(description: "2 cubes")
# second_dose.ingredient_id = second_ingredient.id
# second_dose.cocktail_id = second_cocktail
# second_dose.save

# third_dose= Dose.new(description: "shit load")
# third_dose.ingredient_id = third_ingredient.id
# third_dose.cocktail_id = third_cocktail.id
# third_dose.save

# cocktail = Cocktail.create!(name: 'Daiquiri')
# lemon = Ingredient.create!(name: "lemon")
# dose = Dose.create!(description:"1 piece")
# dose.ingredient = lemon
# dose.cocktail = cocktail

# first = Dose.create!(description:"1 piece")
# first.ingredient = Ingredient.create!(name: "lemon")
# first.cocktail = Cocktail.create!(name: 'Daiquiri')

# second = Dose.create!(description:"3 cubes")
# second.ingredient = Ingredient.create!(name: "ice cube")
# second.cocktail = Cocktail.create!(name: 'Sex on the beach')

# third = Dose.create!(description:"shit load")
# third.ingredient = Ingredient.create!(name: "orange zest")
# third.cocktail = Cocktail.create!(name: 'Old fashionned')
 



# first = Cocktail.create(name: 'Daiquiri')
# first.ingredients = Ingredient.create(name: "lemon")
# first.ingredients.doses = Dose.create(description:"1 piece")

# second = Cocktail.create(name: 'Sex on the beach')
# second.ingredients = Ingredient.create(name: "ice")
# second.ingredients.doses = Dose.create(description:"3 cubes")

# third = Cocktail.create(name: 'Old fashionned')
# third.ingredients = Ingredient.create(name: "Orange zest")
# third.ingredients.doses = Dose.create(description:"Shit load")
