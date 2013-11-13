# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
$ ->
  if $('#storage_requests_chart_container').length > 0
    Morris.Bar
      element: 'storage_requests_chart'
      data: $('#storage_requests_chart').data('storagerequests')
      xkey: 'created_at'
      ykeys: ['requests']
      labels: ['Requests']
      xLabelMargin: 10
