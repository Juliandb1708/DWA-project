defmodule Fitness.Repo.Migrations.AddWorkoutinstructorsTable do
  use Ecto.Migration

  def change do
    create table(:workout_instructors, primary_key: false) do
      add :workouts_id, references(:workouts, on_delete: :delete_all), primary_key: true
      add :instructors_id, references(:workouts, on_delete: :delete_all), primary_key: true
    end

    create unique_index(:workout_instructors, [:workouts_id, :instructors_id], name: :workouts_id_instructors_id_unique_index)
  end
end
