defmodule FitnessWeb.InstructorController do
    use FitnessWeb, :controller

    def create(conn, %{errors: errors}) do
        render(conn, "create.html", changeset: errors)
    end

    def create(conn, _params) do
        changeset = Fitness.Instructors.changeset(%Fitness.Instructors{}, %{})
        render(conn, "create.html", changeset: changeset)
    end

    def add(conn, %{"instructors" => instructors}) do
        changeset = Fitness.Instructors.changeset(%Fitness.Instructors{}, instructors)

        case Fitness.InstructorQueries.create(changeset) do
            {:ok, _} -> redirect(conn, to: Routes.page_path(conn, :index))
            {:error, reasons} -> create(conn, %{errors: reasons})
        end
    end

    def bind(conn, %{errors: errors}) do
        render(conn, "bind.html", changeset: errors)
    end

    def bind(conn, _) do
        workouts = Fitness.WorkoutQueries.get_workouts_for_select()
        instructors = Fitness.InstructorQueries.get_instructors_for_select()

        changeset = Fitness.WorkoutInstructors.changeset(%Fitness.WorkoutInstructors{}, %{})
        render(conn, "bind.html", changeset: changeset, workouts: workouts, instructors: instructors)
    end

    def createbind(conn, %{"workout_instructors" => workout_instructors}) do
        changeset = Fitness.WorkoutInstructors.changeset(%Fitness.WorkoutInstructors{}, workout_instructors)

        case Fitness.InstructorQueries.bind(changeset) do
            {:ok, _} -> redirect(conn, to: Routes.instructor_path(conn, :bind))
            {:error, reasons} -> bind(conn, %{errors: reasons})
        end
    end
end