defmodule FitWeb.CreateWorkoutsLive do
  use FitWeb, :live_view

  alias Fit.WorkoutQueries
  alias Fit.Workouts

  def mount(_params, _session, socket) do
    if connected?(socket), do: WorkoutQueries.subscribe()

    workouts = WorkoutQueries.get_all()
    categories = WorkoutQueries.get_all_categories()
    changeset = WorkoutQueries.change_workouts(%Workouts{})

    socket =
      assign(socket,
        workouts: workouts,
        categories: categories,
        changeset: changeset
      )

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(FitWeb.WorkoutView, "create.html", assigns)
  end

  def handle_event("save", %{"workouts" => params}, socket) do
    params = Map.update!(params, "date", fn d -> d <> ":00" end)
    changesetp = Workouts.changeset(%Workouts{}, params)

    case WorkoutQueries.create(changesetp) do
      {:ok, workout} ->
        socket =
          update(
            socket,
            :workouts,
            fn workouts -> [workout | workouts] end
          )

        changeset = WorkoutQueries.change_workouts(%Workouts{})

        socket = assign(socket, changeset: changeset)

        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        socket = assign(socket, changeset: changeset)
        {:noreply, socket}
    end
  end

  def handle_event("validate", %{"workouts" => params}, socket) do
    changeset =
      %Workouts{}
      |> Workouts.changeset(params)
      |> Map.put(:action, :insert)

    socket =
      assign(socket,
        changeset: changeset
      )

    {:noreply, socket}
  end

  def handle_info({:workout_created, workout}, socket) do
    socket =
      update(
        socket,
        :workouts,
        fn workouts -> [workout | workouts] end
      )

    {:noreply, socket}
  end
end
