$(document).ready(function() {
  var $hamburger_menu = $('#hamburger-menu'),
      $mobile_nav = $('#mobile-nav')
  ;

  $hamburger_menu.on('click', function(e) {
    e.preventDefault();
    if ($mobile_nav.hasClass('open')) {
      $mobile_nav.removeClass('open');
    } else {
      $mobile_nav.addClass('open');
    }
  })
})
