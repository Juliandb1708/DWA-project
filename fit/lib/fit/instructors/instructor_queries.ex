defmodule Fit.InstructorQueries do
  import Ecto.Query, warn: false

  alias Fit.{Repo, Instructors}

  def create(instructor), do: Repo.insert(instructor)

  def get_instructors_for_select,
    do: Repo.all(from i in Instructors, select: {i.name, i.id}, order_by: i.name)

  def bind(workoutinstructor), do: Repo.insert(workoutinstructor)

  def get_instructors_by_workout(workouts_id) do
    Repo.all(
      from i in Instructors,
        inner_join: wi in assoc(i, :gave_workouts),
        where: wi.id == ^workouts_id,
        order_by: i.name
    )
  end
end
