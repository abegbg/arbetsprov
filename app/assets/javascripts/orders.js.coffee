# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->

  $(document).bind "ajaxSuccess", "form.orderrow_form", (event, xhr, settings) ->
    $orderrow_form = $(event.data)
    $flash = $("#flash")
    $flash.hide()
    $notice = $("p#notice")
    $notice.show() if $notice.is("hidden")
    $notice.replaceWith("<p id=notice class='flash notice'>Orderraden uppdaterad</p>")


  $(document).bind "ajaxError", "form.orderrow_form", (event, jqxhr, settings, exception) ->
    $orderrow_form = $(event.data)
    $notice = $("#notice")
    $notice.show() if $notice.is("hidden")
    $notice.replaceWith("<p id=notice class='flash alert'>Orderraden kunde inte uppdateras. Kontrollera lagerantal</p>")



#    $response_container = $("#response_explanation", $orderrow_form)
#    $response_container.hide()
#    $error_container = $("#error_explanation", $orderrow_form)
#    if $("li.error", $error_container_ul).length
#      $("li.error", $error_container_ul).remove()
#      $error_container.hide()
#    $error_container_ul = $("ul", $error_container)
#    $error_container.show()  if $error_container.is(":hidden")
#    $.each jqxhr.responseJSON, (index, message) ->
#      $("<li class=error>").html(message).appendTo $error_container_ul

