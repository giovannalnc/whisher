puts "Cleaning database..."

Product.delete_all
List.delete_all
User.destroy_all

puts 'Creating users...'
mariana = User.create!(email: 'mariana@wisher.com', password: 123123 )
#lucas = User.create!(email: 'lucas@wisher.com', password: 123123 )
#julia = User.create!(email: 'julia@wisher.com', password: 123123 )

puts 'Creating lists...'
harry_potter_books = List.create!(user: mariana, title: 'Harry Potter Books')
couchs = List.create!(user: mariana, title: 'Couchs')
boardgames = List.create!(user: mariana, title: 'Boardgames')
wardrobe = List.create!(user: mariana, title: 'Wardrobe')
desks = List.create!(user: mariana, title: 'Desks')
decor = List.create!(user: mariana, title: 'Decor')

leitura_hp_urls = ['https://leitura.com.br/harry-potter-e-a-camara-secreta-rocco-L999-9788532511669?search=harry%20potter', 'https://leitura.com.br/harry-potter-e-a-camara-secreta-L999-9788532530790?search=harry%20potter', 'https://leitura.com.br/harry-potter-e-o-prisioneiro-de-azkaban-L999-9788532512062?search=harry%20potter']

madeira_couchs_urls = ['https://www.madeiramadeira.com.br/sofa-prime-5-lugares-retratil-reclinavel-2-50m-com-molas-yescasa-629167.html?index=vr-prod-poc-madeira-listings-best-seller-desc', 'https://www.madeiramadeira.com.br/sofa-cama-melissa-3-lugares-180cm-viero-648372.html?index=vr-prod-poc-madeira-listings-best-seller-desc', 'https://www.madeiramadeira.com.br/sofa-3-lugares-retratil-1-80m-smart-yescasa-668037.html?index=vr-prod-poc-madeira-listings-best-seller-desc']

leitura_bgames_urls = ['https://leitura.com.br/jogo-dixit-odyssey-dix03b-galapagos-L096-7898576717414', 'https://leitura.com.br/rising-sun-boardgame-L034-7898572673059', 'https://leitura.com.br/jogo-de-tabuleiro-tiranos-de-underdark-L027-7899834055491']

madeira_wardrobe_urls = ['https://www.madeiramadeira.com.br/guarda-roupa-casal-com-espelho-3-portas-8-gavetas-spazzio-yescasa-329350.html?index=vr-prod-poc-madeira-listings-best-seller-desc', 'https://www.madeiramadeira.com.br/guarda-roupa-casal-3-portas-6-gavetas-spazio-moveis-lopas-517288.html?index=vr-prod-poc-madeira-listings-best-seller-desc', 'https://www.madeiramadeira.com.br/guarda-roupa-casal-2-portas-de-correr-6-gavetas-toronto-plus-moveis-lopas-517296.html?index=vr-prod-poc-madeira-listings-best-seller-desc']

madeira_desks_urls = ['https://www.madeiramadeira.com.br/escrivaninha-120cm-porto-espresso-moveis-481473.html?index=vr-prod-poc-madeira-listings-best-seller-desc', 'https://www.madeiramadeira.com.br/escrivaninha-industrial-slim-yescasa-617263.html?index=vr-prod-poc-madeira-listings-best-seller-desc', 'https://www.madeiramadeira.com.br/escrivaninha-2-nichos-retro-hanover-politorno-269342.html?index=vr-prod-poc-madeira-listings-best-seller-desc']

madeira_decor_urls = ['https://www.madeiramadeira.com.br/conjunto-kit-5-quadros-decorativos-geometrico-rose-gold-quarto-sala-2625631.html?index=vr-prod-poc-madeira-listings-best-seller-desc', 'https://www.madeiramadeira.com.br/conjunto-kit-6-quadros-decorativos-amarelo-cinza-e-preto-geometrico-quarto-sala-2638159.html?index=vr-prod-poc-madeira-listings-best-seller-desc', 'https://www.madeiramadeira.com.br/quadro-mosaico-paisagem-verde-5-pecas-1-20x0-70cm-2247670.html?index=vr-prod-poc-madeira-listings-best-seller-desc']

lists = [harry_potter_books, couchs, boardgames, wardrobe, desks, decor]

lists.each do |list|
  if list.title == 'Harry Potter Books'
    leitura_hp_urls.each { |url| Product.create!(url: url, list: list) }
  elsif list.title == 'Couchs'
    madeira_couchs_urls.each { |url| Product.create!(url: url, list: list) }
  elsif list.title == 'Boardgames'
    leitura_bgames_urls.each { |url| Product.create!(url: url, list: list) }
  elsif list.title == 'Wardrobe'
    madeira_wardrobe_urls.each { |url| Product.create!(url: url, list: list) }
  elsif list.title == 'Desks'
    madeira_desks_urls.each { |url| Product.create!(url: url, list: list) }
  elsif list.title == 'Decor'
    madeira_decor_urls.each { |url| Product.create!(url: url, list: list) }
  else
    puts "deu ruim"
  end
end

puts "#{User.count} Users created"
puts "#{List.count} Lists created"
puts "#{Product.count} Products created"

puts "seeds done"
