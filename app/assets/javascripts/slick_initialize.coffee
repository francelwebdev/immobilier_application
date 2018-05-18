jQuery(document).on 'turbolinks:load', ->
  $('.single-item').slick({
    dots: true

    fade: true
    slidesToShow: 1
    slidesToScroll: 1
  })