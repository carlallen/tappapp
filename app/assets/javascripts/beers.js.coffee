# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on "ready page:change", ->
  $("#beer_name").typeahead
    remote: $("#beer_name").data("autocomplete-source") + "?q=%QUERY"
    valueKey: "name"
    template: Handlebars.compile([
      "<h4 class=\"brewery-name\">{{name}}</p>"
      "<p class=\"brewery-location\">{{brewery_name}}</p>"
    ].join(""))

  $("#beer_name").on('typeahead:selected', (e, beer)->
    $("#beer_brewery_db_id").val(beer.id)
    $("#beer_label_url").val(beer.label)
    $("#beer_description").val(beer.description)
    $("#beer_brewery_name").val(beer.brewery_name)
    $("#beer_ibu").val(beer.ibu)
    $("#beer_srm").slider('setValue', parseInt(beer.srm))
    $("#beer_srm").val(beer.srm)
    $("#beer_srm").trigger(jQuery.Event( "slide", {value: parseInt(beer.srm)} ))
    $("#beer_abv").val(beer.abv))

  $("#beer_brewery_name").typeahead
    remote: $("#beer_brewery_name").data("autocomplete-source") + "?name=%QUERY"
    valueKey: "name"
    template: Handlebars.compile([
      "<h4 class=\"brewery-name\">{{name}}</p>"
      "<p class=\"brewery-location\">{{location}}</p>"
    ].join(""))
    footer: Handlebars.compile("<hr/><a class='btn btn-primary' href='/breweries/new'>New Brewery</a> ")

  if $("#beer_srm").length > 0
    $("#beer_srm").slider(
      value: parseInt($("#beer_srm").data("value"))
      max: 40
    ).on "slide", (ev) ->
      template = Handlebars.compile("<span class='srm srm-{{value}}'>{{value}} °L</span>")
      $('#srm_info').html template(value: ev.value)