Product.delete_all
List.delete_all
User.destroy_all
user1 = User.create!(name: 'Jessica', email: 'jessica@wisher.com', password: 123123 )
user2 = User.create!(name: 'Julia', email: 'julia@wisher.com', password: 123123 )
user3 = User.create!(name: 'Jão', email: 'jao@wisher.com', password: 123123 )

list1 = List.create!(user: user1, title: 'list1')
list2 = List.create!(user: user3, title: 'list2')
list3 = List.create!(user: user1, title: 'list3')

product1 = Product.create!(name: 'book', price: '39.90', inventory: 87, list: list1)
product2 = Product.create!(name: 'kindle', price: '49.90', inventory: 77, list: list1)
product3 = Product.create!(name: 'earphone', price: '59.90', inventory: 67, list: list1)
product4 = Product.create!(name: 'wine', price: '39.90', inventory: 57, list: list1)
product5 = Product.create!(name: 'whiskey', price: '39.90', inventory: 47, list: list2)
product6 = Product.create!(name: 'watch', price: '99.90', inventory: 37, list: list2)
product7 = Product.create!(name: 'airjordan', price: '399.90', inventory: 27, list: list3)
product8 = Product.create!(name: 'smartphone', price: '599.90', inventory: 17, list: list3)
product9 = Product.create!(name: 'notebook', price: '999.90', inventory: 07, list: list2)





puts "#{User.count} Users created"
puts "#{List.count} Lists created"
puts "#{Product.count} Bloods created"

puts "seeds done"
