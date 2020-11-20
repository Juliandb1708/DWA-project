defmodule Chat.Repo.Migrations.AddMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message, :string
      add :username, :string
      add :chat_id, references(:chats, on_delete: :delete_all), null: false
    end
  end
end
