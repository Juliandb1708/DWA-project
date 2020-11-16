defmodule Fitness.Repo.Migrations.AlterWorkoutInstructors do
  use Ecto.Migration

  def change do
    drop table(:workout_instructors)
    create table(:workout_instructors, primary_key: false) do
      add :workouts_id, references(:workouts, on_delete: :delete_all), primary_key: true
      add :instructors_id, references(:instructors, on_delete: :delete_all), primary_key: true
    end
  end
end
