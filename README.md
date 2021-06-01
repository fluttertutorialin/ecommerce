# ecommerce

export PATH="$PATH:/Users/mac/Documents/flutter/bin"

# shopping use total price count
num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);