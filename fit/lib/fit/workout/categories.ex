defmodule Fit.Categories do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :title, :string
    has_many :workouts, Fit.Workouts
  end

  @doc false
  def changeset(event, attrs \\ %{}) do
    event
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
