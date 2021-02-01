$(document).ready(function(){
   $("tr #elim").click(function(){
      var idp = $(this).parent().find("#idp").val();
      eliminar(idp);
   }); 
   function eliminar(idp){
       var url = "Controlador?accion=4";
       $.ajax()({
           type: "`POST",
           url: url,
           data: "idp=" + idp,
           success: function(data, textStatus, jqXHR){
               alert("Registro eliminado!");
           }
           
       });
   }
});


