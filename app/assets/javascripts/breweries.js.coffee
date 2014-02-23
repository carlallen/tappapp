# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on "ready page:change", ->
  $("#brewery_name").typeahead
    remote: $("#brewery_name").data("autocomplete-source") + "?q=%QUERY"
    valueKey: "name"
    template: Handlebars.compile("<h4 class=\"brewery-name\">{{name}}</p>")

  $("#brewery_name").on('typeahead:selected', (e, brewery)->
    $("#brewery_description").val(brewery.description)
    $("#brewery_location").val(brewery.location))
