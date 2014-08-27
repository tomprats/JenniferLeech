$(document).ready(function() {
  $(document).on("ajax:success", ".admin-admin .admin-form form", function(xhr, data, status) {
    if(data.status == 200) {
      $(".admin-admin form").find("input[type=text], input[type=number], input[type=password], textarea").val("");
      clearFlash();
      $(".admin-admin table tbody").append(data.html);
    } else {
      flash(data.message);
    }
  });

  $(document).on("ajax:success", ".edit-user-modal form", function(xhr, data, status) {
    if(data.status == 200) {
      $(".edit-user-modal").modal("hide");
      clearFlash();
    } else {
      flash(data.message);
    }
  });

  $(document).on("click", ".delete-admin", function(e) {
    e.preventDefault();

    $this = $(this);
    $.ajax({
      url: "admins/" + $this.data("id"),
      type: "DELETE",
      success: function(data) {
        if(data.status == 200) {
          $this.closest("tr").remove();
        } else {
          flash(data.message);
        }
      }
    });

    return false;
  });
});
