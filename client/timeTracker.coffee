Template.tiempo.helpers
  registroTiempo: ->
    Tiempo.find({},{sort:{cuando:-1}})
  quienLabel: ->
    switch @quien
      when "Vicho"
        "primary"
      when "Dave"
        "success"
      when "Ambos"
        "danger"
      


Template.tiempo.events
  "submit form": (event, template) ->
    event.preventDefault()
    
    if template.find("#que").value
      registroTiempo = {
        que: template.find("#que").value
        quien: template.find("#quien").value
        cuanto: template.find("#cuanto").value
        cuando: new Date()
      }
      
      Tiempo.insert registroTiempo
      template.find("form").reset()
    else
      template.find("#que").focus()
    