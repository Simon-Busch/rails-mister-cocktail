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
