var $Form = $('#omdbform'), $Container = $('#containera');
$Container.hide();
$Form.on('click', function(p_oEvent){
    var sUrl, sMovie, oData;
    p_oEvent.preventDefault();
sMovie = $Form.find('#moviename').val();
    sUrl = 'https://www.omdbapi.com/?t=' + sMovie + ''
    $.ajax(sUrl, {
        complete: function(p_oXHR, p_sStatus){
            oData = $.parseJSON(p_oXHR.responseText);
            		console.log(oData);

			if (oData.Response === "False") {
				$Container.hide();
			} else {
				$Container.find('.title').text(oData.Title);
				$Container.find('.plot').text(oData.Plot);
				$Container.find('.poster').html('<img src="' + oData.Poster + '" alt=""/>');
				$Container.find('.year').text(oData.Year);
				$Container.show();
			}
        }

    });    
});


$(function () {
    $('#rightbox a').on('focus', function () {

        var text = $('#moviename');
        text.val($(this).text()); 
 var fileName =$(this).text();
        fileName = fileName.replace(/\.[^/.]+$/, "");
        text.val(fileName);    
        $Form.click();
    });
});