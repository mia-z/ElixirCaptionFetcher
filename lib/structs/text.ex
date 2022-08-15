defmodule Text do

  @derive Jason.Encoder
  defstruct [
    start: nil,
    duration: nil,
    content: nil
  ]
end
