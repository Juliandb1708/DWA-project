defmodule Fitness.Repo.Migrations.AddCategoriesIdToWorkout do
  use Ecto.Migration

  def change do
    alter table(:workouts) do
      remove :category_id, references(:categories, on_delete: :nothing)
      add :categories_id, references(:categories, on_delete: :nothing)
    end
  end
end
