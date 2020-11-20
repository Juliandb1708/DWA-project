defmodule ChatWeb.ChatLive do
    use ChatWeb, :live_view

    alias ChatWeb.{ChatComponent, LoginComponent}
    alias Chat.{Chats, Messages}

    def mount(_params, _session, socket) do
      socket =
        assign(socket,
          username: "",
          usernameSet: false
        )

      {:ok, socket}
    end

    def handle_params(%{"id" => id}, _url, socket) do
      if connected?(socket), do: Messages.subscribe(id)

      id = String.to_integer(id)
      chat = Chats.get_chat!(id)
      messages = Messages.get_message_by_chat(id)

      socket = assign(socket,
        selected_chat: chat,
        messages: messages
      )

      {:noreply, socket}
    end

    def handle_params(_, _url, socket), do: {:noreply, socket}

    def render(assigns) do
      ~L"""

      <%= if !@usernameSet do %>
        <%= live_component @socket, LoginComponent%>
      <% else %>
        <%= live_component @socket, ChatComponent,
                           id: 1,
                           username: @username,
                           selected_chat: @selected_chat,
                           messages: @messages %>
      <% end %>
      """
    end

    def handle_event("submit_username", %{"username" => username} = params, socket) do
      socket =
        assign(socket,
          username: username,
          usernameSet: true
        )

      {:noreply, socket}
    end

    def handle_info({:message_added, message}, socket) do
      socket =
        update(
          socket,
          :messages,
          fn messages -> messages ++ [message] end
        )

      {:noreply, socket}
    end
end
