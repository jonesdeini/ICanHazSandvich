jQuery ->
  $("#select_all").bind "click", ->
    $("form input:checkbox").attr "checked" , true
