def pet_shop_name(petshop_hash)
  return petshop_hash[:name]
end

def total_cash(petshop_hash)
  return petshop_hash[:admin][:total_cash]
end

def add_or_remove_cash(petshop_hash, amount)
  petshop_hash[:admin][:total_cash] += amount
end

def pets_sold(petshop_hash)
  sold = petshop_hash[:admin][:pets_sold]
  return sold
end

def increase_pets_sold(petshop_hash, increase)
  petshop_hash[:admin][:pets_sold] += increase
end

def stock_count(petshop_hash)
  count = petshop_hash[:pets].length
  return count
end


def pets_by_breed(petshop_hash, breed)
#create an empty array to put the breed names in
  breed_count = []
#create some sort of shorthand to refer to the [:pets] array
  pets = petshop_hash[:pets]
#assign every animal in 'pets' a variable (a) and if the [:breed] for that animal (a) == the name you've plugged in ("Arthur" in this case), then shovel it into an array (called [breed_count in this case).
  for a in pets
    if a[:breed] == breed
      breed_count << breed
    end
  end
  #return breed_count outside of the function or it won't fill the array with all of them. Don't need to call the length of the array as the test will do it for you.
  return breed_count
end

def find_pet_by_name(petshop_hash, name)
 for pet in petshop_hash[:pets]
   if pet[:name] == name
     return pet
#pet returns the hash, then the test selects the :name key for us
   end
 end
 return nil
end

def remove_pet_by_name(petshop_hash, name)
  petshop_hash[:pets].delete_if { |animal| animal[:name] == name }
end
# #the test will run find_pet_by_name for us to check whether we have sucessfully removed Arthur.

def add_pet_to_stock(petshop_hash, new_pet_hash)
  petshop_hash[:pets] << new_pet_hash
end
#stock_count will be called for us in the test. Just need to add bors the younger to the array of hashes.

def customer_cash(customer)
  customer[:cash]
end
#note, only expects one parameter/argument

def remove_customer_cash(customer_index, amount)
  customer_index[:cash] -= amount
end
#don't need to return anything as ruby is just checking the customer cash again for the result.

def customer_pet_count(customer_index)
  customer_index[:pets].length
end
#need a result for 'count'
#remember, :pets is an array, need length of array for no. of pets

def add_pet_to_customer(customer_index, new_pet)
#need to add a new pet to a customer's :pets array
  customer_index[:pets] << new_pet
end


def customer_can_afford_pet(customer_index, new_pet)
#need to go to the specified customer and see what funds they have = customer_index[:cash]
#need to go to new_pet[:price]
#need to see if the funds are greater than or equal to the new_pet[:price]
#if customer_index[:cash] is less than new_pet[:price] then return false
#if customer_index[:cash] is greater than or equal to new_pet[:price], return true
if customer_index[:cash] < new_pet[:price]
  return false
elsif customer_index[:cash] >= new_pet[:price]
  return true
end

end

#if you find the Arthur hash in the petshop_hash
#AND
#there's enough cash in the customer's account - if the customer[:cash] is greater than or equal to the pet[:price]
#THEN
#shovel pet into the array
#add 1 to pets_sold
# take the pet[:price] away from the customer's cash
# add the pet[:price] the petshop's cash
#otherwise
#return nil & don't do any of those things
#pet = the hash of the pet being bought



def sell_pet_to_customer(petshop_hash, pet, customer)

  # if (petshop_hash[:pets].include?(pet)) && (customer_can_afford_pet == true)

  customer[:pets] << pet

  petshop_hash[:admin][:pets_sold] += 1

  customer[:cash] -= pet[:price]

  petshop_hash[:admin][:total_cash] += pet[:price]
  # else
  #   return nil
  # end

end
