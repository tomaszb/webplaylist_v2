@notice = (element, color) ->
  element.animate {backgroundColor: color}, 800
  element.animate {backgroundColor: "#fff"}, 800