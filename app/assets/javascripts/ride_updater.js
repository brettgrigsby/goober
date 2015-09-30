function updateCurrentRide (rideId) {
  $.ajax({
    url: "/updates/" + rideId,
    type: "PUT",
    success: function(result) {
      $("#current-ride").remove()
      $("#rider-active-ride").append(result)
    }
  })
}

$(document).on("click", "#clear-ride-btn", function() {
  $("#rider-active-ride").remove()
})


$(document).ready(function () {
  var $activeRide = $("#rider-active-ride")

  if ($activeRide.length > 0) {
    setInterval(function () {

      var $rideData = $("#current-ride").data()

      $.ajax({
        url: "/updates/" + $rideData.id,
        type: "GET",
        success: function(result) {
          if ($rideData.status !== result.status) {
            updateCurrentRide($rideData.id)
          } else {
            updateCurrentRide($rideData.id)
          }
        }
      })

    }, 3000);
  }
})
