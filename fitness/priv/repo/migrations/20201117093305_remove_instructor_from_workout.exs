defmodule Fitness.Repo.Migrations.RemoveInstructorFromWorkout do
  use Ecto.Migration

  def change do
    alter table(:workouts) do
      remove :instructor
    end
  end
end
