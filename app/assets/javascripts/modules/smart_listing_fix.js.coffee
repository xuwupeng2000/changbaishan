# Disable auto filtering (auto search feature) FIG-1412
$.fn.smart_listing_controls.filter = (filter) ->
  form  = filter.closest("form")
  field = form.find('input#filter.search')

  $.fn.smart_listing.observeField(field,
    onChange: ->
      return 'disabled'
  )
