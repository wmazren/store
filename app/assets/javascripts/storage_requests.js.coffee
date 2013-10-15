jQuery ->

 $('form').on 'click', '.remove_fields', (event) ->
   $(this).prev('input[type=hidden]').val('1')
   # alert($(this).prev().attr("id"));
   $(this).closest('fieldset').hide()
   event.preventDefault()

 $('form').on 'click', '.add_items', (event) ->
   time = new Date().getTime()
   regexp = new RegExp($(this).data('id'), 'g')
   accordionID = $(this).closest('.accordion-toggle').attr('data-href').toString()
   accordionID = accordionID.replace("#","")

   #if the accordion is closed and the add item button is clicked this ensures the chevron toggle is facing the right direction
   $(this).siblings(".icon-chevron-up").addClass('icon-chevron-down')
   $(this).siblings(".icon-chevron-up").removeClass('icon-chevron-up')

   # if the accordion is closed and the add item button is clicked, we want to expand it
   $(this).siblings(".icon-chevron-down").removeClass('collapsed')
   $(this).closest('.accordion-toggle').removeClass('collapsed')
   $('#' + accordionID).addClass('in')
   $('#' + accordionID).css("height", "auto")

   # this statement adds the new item fieldset to the well div
   $('#' + accordionID).children('.well').append($(this).data('fields').replace(regexp, time))

   $('#' + accordionID).children('.well').find('.item-textbox').focus();
   $('.item-date').datepicker({ dateFormat: 'dd-mm-yy' })

   event.preventDefault()

 $('form').on 'click', '.add_fields', (event) ->
   time = new Date().getTime()
   regexp = new RegExp($(this).data('id'), 'g')
   $('#accordion2').append($(this).data('fields').replace(regexp, time));

   $('#dyn-id').attr('id',time)
   $('.accordion-toggle').last().attr('data-href',"#" + time)
   $('.accordion-toggle').last().find('.icon-chevron-down').attr('href',"#" + time)

   # collapse all accordions first, then then remove for the last (newly added package)
   $('.icon-chevron-down').addClass('icon-chevron-up')
   $('.icon-chevron-down').removeClass('icon-chevron-down')
   $('.icon-chevron-up').addClass('collapsed')

   $('.icon-chevron-up').last().addClass('icon-chevron-down')
   $('.icon-chevron-up').last().removeClass('icon-chevron-up')
   $('.icon-chevron-down').last().addClass('collapsed')

   # collapse all accordion-body and then add only the 'in' tag to the last (newly added package)
   # also sets all heights to 0px (collapsed state) first, then sets the newly added package height to auto
   $('.accordion-body').removeClass('in')
   $('.accordion-body').css("height", "0px")
   $('#' + time).addClass('in')
   $('#' + time).css("height", "auto")

   event.preventDefault()

 $('form').on 'click', '.icon-chevron-down', (event) ->
   $(this).removeClass('icon-chevron-down')
   $(this).addClass('icon-chevron-up')
   event.preventDefault()

 $('form').on 'click', '.icon-chevron-up', (event) ->
   $(this).removeClass('icon-chevron-up')
   $(this).addClass('icon-chevron-down')
   event.preventDefault()
