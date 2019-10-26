defmodule Auction.Repo do
  # alias Auction.Item

  # @item [
  #   %Item{
  #     id: 1,
  #     title: "My First item",
  #     description: "A taske item",
  #     ends_at: ~N[2020-02-02 01:00:00]
  #   },
  #   %Item{
  #     id: 2,
  #     title: "My First 2",
  #     description: "A taske item2",
  #     ends_at: ~N[2020-02-02 01:00:00]
  #   },
  #   %Item{
  #     id: 3,
  #     title: "My First item3",
  #     description: "A taske item3",
  #     ends_at: ~N[2020-02-02 01:00:00]
  #   }
  # ]

  # def all(Item), do: @item

  # def get!(Item, id) do
  #   Enum.find(@item, fn item -> item.id === id end)
  # end

  # def get_by(Item, attrs) do
  #   Enum.find(@item, fn item ->
  #     Enum.all?(Map.keys(attrs), fn key ->
  #       Map.get(item, key) === attrs[key]
  #     end)
  #   end)
  # end

  use Ecto.Repo,
    otp_app: :auction,
    adapter: Ecto.Adapters.Postgres
end
