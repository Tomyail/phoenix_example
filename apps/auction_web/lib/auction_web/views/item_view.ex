defmodule AuctionWeb.ItemView do
  #  定义来自 auction_web
  use AuctionWeb, :view

  def integer_to_currency(cents) do
    dolars_and_cents =
      cents
      |> Decimal.div(100)
      |> Decimal.round(2)

    "$#{dolars_and_cents}"
  end
end
