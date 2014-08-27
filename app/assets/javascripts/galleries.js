$(document).ready(function() {
  $(document).on("ajax:success", ".admin-gallery .admin-form form", function(xhr, data, status) {
    if(data.status == 200) {
      $(".admin-gallery form").find("input[type=text], input[type=number], input[type=password], textarea").val("");
      clearFlash();
      $(".admin-gallery table tbody").append(data.html);
    } else {
      flash(data.message);
    }
  });

  $(document).on("click", ".edit-gallery", function(e) {
    e.preventDefault();

    $this = $(this);
    $.get("galleries/" + $this.data("id") + "/edit", function(data) {
      $(".edit-gallery-modal form").parent().html($(data.html).find("form"));
      $(".edit-gallery-modal").modal("show");
    });

    return false;
  });

  $(document).on("ajax:success", ".edit-gallery-modal form", function(xhr, data, status) {
    if(data.status == 200) {
      $(".edit-gallery-modal").modal("hide");
      $(".gallery-" + data.id).html($(data.html).html());
      clearFlash();
    } else {
      flash(data.message);
    }
  });

  $(document).on("click", ".delete-gallery", function(e) {
    e.preventDefault();

    $this = $(this);
    $.ajax({
      url: "galleries/" + $this.data("id"),
      type: "DELETE",
      success: function(data) {
        if(data.status == 200) {
          $this.closest("tr").remove();
        }
      }
    });

    return false;
  });
});
