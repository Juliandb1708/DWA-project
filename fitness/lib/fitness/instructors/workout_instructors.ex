defmodule Fitness.WorkoutInstructors do
    use Ecto.Schema
    import Ecto.Changeset

    @primary_key false
    schema "workout_instructors" do
        belongs_to :workouts, Fitness.Workouts
        belongs_to :instructors, Fitness.Instructors
    end
end