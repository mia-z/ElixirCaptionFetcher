defmodule YtFetcher.CaptionFetcher do
  @spec get_youtube_html(binary) ::
          {:error, HTTPoison.Error.t()} | {:ok, any} | {:error, integer, any}
  def get_youtube_html(url) when is_binary(url) do
    html = get_request_body(url)
    html
  end

  @spec get_caption_track_from_html(binary) :: CaptionTrack
  def get_caption_track_from_html(html) when is_binary(html) do
    case Regex.named_captures(~r/(?<j>(?=\[{"baseUrl":)(.*?)(?<=}\]))/, html) do
      %{ "j" => cs } ->
        Jason.decode!(cs)
        |> Enum.at(0)
        |> CaptionTrack.parse_from_json
      _ -> []
    end
  end

  @spec get_captions_data(binary) ::
          {:error, HTTPoison.Error.t()} | {:ok, any} | {:error, integer, any}
  def get_captions_data(caption_resource_url) do
    xml = get_request_body(caption_resource_url)
    xml
  end

  @spec get_request_body(binary) ::
          {:error, HTTPoison.Error.t()} | {:ok, any} | {:error, integer, any}
  defp get_request_body(url) do
    res = HTTPoison.get(url)
    case res do
      {:ok, %{ body: body, status_code: status_code} } ->
        case status_code do
          200 -> { :ok, body }
          _ -> { :error, status_code, body }
        end
      {:error, reason} -> { :error, reason }
    end
  end

end
