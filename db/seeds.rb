# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ type: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "seeding database with tools..."
tools = Tool.create!([
  {
    name: "Hammer",
    description: "New hammer, never used",
    price: 10,
    postcode: "N7 9HF",
    image_url: "https://images.ffx.co.uk/tools/CLHF20.jpg?w=1280&h=960&scale=both",
    user_id: 1
  },
  { name: "Circular saw",
    description: "Circular saw in mint condition, complete with blade",
    price: 25,
    postcode: "SE28 0EL",
    image_url: "https://ik.imagekit.io/pimberly/5a573819182f915efb7bd083/b10a96d7/5b029b97c3a6660178c96faf.jpg",
    user_id: 1
  },
  { name: "Drill",
    description: "Makita cordless drill, 18v, 2 batteries, charger, case",
    price: 30,
    postcode: "SW3 3PX",
    image_url: "https://itslondon.s3.amazonaws.com/p/alt/xxl/MAK453SET52_2.jpg",
    user_id: 1
  },
  {
    name: "Axe",
    description: "Axe in good condition",
    price: 15,
    postcode: "E7 0EN",
    image_url: "https://cdn.shopify.com/s/files/1/0331/2805/4922/files/CGT05650_1_2048x2048.jpg?v=1612217326",
    user_id: 1
  },
  {
    name: "Clamp",
    description: "Clamp in good condition",
    price: 5,
    postcode: "NW3 5RN",
    image_url: "https://i5.walmartimages.com/asr/1466f16e-a7ac-4b56-8324-a91522f565d8_1.d35c799abde6ed00c68f49302e9da608.jpeg",
    user_id: 1
  }
])
puts "done!"
