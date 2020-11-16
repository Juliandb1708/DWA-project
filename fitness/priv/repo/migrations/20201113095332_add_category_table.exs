defmodule Fitness.Repo.Migrations.AddCategoryTable do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string
    end

    create unique_index(:categories, [:title])
  end
end
