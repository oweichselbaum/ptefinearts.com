$(document).ready(function() {
  $('#artistsindex a.ajaxtransition')
    .bind('ajax:success', function(xhr, data, status) {
      $('#artistsindex').hide().html(data).fadeIn();
    });

  $('#artistedit a.ajaxtransition')
    .bind('ajax:success', function(xhr, data, status) {
      $('.main_content').hide().html(data).fadeIn();
    });

  

  $('.biographyshow').live('click', function() {
    $('.thumbs').toggle();
    $('.biography').toggle();
  });
});
