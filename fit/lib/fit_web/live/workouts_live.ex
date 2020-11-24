defmodule FitWeb.WorkoutsLive do
  use FitWeb, :live_view

  def mount(%{"id" => id}, _session, socket) do
    workout = Fit.WorkoutQueries.get_by_id(id)
    instructors = Fit.InstructorQueries.get_instructors_by_workout(id)

    socket =
      assign(socket,
        workout: workout,
        instructors: instructors
      )

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(FitWeb.WorkoutView, "details.html", assigns)
  end
end
