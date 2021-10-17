
## Seeding for all the basic functionalities.


puts 'seeding for all the basic functionalities'

#USERS
puts 'seeding users'

restaurant_user_1 = User.new(email: 'r1@gmail.com', encrypted_password: '123456', password: '123456')
restaurant_user_1.save!

restaurant_user_2 = User.new(email: 'r2@gmail.com', encrypted_password: '123456', password: '123456')
restaurant_user_2.save!

#RESTAURANTS
puts 'seeding 2 restaurants'

padaria_do_zeze = Restaurant.new(name: 'Padaria do Zezé', address: 'Rua do Amial 15, Porto, Portugal', user_id: 1)
padaria_do_zeze.save!

fruteira_do_pele = Restaurant.new(name: 'Fruteira do Pelé', address: 'Rua do Amial 50, Porto, Portugal', user_id: 2)
fruteira_do_pele.save!


## BASKETS
puts 'seeding baskets. 3 for each restaurant'

puts 'padaria do zezé:'
basket_p_1 = Basket.new(name: 'Cesta de Pães', pickup_min: Time.now, pickup_max: Time.now + 1, price: 789, description: 'cesta de aproximadamente 1kg com pães variados', stock: 3, restaurant: padaria_do_zeze)
basket_p_1.save!

basket_p_2 = Basket.new(name: 'Cesta de Doces', pickup_min: Time.now, pickup_max: Time.now + 1, price: 789, description: 'cesta de aproximadamente 500g com doces variados', stock: 3, restaurant: padaria_do_zeze)
basket_p_1.save!


basket_p_3 = Basket.new(name: 'Cesta de Salgados', pickup_min: Time.now, pickup_max: Time.now + 1, price: 789, description: 'cesta de aproximadamente 1kg com salgados variados que sobraram durante o dia', stock: 3, restaurant: padaria_do_zeze)
basket_p_1.save!



puts 'fruteira do pelé:'
basket_f_1 = Basket.new(name: 'Cesta de Frutas', pickup_min: Time.now, pickup_max: Time.now + 1, price: 789, description: 'cesta de aproximadamente 1kg com diversas frutas em bom estado', stock: 3, restaurant: fruteira_do_pele)
basket_f_1.save!

basket_f_2 = Basket.new(name: 'Cesta de Verduras', pickup_min: Time.now, pickup_max: Time.now + 1, price: 789, description: 'cesta de aproximadamente 500g com verduras variadas que sobraram durante o dia', stock: 3, restaurant: fruteira_do_pele)
basket_f_2.save!

basket_f_3 = Basket.new(name: 'Cesta família ', pickup_min: Time.now, pickup_max: Time.now + 1, price: 789, description: 'cesta de aproximadamente 1kg com frutas e verduras variados que sobraram durante o dia', stock: 3, restaurant: fruteira_do_pele)
basket_f_3.save!



#TAGS

puts 'seeding tags'
tag1 = Tag.new(name: 'pães')
tag1.save!

tag2 = Tag.new(name: 'bolos')
tag2.save!

tag3 = Tag.new(name: 'salgados')
tag3.save!

tag4 = Tag.new(name: 'doces')
tag4.save!

tag5 = Tag.new(name: 'frutas')
tag5.save!

tag6 = Tag.new(name: 'verduras')
tag6.save!


#BASKET-TAGS

puts 'linking baskets to tags'

BasketTag.create(basket: basket_p_1, tag:tag1)
BasketTag.create(basket: basket_p_2, tag:tag4)
BasketTag.create(basket: basket_p_3, tag:tag3)
BasketTag.create(basket: basket_f_1, tag:tag5)
BasketTag.create(basket: basket_f_2, tag:tag6)
BasketTag.create(basket: basket_f_3, tag:tag5)
