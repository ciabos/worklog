$(".projects_wrapper").html("<%= escape_javascript(render(@client.projects)) %>")
initializeClients($(".projects_wrapper"))
$(".sliding-field-project").removeClass 'active'
$(".sliding-field-project").val ('')

