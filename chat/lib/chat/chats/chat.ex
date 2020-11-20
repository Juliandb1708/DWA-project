defmodule Chat.Chats.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  alias Chat.Messages.Message

  schema "chats" do
    field :name, :string
    has_many :messages, Message
  end

  @doc false
  def changeset(event, attrs \\ %{}) do
    event
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
