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
end