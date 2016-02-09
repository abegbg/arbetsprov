# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({ name: "Admin", email: "admin@admin.se", password: 'admin', superuser: 1 })

Product.create({name: "Vinterjacka", description: "Blå jacka som är varm och skön även de kallaste dagarna på vinter.", price: 1750, stock: 10, image: "jacka.jpg"})
product = Product.create({name: "Vinterkänga", description: "Vinterkänga som ger en stabil grund att stå på.", price: 3550, stock: 50, image: "kanga.jpg"})
Product.create({name: "Långkalsong i ull", description: "Varm långkalsong i rätt material. Mer text kanske det behövs", price: 495, stock: 1, image: ""})
Product.create({name: "Sovsäck", description: "Sovsäck som fungerar ner till -10 grader.", price: 795, stock: 20, image: "sovsack.jpg"})
Product.create({name: "Vante för barn", description: "Bra vante för de minsta. Fungerar med en liten innervante.", price: 395, stock: 35, image: "vante.jpg"})
Product.create({name: "Skidhandske", description: "Handske för de som gillar längdskidåkning.", price: 495, stock: 75, image: "skidhandske.jpg"})
Product.create({name: "Ryggsäck Kånken", description: "Klassisk ryggsäck från Fjällräven.", price: 795, stock: 12, image: "raven.jpg"})
Product.create({name: "Tält", description: "Dags att sova ute. Gör det med stil.", price: 1995, stock: 45, image: "talt.jpg"})
Product.create({name: "Klocka", description: "Med detta ur kan du vara ute i ur och skur. Göteborg FTW!", price: 2995, stock: 65, image: "klocka.jpg"})
Product.create({name: "Produkt utan bild", description: "Har en produkt ingen bild får den en placeholder.", price: 1, stock: 12, image: ""})
#Product.create({})

order = Order.create({name: "Carl Abelin", adress: "KÄRRSTORPS GÅRD 154", co: "", zipcode: "39591", city: "KALMAR", country: "Sverige", d_adress: "", d_co: "", d_city: "", d_country: "", d_zipcode: "", email: "carl.abelin@gmail.com", mobile: "+46707559921", status: "Ny"})
orderrow = Orderrow.create({order_id: order.id, product_id: product.id, quantity: 1, sent_quantity: 0})