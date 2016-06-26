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
    });
  });
});
