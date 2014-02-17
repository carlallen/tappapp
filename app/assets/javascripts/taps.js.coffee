# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on "ready page:change", ->
  $(".beer_name_autocomplete").typeahead
    remote: "/beers/?name=%QUERY"
    valueKey: "name"
    template: Handlebars.compile([
      "<h4 class=\"beer-name\">{{name}}</p>"
      "<p class=\"brewery-name\">{{brewery_name}}</p>"
    ].join(""))