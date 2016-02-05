# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $("form.cart_form").on("ajax:success", (e, data, status, xhr) ->
    $cart_form = $(event.data)
    $flash = $("#flash")
    $flash.hide()
    $notice = $("p#notice")
    $notice.show() if $notice.is("hidden")
    $notice.replaceWith("<p id=notice class='flash notice'>Varan tillagd i varukorgen</p>"))


  $("form.cart_form").on("ajax:error", (e, data, status, xhr) ->
    $cart_form = $(event.data)
    $notice = $("#notice")
    $notice.show() if $notice.is("hidden")
    $notice.replaceWith("<p id=notice class='flash alert'>Varan ej tillagd. Kontroller att du valt antal.</p>"))

