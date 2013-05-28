# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
 $('form').on 'click', '.add_floors', (event) ->
   time = new Date().getTime()
   regexp = new RegExp($(this).data('id'), 'g')
   $('#accordion2').append($(this).data('fields').replace(regexp, time));

   $('#dyn-id').attr('id',time)
   $('.accordion-toggle').last().attr('data-href',"#" + time)
   $('.accordion-toggle').last().find('.icon-chevron-down').attr('href',"#" + time)

   $('#floor-id').attr('id', time + "-floor")
   num_floors = $(".floorstyle").size();
   $('#' + time + "-floor").val(num_floors);

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

  $('form').on 'click', '.add_bays', (event) ->
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

   $('#bay-id').attr('id', time + "-bay")
   num_bays = $(this).closest('.accordion-group').find(".baystyle").size();
   $('#' + time + "-bay").val(String.fromCharCode(64 + num_bays));

   event.preventDefault()
