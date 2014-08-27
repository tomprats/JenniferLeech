$(document).ready(function() {
  $(".admin-tag .admin-form form").ajaxForm({
    success: function(data) {
      if(data.status == 200) {
        $(".admin-tag form").find("input[type=text], input[type=number], input[type=password], textarea").val("");
        clearFlash();
        $(".admin-tag table tbody").append(data.html);
      } else {
        flash(data.message);
      }
    }
  });

  $(document).on("click", ".edit-tag", function(e) {
    e.preventDefault();

    $this = $(this);
    $.get("tags/" + $this.data("id") + "/edit", function(data) {
      $(".edit-tag-modal form").parent().html($(data.html).find("form"));
      $(".edit-tag-modal").modal("show");
      $("form#edit_tag_" + $this.data("id")).ajaxForm({
        success: function(data) {
          if(data.status == 200) {
            $(".edit-tag-modal").modal("hide");
            $(".tag-" + data.id).html($(data.html).html());
            clearFlash();
          } else {
            flash(data.message);
          }
        }
      });
    });

    return false;
  });

  $(document).on("click", ".delete-tag", function(e) {
    e.preventDefault();

    $this = $(this);
    $.ajax({
      url: "tags/" + $this.data("id"),
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
