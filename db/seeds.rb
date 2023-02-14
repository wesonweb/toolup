# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ type: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning database..."
Booking.destroy_all
Tool.destroy_all
puts "seeding database with tools..."
tools = Tool.create!([
  {
    name: "Drill",
    description: "DeWalt cordless drill, with two batteries. 50 minute quick charge. Comes with case.",
    price: 15,
    address: "72 Park Avenue, London",
    image_url: "https://www.toolup.com/product-images/DeWalt-DCD940KX_10.jpg",
    user_id: 1
  },
  { name: "Circular saw",
    description: "DeWalt circular saw, 240v, 165mm blade. Comes with 2 batteries, charger and case",
    price: 25,
    address: "98 Station Road, London",
    image_url: "https://www.neoadviser.com/wp-content/uploads/2019/01/1-1.jpg",
    user_id: 1
  },
  { name: "Drill",
    description: "Makita cordless drill, 18v, 2 batteries, charger, case",
    price: 20,
    address: "81 The Crescent, London",
    image_url: "https://itslondon.s3.amazonaws.com/p/alt/xxl/MAK453SET52_2.jpg",
    user_id: 1
  },
  {
    name: "Jigsaw",
    description: "Bosch Electric Jigsaw. 500W motor and 70 mm cutting depth.",
    price: 10,
    address: "382 Kings Road, London",
    image_url: "https://cdn.store-assets.com/s/14425/i/2766186.gif",
    user_id: 1
  },
  {
    name: "Clamp",
    description: "Clamp in good condition",
    price: 5,
    address: "6 The Grove, London",
    image_url: "https://i5.walmartimages.com/asr/1466f16e-a7ac-4b56-8324-a91522f565d8_1.d35c799abde6ed00c68f49302e9da608.jpeg",
    user_id: 1
  },
  {
    name: "Lawnmower",
    description: "Good quality electric lawnmower. Comes with 20m extension lead",
    price: 25,
    address: "97 Church Street, London",
    image_url: "https://www.thespruce.com/thmb/qE5BgnZM0088uSs6NJ7UAmuo8iY=/1500x1500/filters:fill(auto,1)/1SP4142310-Greenworks-Push-Mower_HeroSquare-c25b5e052ed74bfa9f17112eb6da5dc2.jpg",
    user_id: 1
  },
  {
    name: "Leaf blower",
    description: "Powerful leaf blower, great for clearing up fallen leaves in the garden",
    price: 10,
    address: "32 waterfall road, london",
    image_url: "https://www.chartattack.com/wp-content/uploads/2019/09/leaf.jpg",
    user_id: 1
  },
  {
    name: "Sander",
    description: "Hand-held sander. Variable speed and dust bag for dust extraction. Comes with sanding discs",
    price: 10,
    address: "12 Luxor Street, London",
    image_url: "https://images-na.ssl-images-amazon.com/images/I/71mgCg-MfyL.jpg",
    user_id: 1
  }
])
puts "Created tools!"
