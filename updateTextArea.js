function updateTextArea() {
  var allVals = $('#TextToSave').data('initialVal'),
      lineCount = 1;
  $('.playlistcheck :checked').each(function(i) {
    allVals+= (i != 0 || allVals.length > 0 ? "\r\n" : "") + $(this).val();
    lineCount++;
  });
  $('#TextToSave').val(allVals).attr('rows', lineCount);

}
$(function() {
  $('.playlistcheck input').change(updateTextArea);
  
  $('#TextToSave').data('initialVal', $('#TextToSave').val());
  updateTextArea();
});