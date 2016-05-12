function ready() {
  $(".start-workout").on("click", startWorkout);
}
$(document).on("page:load", ready);
$(document).ready(ready)

function startWorkout(){
  $(".workout-overview").hide();
  $(".workout-animation").show();
  var breakTime = this.dataset.workoutinterval * 1000;
  console.log(breakTime)
  doBreak();
}

function doBreak() {
  $(".rest-countdown").show();
}
