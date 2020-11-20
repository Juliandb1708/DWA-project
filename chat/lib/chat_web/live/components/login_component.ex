defmodule ChatWeb.LoginComponent do
    use ChatWeb, :live_component

    def mount(socket) do
      {:ok, socket}
    end

    def render(assigns) do
      ~L"""
      <div class="uk-alert">
        <form phx-submit="submit_username">
          <input name="username" class="uk-input uk-form-width-medium" style="width: 30%;" type="text" placeholder="Username">
          <button type="submit" class="uk-button uk-button-primary">Join</button>
        </form>
      </div>
      """
    end
end
