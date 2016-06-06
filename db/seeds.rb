Favourite.destroy_all
ExercisesWorkout.destroy_all
Workout.destroy_all
Exercise.destroy_all
User.destroy_all


users = [
  { email:"Jessica@ex.ca", password:"abcd1234" },
  { email:"Jonathan@ex.ca", password:"abcd1234" },
  { email:"FitnessBabe@ex.ca", password:"abcd1234" },
  { email:"JenniferFit@ex.ca", password:"abcd1234" },
  { email:"FitMom@ex.ca", password:"abcd1234" },
  { email:"TrainerNicky@ex.ca", password:"abcd1234" },
  { email:"JeffAbs@ex.ca", password:"abcd1234" },
  { email:"JaketheDog@ex.ca", password:"abcd1234" }
]

users.each do |u|
  User.create( email:u[:email], password:u[:password] )
end

exercises = [
   { name:"Jumping Jacks", image:"jumping-jacks.jpg" },
   { name:"Push-Ups", image:"push-ups.jpg" },
   { name:"Planks", image:"planks.jpg" },
   { name:"Squat", image:"squat.jpg" },
   { name:"Lunge", image:"lunge.jpg" },
   { name:"Sit-Ups", image:"sit-ups.jpg" },
   { name: "Abdominal Crunch", image: "abdominal-crunch.jpg" },
   { name: "Side Plank", image: "side-plank.jpg" },
   { name: "Triceps Dip", image: "triceps-dip.jpg" },
   { name: "Wall Sit", image: "wall-sit.jpg" }
]

exercises.each do |e|
  Exercise.create( name:e[:name], image:e[:image])
end

jess_workouts = [
  { name:"Morning Workout", description:"Great Way to Start the Day", interval:2, exercises:"Jumping Jacks, Squat, Push-Ups, Lunge" },
  { name:"Core Workout", description:"A way to a better 6-Pack", interval:3, exercises:"Push-Ups, Planks, Sit-Ups" }
]

jess_workouts.each do |w|
  user = User.find_by( email:"Jessica@ex.ca")
  workout = Workout.create( name:w[:name], description:w[:description], interval:w[:interval], user:user )
  w[:exercises].split(", ").each do |name|
    exercise = Exercise.find_by( name:name )
    ExercisesWorkout.create( exercise:exercise, workout:workout, time:5, instructions:"Break your old record!" )
  end
  x = Random.rand(1...8)
  x.times do |i|
    userid = Random.rand(User.first.id...User.last.id - 1)
    Favourite.create(user_id:userid, workout:workout)
  end
end

nicky_workouts = [
  { name:"Bikini Butt", description:"8 minute bikini butt workout!", interval:4, exercises:"Squat, Wall Sit, Lunge" },
  { name:"Bikini Body", description:"8 minute bikini body workout!", interval:5, exercises:"Jumping Jacks, Planks, Sit-Ups, Squat, Side Plank" },
  { name:"Fat Burn!", description:"8 min At Home Cardio", interval: 5, exercises:"Jumping Jacks, Squat, Jumping Jacks, Lunge" }
]

nicky_workouts.each do |w|
  user = User.find_by( email:"TrainerNicky@ex.ca")
  workout = Workout.create( name:w[:name], description:w[:description], interval:w[:interval], user:user )
  w[:exercises].split(", ").each do |name|
    exercise = Exercise.find_by( name:name )
    ExercisesWorkout.create( exercise:exercise, workout:workout, time:10, instructions:"Break your old record!" )
  end
  x = Random.rand(1...8)
  x.times do |i|
    userid = Random.rand(User.first.id...User.last.id - 1)
    Favourite.create(user_id:userid, workout:workout)
  end
end

fitmom_workouts = [
  { name:"5 min Toned Arms", description:"8 minute bikini butt workout!", interval:2, exercises:"Push-Ups, Wall Sit, Triceps Dip" },
  { name:"5 min Fat Burner!", description:"8 minute bikini body workout!", interval:2, exercises:"Jumping Jacks, Planks, Sit-Ups, Squat, Side Plank" },
  { name:"Flat Abs!", description:"8 min At Home Cardio", interval: 2, exercises:"Jumping Jacks, Abdominal Crunch, Jumping Jacks, Lunge" }
]

fitmom_workouts.each do |w|
  user = User.find_by( email:"FitMom@ex.ca")
  workout = Workout.create( name:w[:name], description:w[:description], interval:w[:interval], user:user )
  w[:exercises].split(", ").each do |name|
    exercise = Exercise.find_by( name:name )
    ExercisesWorkout.create( exercise:exercise, workout:workout, time:5, instructions:"Break your old record!" )
  end
  x = Random.rand(1...8)
  x.times do |i|
    userid = Random.rand(User.first.id...User.last.id - 1)
    Favourite.create(user_id:userid, workout:workout)
  end
end
