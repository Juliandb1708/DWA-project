defmodule Chat.Repo.Migrations.AddChat do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :name, :string
    end
  end
end
