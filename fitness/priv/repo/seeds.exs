# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Fitness.Repo.insert!(%Fitness.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
unless(Fitness.WorkoutQueries.any) do
    Fitness.WorkoutQueries.create(Fitness.Workouts.changeset(%Fitness.Workouts{}, %{title: "Strength with Gregg", category: "Strength", instructor: "Gregg Johnson", short_description: "Today we will make the most of common dumbells", date: "2020-11-13 10:00:00", is_live: true}))
    Fitness.WorkoutQueries.create(Fitness.Workouts.changeset(%Fitness.Workouts{}, %{title: "Yoga with Jessica", category: "Condition", instructor: "Jessica Johnson", short_description: "Getting to know your muscles", date: "2020-11-12 22:00:00", is_live: true}))
    Fitness.WorkoutQueries.create(Fitness.Workouts.changeset(%Fitness.Workouts{}, %{title: "Strength with Kyle", category: "Strength", instructor: "Kyle Johnson", short_description: "Improve your endurance by switching weights", date: "2020-11-12 15:30:00", is_live: false}))
end