# Order status
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

#Categories
Category.create! id: 1, name: "Architecture"
Category.create! id: 2, name: "Animals"
Category.create! id: 3, name: "People"
Category.create! id: 4, name: "Gaming"
Category.create! id: 5, name: "TV Show"