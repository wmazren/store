jQuery ->
 $('form').on 'click', '.remove_fields', (event) ->
   $(this).prev('input[type=hidden]').val('1')
   # alert($(this).prev().attr("id"));
   $(this).closest('fieldset').hide()
   event.preventDefault()

 $('form').on 'click', '.add_items', (event) ->
   time = new Date().getTime()
   regexp = new RegExp($(this).data('id'), 'g')
   $(this).before($(this).data('fields').replace(regexp, time))
   event.preventDefault()

 $('form').on 'click', '.add_fields', (event) ->
   time = new Date().getTime()
   regexp = new RegExp($(this).data('id'), 'g')
   $('#accordion2').append($(this).data('fields').replace(regexp, time));

   $('#dyn-id').attr('id',time)
   $('.accordion-toggle').last().attr('href',"#" + time)

   # collapse all accordions first, then then remove for the last (newly added package)
   $('.accordion-toggle').addClass('collapsed')
   $('.accordion-toggle').last().removeClass('collapsed')

   # collapse all accordion-body and then add only the 'in' tag to the last (newly added package)
   # also sets all heights to 0px (collapsed state) first, then sets the newly added package height to auto
   $('.accordion-body').removeClass('in')
   $('.accordion-body').css("height", "0px")
   $('#' + time).addClass('in')
   $('#' + time).css("height", "auto")

   event.preventDefault()



