$(function() {
  $('.flash_messages .close').click(function() {
    $(this).closest('.flash_messages').fadeOut(function() {
      $(this).remove();
    });
  });
});
