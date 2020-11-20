defmodule Chat.Messages do
  import Ecto.Query, warn: false

  alias Chat.Repo
  alias Chat.Messages.Message

  def subscribe(id) do
    Phoenix.PubSub.subscribe(Chat.PubSub, "messages#{id}")
  end

  def list_messages, do: Repo.all(Message)

  def get_message!(id), do: Repo.get!(Message, id)

  def get_message_by_chat(id) do
    Message
    |> where(chats_id: ^id)
    |> Repo.all()
  end

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:message_added)
  end

  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  def change_message(%Message{} = message, attrs \\ %{}) do
    Message.changeset(message, attrs)
  end

  def broadcast({:ok, message}, event) do
    Phoenix.PubSub.broadcast(
      Chat.PubSub,
      "messages#{message.chats_id}",
      {event, message}
    )

    {:ok, message}
  end

  def broadcast({:error, _reason} = error, _event), do: error
end
