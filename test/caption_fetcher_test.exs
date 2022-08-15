defmodule YtFetcherTest.CaptionFetcher do
  use ExUnit.Case, async: true

  test "parses extracted regex string into captions object with baseUrl" do
    #Arrange
    html = File.read!("./test/artifacts/youtube.html")

    # Act
    captions_resource = YtFetcher.CaptionFetcher.get_caption_track_from_html(html)

    #Assert
    assert is_binary(captions_resource.base_url)
    assert String.starts_with?(captions_resource.base_url,"https://www.youtube.com/api/timedtext")
  end
end
