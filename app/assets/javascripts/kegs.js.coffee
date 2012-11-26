# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('.draggable').draggable({revert: 'invalid'})
$('.droppable').droppable
  drop: (event, ui) ->
    tapId = $(this).attr('data-id')
    kegId = ui.draggable.attr('data-id')
    request_url = 
    $.ajax({
      type: 'PUT',
      url: "/taps/#{tapId}.json",
      data: {'keg_id': kegId},
      dataType: 'JSON',
      success: (data, textStatus, jqXHR) ->
        document.location.reload(true)
      })

$('.close').bind 'click', (event) ->
  console.log event
