# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Chat.Repo.insert!(%Chat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Chat.Repo
alias Chat.Chats.Chat

Repo.insert!(%Chat{
  name: "Algemeen"
})

Repo.insert!(%Chat{
  name: "Help"
})

Repo.insert!(%Chat{
  name: "Muziek"
})

Repo.insert!(%Chat{
  name: "Random"
})
