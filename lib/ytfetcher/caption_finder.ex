defmodule YtFetcher.CaptionFinder do

  @spec get_captions_map(any) :: %Transcript{rows: list}
  def get_captions_map(xml) do
    Transcript.parse_xml(xml)
  end

  @spec get_captions_json(any) :: binary()
  def get_captions_json(xml) do
    Transcript.encode_to_json(xml)
  end
end
