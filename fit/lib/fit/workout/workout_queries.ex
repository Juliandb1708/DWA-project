defmodule Fit.WorkoutQueries do
  import Ecto.Query, warn: false

  alias Fit.{Repo, Workouts, Categories, PubSub}

  def subscribe do
    Phoenix.PubSub.subscribe(PubSub, "workouts")
  end

  def any, do: Repo.one(from w in Workouts, select: count(w.id) != 0)

  def get_all do
    Repo.all(
      from t in Workouts,
        inner_join: c in assoc(t, :categories),
        preload: [categories: c],
        order_by: [desc: t.is_live]
    )
  end

  def get_all_live do
    Repo.all(
      from t in Workouts,
        inner_join: c in assoc(t, :categories),
        preload: [categories: c],
        where: t.is_live == true,
        order_by: [desc: t.is_live]
    )
  end

  def get_all_soon do
    Repo.all(
      from t in Workouts,
        inner_join: c in assoc(t, :categories),
        preload: [categories: c],
        where: t.is_live == false,
        order_by: [desc: t.is_live]
    )
  end

  def search_by_title(title) do
    like = "%#{title}%"

    Repo.all(
      from t in Workouts,
        inner_join: c in assoc(t, :categories),
        preload: [categories: c],
        where: ilike(t.title, ^like),
        order_by: [desc: t.inserted_at]
    )
  end

  def create(workout) do
    message = {:workout_created, workout}

    Phoenix.PubSub.broadcast(
      Fit.PubSub,
      "workouts",
      message
    )

    Repo.insert(workout)
  end

  def get_by_id(id), do: Repo.get(Workouts, id)

  def get_all_categories,
    do: Repo.all(from c in Categories, select: {c.title, c.id}, order_by: c.title)

  def get_workouts_for_select,
    do: Repo.all(from w in Workouts, select: {w.title, w.id}, order_by: w.title)

  def decrease_places(id) do
    workout = Repo.get!(Workouts, id)
    changes = Ecto.Changeset.change(workout, places_available: workout.places_available - 1)
    Repo.update(changes)
  end

  def change_workouts(%Workouts{} = workouts, attrs \\ %{}) do
    Workouts.changeset(workouts, attrs)
  end
end
