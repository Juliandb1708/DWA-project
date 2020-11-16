defmodule Fitness.Repo.Migrations.UpdateCategoryIdWorkout do
  use Ecto.Migration

  def change do
    execute "ALTER TABLE workouts DROP CONSTRAINT workouts_category_id_fkey"
    alter table(:workouts) do
      modify :category_id, references(:categories, on_delete: :nothing)
    end
  end
end
