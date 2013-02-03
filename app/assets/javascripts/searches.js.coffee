jQuery ->
  button = $("button")
  button.toggle ->
    $("input:checkbox").attr("checked","checked")
    button.text("uncheck all")
  , ->
    $("input:checkbox").removeAttr("checked")
    button.text("check all")
