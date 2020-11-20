defmodule Chat.Messages.Message do
    use Ecto.Schema
    import Ecto.Changeset

    alias Chat.Chats.Chat

    schema "messages" do
      field :message, :string
      field :username, :string
      belongs_to :chats, Chat
    end

    @doc false
    def changeset(event, attrs \\ %{}) do
      event
      |> cast(attrs, [:message, :username, :chats_id])
      |> validate_required([:message, :username, :chats_id])
    end
end
