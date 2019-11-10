require_relative( "../models/book.rb" )   
require_relative( "../models/publisher.rb" )
require("pry-byebug")

Book.delete_all()
Publisher.delete_all()



book1 = Book.new({
  "title" => "The Winds of Winter",
  "author" => "G R R Martin",
  "description" => "The long-awaited fantasy novel set in Westeros",
  "stock_quantity" => 10,
  "buying_cost" => 5,
  "selling_price" => 10 ,
  "publisher_id" => publisher2.id ,

  book1.save


book2 = Book.new({
  "title" => "Northern Lights",
  "author" => "Philip Pullman",
  "description" => "The beginning of the His Dark Materials trilogy ",
  "stock_quantity" => 0,
  "buying_cost" => 6,
  "selling_price" => 10,
  "publisher_id" => publisher1.id ,

  book2.save


book3 = Book.new({
  "title" => "The Wolf Within",
  "author" => "Bryan Sykes",
  "description" => "An exploration of the history of dogs",
  "stock_quantity" => 10,
  "buying_cost" => 6,
  "selling_price" => 10,
  "publisher_id" => publisher2.id ,

  book3.save


book4 = Book.new({
  "title" => "Broad Band",
  "author" => "Claire L Evans",
  "description" => "A history of women's contributions to internet technologies",
  "stock_quantity" => 7,
  "buying_cost" => 6,
  "selling_price" => 12,
  "publisher_id" => publisher1.id ,

  book4.save


book5 = Book.new({
  "title" => "Invisible Women",
  "author" => "Caroline Criado Perez",
  "description" => "An exploration of gender and technological innovation",
  "stock_quantity" => 3,
  "buying_cost" => 6,
  "selling_price" => 12,
  "publisher_id" => publisher1.id ,

  book5.save


book6 = Book.new({
  "title" => "The Testaments",
  "author" => "Margaret Atwood",
  "description" => "The long-anticipated sequel to the Handmaid's Tale",
  "stock_quantity" => 4,
  "buying_cost" => 7,
  "selling_price" => 12,
  "publisher_id" => publisher3.id ,

  book6.save


book7 = Book.new({
  "title" => "The Beekeeper of Aleppo",
  "author" => "Christy Lefter",
  "description" => "A dramatic tale set during the Syrian Civil War",
  "stock_quantity" => 5,
  "buying_cost" => 7,
  "selling_price" => 10,
  "publisher_id" => publisher4.id ,

  book7.save


book8 = Book.new({
  "title" => "Time to Eat",
  "author" => "Nadiya Hussein",
  "description" => "An accessible cookbook for busy people",
  "stock_quantity" => 18,
  "buying_cost" => 7,
  "selling_price" => 10,
  "publisher_id" => publisher1.id ,

  book8.save


publisher1 = Publisher.new({
  "name" => "Penguin Books",
  "contact_details" => 01206256000
  })

publisher1.save

publisher2 = Publisher.new({
  "name" => "HarperCollins",
  "contact_details" => 01413063100
  })

publisher2.save

publisher3 = Publisher.new({
  "name" => "Vintage Publishing",
  "contact_details" => 01206256001
  })


publisher3.save


publisher4 = Publisher.new({
  "name" => "Zaffre Publishing",
  "contact_details" => 02074903875
  })

publisher4.save
