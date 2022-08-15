defmodule Transcript do
  import SweetXml

  @derive Jason.Encoder
  defstruct [
    rows: []
  ]

  @spec parse_xml(any) :: %Transcript{rows: list}
  def parse_xml(xml) do
    rows = xml |> xpath(
      ~x"//transcript/text"l,
        start: ~x"./@start",
        duration: ~x"./@dur",
        content: ~x"./text()",
    )
    %Transcript{ :rows => Enum.map(rows, fn row -> %Text{ :start => to_string(row.start), :duration => to_string(row.duration), :content => to_string(row.content) } end) }
  end

  @spec encode_to_json(any) :: binary()
  def encode_to_json(xml) do
    transcript = parse_xml(xml)
    Jason.encode!(transcript)
  end
end
