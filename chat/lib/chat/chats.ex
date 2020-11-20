defmodule Chat.Chats do
  import Ecto.Query, warn: false

  alias Chat.Repo
  alias Chat.Chats.Chat

  def list_chats do
    Repo.all(Chat)
  end

  def get_chat!(id), do: Repo.get!(Chat, id)

  def create_chat(attrs \\ %{}) do
    %Chat{}
    |> Chat.changeset(attrs)
    |> Repo.insert()
  end

  def update_chat(%Chat{} = chat, attrs) do
    chat
    |> Chat.changeset(attrs)
    |> Repo.update()
  end

  def delete_chat(%Chat{} = chat) do
    Repo.delete(chat)
  end

  def change_chat(%Chat{} = chat, attrs \\ %{}) do
    Chat.changeset(chat, attrs)
  end
end
