
use("fabes_global_nosql");

// READ: Find products priced above ₦10,000
db.products.find({
  price: { $gt: 10000 }
});

// READ: Find a product by its ID
db.products.findOne({
  product_id: 1
});

// UPDATE: Set Wireless Headphones stock to 23
db.products.updateOne(
  { product_id: 1 },
  { $set: { stock_quantity: 23 } }
);

// CREATE: Insert a temporary test product
db.products.insertOne({
  product_id: 999,
  name: "Temporary Test Product",
  price: 1,
  stock_quantity: 0,
  active: false
});

// DELETE: Remove the temporary test product
db.products.deleteOne({
  product_id: 999
});
