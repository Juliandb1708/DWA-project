defmodule FitnessWeb.PageController do
  use FitnessWeb, :controller

  def index(conn, _params) do
    workouts = Fitness.WorkoutQueries.get_all()
    render(conn, "index.html", workouts: workouts)
  end
end
