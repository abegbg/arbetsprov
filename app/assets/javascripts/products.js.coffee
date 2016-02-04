# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->

  $(document).bind "ajaxSuccess", "form.product_form", (event, xhr, settings) ->
    $product_form = $(event.data)
    $response_container = $("#response_explanation", $product_form)
    $response_container.show()  if $response_container.is(":hidden")
    $error_container = $("#error_explanation", $product_form)
    $error_container_ul = $("ul", $error_container)
    $("<p>").html(xhr.responseJSON.title + " saved.").appendTo $product_form
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
      $error_container.hide()

  $(document).bind "ajaxError", "form.product_form", (event, jqxhr, settings, exception) ->
    $product_form = $(event.data)
    $error_container = $("#error_explanation", $product_form)
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
      $error_container.hide()
    $error_container_ul = $("ul", $error_container)
    $error_container.show()  if $error_container.is(":hidden")
    $.each jqxhr.responseJSON, (index, message) ->
      $("<li>").html(message).appendTo $error_container_ul