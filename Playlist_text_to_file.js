//![CDATA[
  $(function(){
  $('.button').click(function(event) {
   event.preventDefault();
    if ($("#TextToSave").text() == "type your text here ...") {
      $("#TextToSave").text($(this).html());
    } else {
     $("#TextToSave").text($("#TextToSave").text() + $(this).html() +'</track>');
    }
  });
 });
]]