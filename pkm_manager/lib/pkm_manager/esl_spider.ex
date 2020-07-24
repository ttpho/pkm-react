# Crawly.Engine.start_spider(EslSpider)
# 
defmodule EslSpider do
  use Crawly.Spider

  alias Crawly.Utils

  @impl Crawly.Spider
  def base_url(), do: "https://www.erlang-solutions.com"

  @impl Crawly.Spider
  def init(), do: [start_urls: ["https://www.erlang-solutions.com/blog.html"]]

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)
    hrefs = document |> Floki.find("a.more") |> Floki.attribute("href")

    requests =
      Utils.build_absolute_urls(hrefs, base_url())
      |> Utils.requests_from_urls()

    title = document |> Floki.find("article.blog_post h1") |> Floki.text()

    %{
      :requests => requests,
      :items => [%{title: title, url: response.request_url}]
    }
  end
end
