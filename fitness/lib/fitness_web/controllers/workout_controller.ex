defmodule FitnessWeb.WorkoutController do
    use FitnessWeb, :controller

    def show(conn, %{"id" => id}) do
        workout = Fitness.WorkoutQueries.get_by_id(id)
        instructors = Fitness.InstructorQueries.get_instructors_by_workout(id)
        render(conn, "details.html", workout: workout, instructors: instructors)
    end

    def create(conn, %{errors: errors}) do
        render(conn, "create.html", changeset: errors)
    end

    def create(conn, _params) do
        categories = Fitness.WorkoutQueries.get_all_categories()
        changeset = Fitness.Workouts.changeset(%Fitness.Workouts{}, %{})
        render(conn, "create.html", changeset: changeset, categories: categories)
    end

    def add(conn, %{"workouts" => workouts}) do
        workouts = Map.update!(workouts, "date", fn d -> d <> ":00" end)

        changeset = Fitness.Workouts.changeset(%Fitness.Workouts{}, workouts)
        
        case Fitness.WorkoutQueries.create(changeset) do
            {:ok, %{id: id}} -> redirect(conn, to: Routes.workout_path(conn, :show, id))
            {:error, reasons} -> create(conn, %{errors: reasons})
        end
    end

    def reserve(conn, %{"id" => id}) do
        {:ok, workouts} = Fitness.WorkoutQueries.decrease_places(id)
        FitnessWeb.WorkoutsChannel.send_update(workouts)
        redirect(conn, to: Routes.workout_path(conn, :show, id))
    end
end