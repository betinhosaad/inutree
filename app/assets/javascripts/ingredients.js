$(function() {

         $(this).attr('data-id-element','#ingredient_id').bind('railsAutocomplete.select', function(event, data){
          console.log(event)
            var allIngredients = $('#ingredients .nested-fields')
            if (allIngredients.length > 0) { 
              var foo = allIngredients.length-1
              $($( ".unit_input" )[foo]).val( data.item.unit).prop('disabled', true);
              $($( ".carb_input" )[foo]).val( data.item.carb).prop('disabled', true);
              $($( ".prot_input" )[foo]).val( data.item.prot).prop('disabled', true);
              $($( ".fat_input" )[foo]).val( data.item.fat).prop('disabled', true);
            } else { 
              $( ".unit_input" ).val( data.item.unit).prop('disabled', true);
              $( ".carb_input" ).val( data.item.carb).prop('disabled', true);
              $( ".prot_input" ).val( data.item.prot).prop('disabled', true);
              $( ".fat_input" ).val( data.item.fat).prop('disabled', true);
            }
            
          });
});