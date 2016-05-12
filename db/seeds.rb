ExercisesWorkout.destroy_all
Workout.destroy_all
Exercise.destroy_all
User.destroy_all

user = User.create( email:"jessica@ex.ca", password:"abcd1234" )

exercises = [
   { name:"Jumping Jacks", image:"jumping-jacks.jpg" },
   { name:"Push-Ups", image:"push-ups.jpg" },
   { name:"Planks", image:"planks.jpg" },
   { name:"Squat", image:"squat.jpg" },
   { name:"Lunge", image:"lunge.jpg" },
   { name:"Sit-Ups", image:"sit-ups.jpg" }
]

exercises.each do |e|
  Exercise.create( name:e[:name], image:e[:image], user:user )
end

workouts = [
  { name:"Morning Workout", description:"Great Way to Start the Day", interval:2, exercises:"Jumping Jacks, Squat, Push-Ups" },
  { name:"Core Workout", description:"A way to a better 6-Pack", interval:2, exercises:"Push-Ups, Planks, Sit-ups" }
]

workouts.each do |w|
  workout = Workout.create( name:w[:name], description:w[:description], interval:w[:interval], user:user )
  w[:exercises].split(", ").each do |name|
    exercise = Exercise.find_by( name:name )
    ExercisesWorkout.create( exercise:exercise, workout:workout, time:5, instructions:"Break your old record!" )
  end
end
