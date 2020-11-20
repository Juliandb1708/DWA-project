defmodule Chat.Repo.Migrations.ChangeChatId do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      remove :chat_id
      add :chats_id, references(:chats, on_delete: :delete_all), null: false
    end
  end
end
