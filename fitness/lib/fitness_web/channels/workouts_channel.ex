defmodule FitnessWeb.WorkoutsChannel do
    use Phoenix.Channel

    def join("workouts:" <> workouts_id, _message, socket) when workouts_id <= 0, do: {:error, %{reason: "Invalid workout id"}}
    def join("workouts:" <> workouts_id, _message, socket), do: {:ok, socket}

    def send_update(workouts) do
        payload = %{"places" => workouts.places_available}
        
        FitnessWeb.Endpoint.broadcast("workouts:#{workouts.id}", "update_places", payload)
    end
end