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
  cuanto: ->
    switch @cuanto
      when "0:15"
        "15min"
      when "0:30"
        "30min"
      when "0:45"
        "45min"
      when "1:00"
        "1h"
      when "1:15"
        "1h 15min"
      when "1:30"
        "1h 30min"
      when "1:45"
        "1h 45min"
      when "2:00"
        "2h"
      when "2:15"
        "2h 15min"
      when "2:30"
        "2h 30min"
      when "2:45"
        "2h 45min"
  cuando: ->
    moment(@cuando).fromNow()

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
    