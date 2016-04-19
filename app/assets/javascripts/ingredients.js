/*$(function() {
  
  var id;
  var unit;

 $(this).attr('data-id-element','#ingredient_id').bind('railsAutocomplete.select', function(event, data){
    var allIngredients = $('#ingredients .nested-fields');
    if (allIngredients.length > 0) { 
      var foo = allIngredients.length-1
      $($( ".hidden_field" )[foo]).val( data.item.id);
      $($( ".unit_input" )[foo]).val( data.item.unit).prop('disabled', true);
      $($( ".carb_input" )[foo]).val( data.item.carb).prop('disabled', true);
      $($( ".prot_input" )[foo]).val( data.item.prot).prop('disabled', true);
      $($( ".fat_input" )[foo]).val( data.item.fat).prop('disabled', true);
    } else { 
      $( ".hidden_field" ).val( data.item.id);
      $( ".unit_input" ).val( data.item.unit).prop('disabled', true);
      $( ".carb_input" ).val( data.item.carb).prop('disabled', true);
      $( ".prot_input" ).val( data.item.prot).prop('disabled', true);
      $( ".fat_input" ).val( data.item.fat).prop('disabled', true);
    }
    
  });
});*/

 $(function(){
  var num;
  var id;
  $('#ingredients').on('cocoon:after-insert', function(e, insertedItem) {
    $('input[id^="meal_meal_ingredients_attributes_"][id$="_ingredient_attributes_name"]').each(function(){
        var current = $(this);
        var rx = /meal_meal_ingredients_attributes_(.*)_ingredient_attributes_name/;
        num = rx.exec(current.attr('id'))[1];
        id = '#meal_meal_ingredients_attributes_'+ num +'_ingredient_';
    });
    $(id + 'attributes_name').bind('railsAutocomplete.select', function(event, data){
      $( id + 'attributes_id' ).val( data.item.id);
      $( id + 'attributes_unit' ).val( data.item.unit).prop('disabled', true);
      $( id + 'attributes_carb' ).val( data.item.carb).prop('disabled', true);
      $( id + 'attributes_prot' ).val( data.item.prot).prop('disabled', true);
      $( id + 'attributes_fat' ).val( data.item.fat).prop('disabled', true);
    });

  });
}); 