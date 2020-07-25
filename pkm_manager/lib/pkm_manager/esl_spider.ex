# Crawly.Engine.start_spider(EslSpider)
# response = Crawly.fetch("https://bulbapedia.bulbagarden.net/wiki/Grookey_(Pok%C3%A9mon)")
# {:ok, document} = Floki.parse_document(response.body)
# name = document |> Floki.find(("#mw-content-text > table:nth-child(2) > tbody > tr:nth-child(1) > td > table > tbody > tr:nth-child(1) > td > table > tbody > tr > td:nth-child(1) > big > big > b")
defmodule EslSpider do
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url(), do: "https://bulbapedia.bulbagarden.net/"

  @impl Crawly.Spider
  # https://bulbapedia.bulbagarden.net/wiki/Grookey_(Pok%C3%A9mon)
  # https://bulbapedia.bulbagarden.net/wiki/Snom_(Pok%C3%A9mon)
  # https://bulbapedia.bulbagarden.net/wiki/Sizzlipede_(Pok%C3%A9mon)

  def init(), do: [start_urls: ["https://bulbapedia.bulbagarden.net/wiki/Snom_(Pok%C3%A9mon)"]]

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)

    next_url =
      document
      |> Floki.find("#mw-content-text")
      |> Floki.find("table:nth-child(1)")
      |> Floki.find("table")
      |> Floki.find("tr")
      |> Floki.find("td:nth-child(3)")
      |> Floki.find("table")
      |> Floki.find("table")
      |> Floki.find("tr")
      |> Floki.find("td:nth-child(3)")
      |> Floki.find("a")
      |> Floki.attribute("href")

    root =
      document
      |> Floki.find("#mw-content-text")
      |> Floki.find("table:nth-child(2)")
      |> Floki.find("table")
      |> Floki.find("tr:nth-child(1)")
      |> Floki.find("td")
      |> Floki.find("table")
      |> Floki.find("table")

    url =
      root
      |> Floki.find("tr:nth-child(2)")
      |> Floki.find("td")
      |> Floki.find("table")
      |> Floki.find("table")
      |> Floki.find("tr:nth-child(1)")
      |> Floki.find("td")
      |> Floki.find("a")
      |> Floki.find("img")
      |> Floki.attribute("src")

    parent =
      root
      |> Floki.find("tr:nth-child(1)")

    name =
      parent
      |> Floki.find("td")
      |> Floki.find("table")
      |> Floki.find("table")
      |> Floki.find("tr")
      |> Floki.find("td:nth-child(1)")
      |> Floki.find("big")
      |> Floki.find("big")
      |> Floki.find("b")
      |> hd()
      |> elem(2)

    number =
      parent
      |> Floki.find("th")
      |> Floki.find("big")
      |> Floki.find("big")
      |> Floki.find("a")
      |> Floki.find("span")
      |> hd()
      |> elem(2)

    national_number_string = String.replace(to_string(number), "#", "")

    item = %{
      name: to_string(name),
      national_number: national_number_string,
      url_link: response.request_url,
      url_image: "https:#{url}",
      gen: "VIII"
    }

    requests =
      next_url
      |> Enum.uniq()
      |> Enum.map(&build_absolute_url/1)
      |> Enum.map(&Crawly.Utils.request_from_url/1)

    case PkmManager.Pokemons.create_pokemon(item) do
      {:ok, _} -> IO.inspect("Inserted with success")
      {:error, changeset} -> IO.inspect("Something went wrong #{changeset}")
    end

    %Crawly.ParsedItem{:items => [item], :requests => requests}
  end

  defp build_absolute_url(url), do: URI.merge(base_url(), url) |> to_string()
end
