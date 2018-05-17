$(document).ready(function () {
  var introContainer = $('.intro')
  $('.down-arrow').click(function () {
    var top = $(this).position().top,
      currentScroll = introContainer.scrollTop();
    $('html, body').animate({
      scrollTop: currentScroll + top
    }, 300)
  })
})
