#####################################################################################
# Add other data
#####################################################################################

# Order status
odrs = []
OrderStatus.delete_all # pas bon pour prod
odrs.push( OrderStatus.create id: 1, name: "In Progress" )
odrs.push( OrderStatus.create id: 2, name: "Placed" )
odrs.push( OrderStatus.create id: 3, name: "Shipped" )
odrs.push( OrderStatus.create id: 4, name: "Cancelled" )

odrs.each do |i|
    if not i.save()
        puts i.errors.full_messages
    end
end

# Categories
categories = []
Category.delete_all
categories.push(Category.create id: 1, name: "Architecture")
categories.push(Category.create id: 2, name: "Animals")
categories.push(Category.create id: 3, name: "People")
categories.push(Category.create id: 4, name: "Gaming")
categories.push(Category.create id: 5, name: "TV Show")
categories.push(Category.create id: 6, name: "Science Fiction")
categories.push(Category.create id: 7, name: "Others")

categories.each do |i|
    if not i.save()
        puts i.errors.full_messages
    end
end

#####################################################################################
# Add basic items
#####################################################################################

#user 
User.delete_all #pas bon pour prod

user = User.create :firstname => 'Master', lastname: 'Absolute', phone_number: '5145559999', :email => 'master@master.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user.save()

categories = []
categories.push(Category.find(6))

items_list = []
image = File.open(File.join(Rails.root, 'images/cloneTrooper.jpg'))
items_list.push(Item.create user: user, name: 'CloneTrooper', price: '59.99',description: 'A badass republic commando clone trooper from star wars', 
                preview_description: 'Clone Trooper (textured)',image_file_name: 'cloneTrooper.jpg', image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/stormtrooper_helmet.jpg'))
items_list.push(Item.create user: user, name: 'Stormtrooper helmet', price: '39.99',description: 'A badass stormtrooper helmet', 
                preview_description: 'Stormtrooper helmet (textured)',image_file_name: 'stormtrooper_helmet.jpg', image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/darth-vader-tie-fighter.jpg'))
items_list.push( Item.create user: user, name: 'Tie Fighter', price: '19.99',description: 'Darth vader X1 TIE fighter', 
              preview_description: 'Tie Fighter X1 (textured)',image_file_name: 'darth-vader-tie-fighter.jpg',image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/defender.jpg'))
items_list.push( Item.create user: user, name: 'Defender', price: '19.99',description: 'Star trek defender ship class attack ship', 
              preview_description: 'Star trek defender class ship',image_file_name: 'defender.jpg',image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/enteprise.jpg'))
items_list.push( Item.create user: user, name: 'Enteprise', price: '29.99',description: 'Star trek Enteprise fisrt generation, remasterd', 
              preview_description: 'Star trek Enteprise (textured)',image_file_name: 'enteprise.jpg',image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/shuttle.jpg'))
items_list.push( Item.create user: user, name: 'Shuttle', price: '19.99',description: 'Star trek Shuttle fisrt generation, remasterd', 
              preview_description: 'Star trek Shuttle',image_file_name: 'shuttle.jpg',image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/spiderDroid.jpeg'))
items_list.push( Item.create user: user, name: 'SpiderDroid', price: '39.99',description: 'Star Wars spider droid episode II', 
              preview_description: 'Star Wars spider droid episode II (textured)',image_file_name: 'spiderDroid.jpeg',image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/terminator.jpg'))
items_list.push( Item.create user: user, name: 'Terminator', price: '59.99',description: 'Terminator T-800 endoskeleton', 
              preview_description: 'Termiantor(textured)',image_file_name: 'terminator.jpg',image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/terminatorArm.png'))
items_list.push( Item.create user: user, name: 'Terminator Arm', price: '49.99',description: 'Terminator II T-800 arm', 
              preview_description: 'Termiantor Arm',image_file_name: 'terminatorArm.png',image: image,
                categories: categories)

categories = []
categories.push(Category.find(2))
categories.push(Category.find(5))

image = File.open(File.join(Rails.root, 'images/lionKing.gif'))
items_list.push( Item.create user: user, name: 'lion king', price: '19.99',description: 'Lion king from the lion king', 
              preview_description: 'Lion King from the disney film Lion King (textured)',image_file_name: 'lionKing.gif',image: image,
                categories: categories)

image = File.open(File.join(Rails.root, 'images/Scar.gif'))
items_list.push( Item.create user: user, name: 'scar', price: '19.99',description: 'Scar from the lion King', 
              preview_description: 'Scar from the lion King (textured)',image_file_name: 'Scar.gif',image: image,
                categories: categories)

items_list.each do |i| 
    if not i.save() 
        puts i.errors.full_messages 
    end
end