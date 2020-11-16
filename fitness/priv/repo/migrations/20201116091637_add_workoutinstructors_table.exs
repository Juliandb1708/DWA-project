defmodule Fitness.Repo.Migrations.AddWorkoutinstructorsTable do
  use Ecto.Migration

  def change do
    create table(:instructors) do
      add :name, :string
      add :email, :string

      timestamps()
    end
  end
end
