var checkBoxes = $('#container .cb');

$('.check:button').click(function() {
  var checked = !$(this).data('checked');
  $('input:checkbox').prop('checked', checked);
  $(this).val(checked ? 'Remove All' : 'Select All');
  $(this).data('checked', checked);

  checkBoxes.first().change();
});

checkBoxes.change(function() {
  $('#proceedBut').prop('disabled', checkBoxes.filter(':checked').length < 1);
});
checkBoxes.first().change();