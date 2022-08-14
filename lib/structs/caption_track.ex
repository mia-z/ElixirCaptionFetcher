defmodule CaptionTrack do
  import Name

  defstruct [
    base_url: nil,
    is_translatable: false,
    kind: nil,
    language_code: nil,
    name: %Name {},
    vss_id: nil
  ]

  def parse_from_json( %{ "baseUrl" => base_url, "isTranslatable" => is_translatable }) do
    %CaptionTrack{
      base_url: base_url,
      is_translatable: is_translatable
    }
  end
end
