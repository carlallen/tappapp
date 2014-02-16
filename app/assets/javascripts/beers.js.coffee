# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on "ready page:change", ->
  $("#beer_brewery_name").typeahead
    remote: $("#beer_brewery_name").data("autocomplete-source") + "?name=%QUERY"
    valueKey: "name"
    template: Handlebars.compile([
      "<p class=\"repo-language\">{{language}}</p>"
      "<p class=\"repo-name\">{{name}}</p>"
      "<p class=\"repo-description\">{{description}}</p>"
    ].join(""))
    footer: Handlebars.compile("<hr/><a class='btn btn-primary' href='/breweries/new'>New Brewery</a> ")