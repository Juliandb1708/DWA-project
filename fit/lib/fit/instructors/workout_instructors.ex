defmodule Fit.WorkoutInstructors do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "workout_instructors" do
    belongs_to :workouts, Fit.Workouts
    belongs_to :instructors, Fit.Instructors
  end

  @doc false
  def changeset(event, attrs \\ %{}) do
    event
    |> cast(attrs, [:workouts_id, :instructors_id])
    |> validate_required([:workouts_id, :instructors_id])
  end
end
