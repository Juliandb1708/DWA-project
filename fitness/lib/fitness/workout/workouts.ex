defmodule Fitness.Workouts do
    use Ecto.Schema
    import Ecto.Changeset

    schema "workouts" do
        field :title, :string
        field :short_description, :string
        field :long_description, :string
        field :date, :utc_datetime
        field :is_live, :boolean, default: false
        field :places_available, :integer, default: 25
        belongs_to :categories, Fitness.Categories
        many_to_many :instructors, Fitness.Instructors, join_through: Fitness.WorkoutInstructors, on_replace: :delete

        timestamps()
    end

    @doc false
    def changeset(event, attrs \\ %{}) do
        event
        |> cast(attrs, [:title, :short_description, :long_description, :date, :is_live, :categories_id])
        |> validate_required([:title, :short_description, :date])
    end
end
