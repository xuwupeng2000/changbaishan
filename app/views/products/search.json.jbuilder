json.array! @products do |product|
  json.product_category_id product.product_category_id
  json.name product.name
  json.description product.description
  json.weight product.weight
end
