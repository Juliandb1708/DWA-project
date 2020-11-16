defmodule Fitness.WorkoutQueries do
    import Ecto.Query, warn: false

    alias Fitness.{Repo, Workouts, Categories}

    def any, do: Repo.one(from w in Workouts, select: count(w.id) != 0)
    
    def get_all do
        Repo.all(from t in Workouts, inner_join: c in assoc(t, :categories), preload: [categories: c], order_by: [desc: t.is_live])
    end

    def create(workout), do: Repo.insert(workout)

    def get_by_id(id), do: Repo.get(Workouts, id)

    def get_all_categories, do: Repo.all(from c in Categories, select: {c.title, c.id}, order_by: c.title)

    def get_workouts_for_select, do: Repo.all(from w in Workouts, select: {w.title, w.id}, order_by: w.title)

    def decrease_places(id) do
        workout = Repo.get!(Workouts, id)
        changes = Ecto.Changeset.change(workout, places_available: workout.places_available - 1)
        Repo.update(changes)
    end
end