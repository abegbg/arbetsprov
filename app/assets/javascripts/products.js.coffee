# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->

  $("form.product_form").on("ajax:success", (e, data, status, xhr) ->
#  $(document).bind "ajaxSuccess", "form.product_form", (event, xhr, settings) ->
    $product_form = $(event.data)
    $flash = $("#flash")
    $flash.hide()
    $notice = $("p#notice")
    $notice.show() if $notice.is("hidden")
    $notice.replaceWith("<p id=notice class='flash notice'>Produkten är uppdaterad.</p>")
    $error_container = $("#error_explanation")
    $error_container_ul = $("ul", $error_container)
    #$("<p>").html(xhr.responseJSON.title + " saved.").appendTo $product_form
    if $("li.error", $error_container_ul).length
      $("li.error", $error_container_ul).remove()
      $error_container.hide()
    )

  $("form.product_form").on("ajax:error", (event, xhr, status, error) ->
#  $(document).bind "ajaxError", "form.product_form", (event, jqxhr, settings, exception) ->
    $product_form = $(event.data)
    $flash = $(".flash")
    $flash.hide()
    $notice = $("#notice")
    $notice.show() if $notice.is("hidden")
    $notice.replaceWith("<p id=notice class='flash alert'>Produkten kunde inte sparas. Se felmeddelande nedan.</p>")
    $error_container = $("#error_explanation")
    $error_container_ul = $("ul.error")
    if $("li.error", $error_container_ul).length
      $("li.error", $error_container_ul).remove()
      $error_container.hide()
    $error_container.show()  if $error_container.is(":hidden")
    $.each xhr.responseJSON, (index, message) ->
      $("<li class=error>").html(message).appendTo $error_container_ul
    )



