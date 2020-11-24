defmodule FitWeb.PageLive do
  use FitWeb, :live_view

  def mount(_params, _session, socket) do
    workouts = Fit.WorkoutQueries.get_all()

    socket =
      assign(socket,
        workouts: workouts,
        title: "",
        loading: false
      )

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(FitWeb.PageView, "index.html", assigns)
  end

  def handle_event("show_live", _, socket) do
    workouts = Fit.WorkoutQueries.get_all_live()

    socket = assign(socket, workouts: workouts, title: "")
    {:noreply, socket}
  end

  def handle_event("show_soon", _, socket) do
    workouts = Fit.WorkoutQueries.get_all_soon()

    socket = assign(socket, workouts: workouts, title: "")
    {:noreply, socket}
  end

  def handle_event("show_all", _, socket) do
    workouts = Fit.WorkoutQueries.get_all()

    socket = assign(socket, workouts: workouts, title: "")
    {:noreply, socket}
  end

  def handle_event("title_search", %{"title" => title}, socket) do
    send(self(), {:run_title_search, title})

    socket =
      assign(socket,
        title: title,
        workouts: [],
        loading: true
      )

    {:noreply, socket}
  end

  def handle_info({:run_title_search, title}, socket) do
    workouts = Fit.WorkoutQueries.search_by_title(title)

    socket =
      assign(socket,
        workouts: workouts,
        loading: false
      )

    {:noreply, socket}
  end
end
