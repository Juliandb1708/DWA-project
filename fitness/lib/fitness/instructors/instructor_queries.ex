defmodule Fitness.InstructorQueries do
    import Ecto.Query, warn: false

    alias Fitness.{Repo, Instructors}

    def create(instructor), do: Repo.insert(instructor)
end