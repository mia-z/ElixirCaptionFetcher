defmodule YtFetcher.CaptionFinder do

  @spec get_captions(any) :: %Transcript{rows: list}
  def get_captions(xml) do
    Transcript.parse_xml(xml)
  end
end
