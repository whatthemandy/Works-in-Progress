var JSCart = {
  updateCartItemCount : function () {
    var items = $("#cart div.cart-item");
    var total = 0;

    // count total number of items in cart & update total
    items.each(function (){
      var quantity = $(this).find('span.qty');
      var value = Number(quantity.text());
      total += value;
      $("span#cart-quantity").text(total);
    });
  },

  updateCartTotal : function () {
    var items = $("#cart div.cart-item");
    var total = 0;

    // calculate total price of items in cart & update total
    items.each(function (){
      // find how many of each item are in cart
      var q = $(this).find('span.qty');
      var quantity = Number(q.text());

      // find price of each item
      var p = $(this).find('span.price');
      var price = parseFloat(p.text());

      // calculate new total and update it
      total += (quantity * price);
      $("span#cart-price").text(total.toFixed(2));
    });
  },

  updateCart : function () {
    this.updateCartItemCount();
    this.updateCartTotal();
  }
};

$(function(){
  var inventory = $(rawInventory); // from data.js
  var prototypeItem = $('#prototype-item');
  prototypeItem.detach();

  var prototypeCartItem = $('#prototype-cart');
  prototypeCartItem.detach();

  // add each item from data file to inventory list
  inventory.each(function(){
    var item = prototypeItem.clone();
    item.find('h3').text(this.name);
    item.find('span.price').text(("$" + this.price));
    item.find('span.qty').text(this.stock);
    item.attr("id", "product_" + this.product_id);
    $('#inventory').append(item);

    // add each item from inventory list to cart list
    var cartItem = prototypeCartItem.clone();
    cartItem.find('h3').text(this.name);
    cartItem.attr("id", "product_" + this.product_id);
    cartItem.find('span.price').text(this.price)
    $('#cart').append(cartItem);

    // on "add to cart" click, add items to cart & update quantities
    item.on('click', function () {
      targetId = $(this).attr('id');
      var target = $('div#cart div#' + targetId);
      var quantity = target.find('span.qty');
      var current = Number(quantity.text());
      quantity.text(current += 1);

      // after every click, update cart totals with JSCart functions
      JSCart.updateCart();
    });
  });
});
