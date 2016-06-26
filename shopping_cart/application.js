$(function(){

  var inventory = $(rawInventory); // from data.js
  var prototypeItem = $('#prototype-item');
  prototypeItem.detach();

  inventory.each(function(){
    var item = prototypeItem.clone();
    item.find('h3').text(this.name);
    item.find('span.price').text(("$" + this.price));
    item.find('span.qty').text(this.stock);
    item.attr("id", "product_" + this.product_id);
    $('#inventory').append(item);
  });

});
