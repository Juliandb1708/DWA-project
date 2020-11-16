defmodule Fitness.Repo.Migrations.AddWorkoutsTable do
  use Ecto.Migration

  def change do
    create table(:workouts) do
        add :title, :string, size: 100
        add :category, :string, size: 20
        add :instructor, :string, size: 50
        add :short_description, :string, size: 200
        add :long_description, :string
        add :date, :utc_datetime
        add :is_live, :boolean, default: false

        timestamps()
    end
  end
end
