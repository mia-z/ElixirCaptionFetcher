defmodule Transcript do
  import SweetXml

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
    %Transcript{ :rows => Enum.map(rows, fn row -> %Text{ :start => row.start, :duration => row.duration, :content => row.content } end) }
  end
end
