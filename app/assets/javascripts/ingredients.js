$(function() {

         $(this).attr('data-id-element','#ingredient_id').bind('railsAutocomplete.select', function(event, data){
            
            $( "#unit_input" ).val( data.item.unit).prop('disabled', true);
            $( "#carb_input" ).val( data.item.carb).prop('disabled', true);
            $( "#prot_input" ).val( data.item.prot).prop('disabled', true);
            $( "#fat_input" ).val( data.item.fat).prop('disabled', true);
          });

});