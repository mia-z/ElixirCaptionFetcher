defmodule YtFetcher.Router do
  use Plug.Router
  import YtFetcher.CaptionFetcher
  import YtFetcher.CaptionFinder

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/:video_id" do
    case get_youtube_html("https://www.youtube.com/watch?v=" <> video_id) do
      {:ok, html} ->
        %CaptionTrack{ base_url: url } = get_caption_track_from_html(html)
        case get_captions_data(url) do
          {:ok, xml} ->
            transcript = get_captions_json(xml)
            send_resp(conn, 200, transcript)
          {:error, status_code, reason} ->
            send_resp(conn, status_code, reason)
        end
      {:error, status_code, reason} ->
        send_resp(conn, status_code, reason)
    end
  end

  match "/favicon.ico" do
    send_resp(conn, 404, "Not Found")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
