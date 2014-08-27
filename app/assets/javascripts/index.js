$(document).ready(function() {
  var owl = $(".owl-carousel");
  owl.owlCarousel({
    nav: true,
    dots: false,
    loop: true,
    margin: 10,
    navText: [
      "<i class='fa fa-chevron-left'></i>",
      "<i class='fa fa-chevron-right'></i>"
    ],
    responsive: {
      0: { items: 1 },
      600: { items: 3 },
      1000: { items: 5 }
    }
  });

  $(document).on("click", ".gallery-link", function(e) {
    e.preventDefault();

    $(".gallery").addClass("hide");
    $(".gallery-" + $(this).data("id")).removeClass("hide");

    return false;
  });
  $(".gallery-link:first").trigger("click");
});
