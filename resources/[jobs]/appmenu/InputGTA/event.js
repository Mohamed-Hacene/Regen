$(document).ready(function(){
    
    document.onkeydown = function (data) {
        if (data.which == 27 ) {
            $.post('http://appmenu/closeInput', JSON.stringify({
              valeur : ""
            }));
        }
        if (data.which == 13 ) {
            $.post('http://appmenu/closeInput', JSON.stringify({
              valeur : document.getElementById("valeur").value
            }));    
        }
    };
    window.addEventListener('message', function(event){
        var item = event.data;
        document.getElementById("titre").innerHTML = "Entrez un message"
        document.getElementById("valeur").type = "Text"
        if(item.setAffichage == true){
            $("body").css("display", "block");
            $("body").css("background-color", "rgba(0,0,0,0.1)");
            document.getElementById("valeur").value = "";
        }
        if(item.setAffichage == false){
            $("body").css("display", "none");
            $("body").css("background", " none");
        }
        if(item.label != null) {
           document.getElementById("titre").innerHTML = item.label;
        }
        if(item.MaxLength != null) {
          document.getElementById("titre").innerHTML += " (" + item.MaxLength + " caractères MAX)";
          document.getElementById("valeur").maxLength = item.MaxLength;
        }
        if(item.typeval != null) {
            document.getElementById("valeur").type = item.typeval;
            //if (item.typeval == "test") {
                document.getElementById("valeur").format = "[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}";
            //}
        }
        else {
          document.getElementById("titre").innerHTML += " (" + 100 + " caractères MAX)";
          document.getElementById("valeur").maxLength = 100;
        }
        document.getElementById("valeur").focus();
    });
});