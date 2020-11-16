defmodule Fitness.Instructors do
    use Ecto.Schema
    import Ecto.Changeset

    schema "instructors" do
        field :name, :string
        field :email, :string
        many_to_many :gave_workouts, Fitness.Workouts, join_through: Fitness.WorkoutInstructors, on_replace: :delete

        timestamps()
    end

    @doc false
    def changeset(event, attrs \\ %{}) do
        event
        |> cast(attrs, [:name, :email])
        |> validate_required([:name, :email])
    end
end