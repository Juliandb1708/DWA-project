defmodule Fitness.Repo.Migrations.AddCategoryIdToWorkout do
  use Ecto.Migration

  def change do
    alter table(:workouts) do
      remove :category
      add :category_id, references(:categories, on_delete: :delete_all), null: false
    end
  end
end
