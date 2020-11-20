defmodule ChatWeb.ChatComponent do
  use ChatWeb, :live_component

  alias Chat.Chats
  alias Chat.Messages
  alias Chat.Messages.Message

  def mount(socket) do
    chats = Chats.list_chats()
    changeset = Messages.change_message(%Message{})

    socket =
      assign(socket,
        chats: chats,
        selected_chat: hd(chats),
        changeset: changeset
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div class="uk-child-width-1-2 uk-text-center uk-grid">
      <div class="uk-width-1-3@m">
          <h3>Chats</h3>
          <ul class="uk-list uk-list-striped">
            <%= for chat <- @chats do %>
              <li>
              <%= live_patch chat_link(chat),
              to: Routes.live_path(
                        @socket,
                        ChatWeb.ChatLive,
                        id: chat.id
                  ),
              class: "chat_item" %>
              </li>
            <% end %>
              <li>Logged in as: <b><%= @username %></b></li>
          </ul>
      </div>
      <div class="uk-width-2-3@m">
          <ul class="uk-list chat_box">
              <%= @selected_chat.name %>

              <%= for message <- @messages do %>
                <%= if message.username === @username do %>
                  <li style="text-align: right"><span class="uk-badge message self"><%= message.message %></span></li>
                <% else %>
                  <li style="text-align: left"><span class="uk-badge message"><%= message.username %>: <%= message.message %></span></li>
                <% end %>
              <% end %>

              <li style="margin-top: 30px">

              <%= f = form_for @changeset, "#",
                        phx_submit: "send_message",
                        phx_target: @myself %>

              <%= text_input f, :message,
                                placeholder: "Message",
                                class: "uk-input uk-form-width-medium",
                                style: "width: 80%;" %>

              <%= hidden_input f, :username,
                                value: @username %>

              <%= hidden_input f, :chats_id,
                                value: @selected_chat.id %>

              <%= submit "Send", phx_disable_with: "Send",
                                class: "uk-button uk-button-primary" %>
          </li>
         </ul>
      </div>
    </div>
    """
  end

  def handle_event("send_message", %{"message" => params}, socket) do
    case Messages.create_message(params) do
      {:ok, volunteer} ->
        changeset = Messages.change_message(%Message{})

        socket = assign(socket, changeset: changeset)

        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        socket = assign(socket, changeset: changeset)
        {:noreply, socket}
    end
  end

  defp chat_link(chat) do
    assigns = %{name: chat.name}

    ~L"""
    <%= @name %>
    """
  end
end
