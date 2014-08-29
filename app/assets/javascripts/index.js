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

  $(document).on("click", ".tag-link", function(e) {
    e.preventDefault();

    $(".tag").addClass("hide");
    $(".tag-" + $(this).data("id")).removeClass("hide");
    alignImages();

    return false;
  });
  $(".tag-link:first").trigger("click");

  $(window).resize(function() {
    alignImages();
  });
});

function alignImages() {
  var screenSize = $(window).width();
  var rowSize = 1;
  if(screenSize > 900) {
    rowSize = 4;
  } else if(screenSize > 650) {
    rowSize = 3;
  } else if(screenSize > 450) {
    rowSize = 2;
  }
  var margin = 20;
  var itemPadding = 10;
  var itemWidth = (screenSize - margin*2)/rowSize;
  var topState = [];
  var leftState = [];
  for(i = 0; i < rowSize; i++) {
    topState.push(0);
    leftState.push(i*itemWidth);
  }
  $(".items").each(function() {
    var $items = $(this);
    $items.data("topState", topState);
    $items.data("leftState", leftState);
    $items.find(".item-box").each(function() {
      var $this = $(this);
      $this.css("width", itemWidth + "px");
      $img = $this.find("img");
      var height = $img.outerHeight();
      if(height > 0) {
        // On resize height is set
        var ts = $items.data("topState");
        var ls = $items.data("leftState");
        var topPos = Math.min.apply(null, ts);
        var index = ts.indexOf(topPos);
        var leftPos = ls[index];
        ts[index] = topPos + $this.outerHeight();
        $items.data("topState", ts);
        $this.css("top", topPos + "px");
        $this.css("left", leftPos + "px");
      } else {
        // First time
        $img.one("load", function() {
          var ts = $items.data("topState");
          var ls = $items.data("leftState");
          var topPos = Math.min.apply(null, ts);
          var index = ts.indexOf(topPos);
          var leftPos = ls[index];
          ts[index] = topPos + $this.outerHeight();
          $items.data("topState", ts);
          $this.css("top", topPos + "px");
          $this.css("left", leftPos + "px");
        });
      }
    });
  });
}
