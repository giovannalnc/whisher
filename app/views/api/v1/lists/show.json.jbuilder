json.extract! @list, :id, :title
json.products @list.products do |product|
  json.extract! product, :id, :name, :price, :inventory, :photo, :url
  json.user do
    json.id product.user.id
    json.email product.user.email
  end
end
