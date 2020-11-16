defmodule Fitness.Repo.Migrations.AddDescriptionMaxLength do
  use Ecto.Migration

  def change do
    alter table(:workouts) do
      modify :long_description, :string, size: 3000
    end
  end
end
