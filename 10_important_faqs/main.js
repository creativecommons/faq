jQuery(document).ready(function($) {
  $('.accordion > li:eq(0) a').addClass('active').next().slideDown();
  $('.accordion a').click(function(j) {
    var dropDown = $(this).closest('li').find('p');

    $(this).closest('.accordion').find('p').not(dropDown).slideUp();

    if ($(this).hasClass('active')) {
        $(this).removeClass('active');
    } else {
        $(this).closest('.accordion').find('a.active').removeClass('active');
        $(this).addClass('active');
    }

    dropDown.stop(false, true).slideToggle();

    j.preventDefault();
  });

  $('.live-search-list li').each(function(){
  $(this).attr('data-search-term', $(this).text().toLowerCase());
  });

  $('.live-search-box').on('keyup', function(){

    var searchTerm = $(this).val().toLowerCase();

    $('.live-search-list li').each(function(){

      if ($(this).filter('[data-search-term *= ' + searchTerm + ']').length > 0 || searchTerm.length < 1) {
          $(this).show();
      } else {
          $(this).hide();
      }

    });

  });
});