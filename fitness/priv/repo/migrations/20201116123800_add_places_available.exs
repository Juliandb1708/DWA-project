defmodule Fitness.Repo.Migrations.AddPlacesAvailable do
  use Ecto.Migration

  def change do
    alter table(:workouts) do
      add :places_available, :integer, default: 25
    end
  end
end
