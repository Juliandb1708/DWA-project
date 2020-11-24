defmodule Fit.Workouts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workouts" do
    field :title, :string
    field :short_description, :string
    field :long_description, :string
    field :date, :utc_datetime
    field :is_live, :boolean, default: false
    field :places_available, :integer, default: 25
    belongs_to :categories, Fit.Categories

    many_to_many :instructors, Fit.Instructors,
      join_through: Fit.WorkoutInstructors,
      on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(event, attrs \\ %{}) do
    event
    |> cast(attrs, [
      :title,
      :short_description,
      :long_description,
      :date,
      :is_live,
      :categories_id
    ])
    |> validate_required([:title, :short_description, :date])
    |> validate_length(:title, min: 4, max: 100)
    |> validate_length(:short_description, min: 10, max: 200)
  end
end
