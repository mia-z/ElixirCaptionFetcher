defmodule YtFetcherTest.CaptionFinder do
  use ExUnit.Case, async: true

  test "parses the xml of captions data into a struct" do
    #Arrange
    xml = File.read!("./test/artifacts/captions.xml")

    # Act
    caption_rows = YtFetcher.CaptionFinder.get_captions(xml)

    #Assert
    assert Enum.count(caption_rows.rows) > 0
  end
end
