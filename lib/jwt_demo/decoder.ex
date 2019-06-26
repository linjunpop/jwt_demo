defmodule JwtDemo.Decoder do
  @moduledoc """
  JWT Decoder
  """

  @spliter "."

  @doc """
  Decode `header` and `payload` from a JWT token
  """
  @spec decode(binary) :: {map, map}
  def decode(jwt) do
    case String.split(jwt, @spliter, parts: 3) do
      [header, payload] ->
        do_decode(header, payload)

      [header, payload, _sign] ->
        do_decode(header, payload)
    end
  end

  defp do_decode(header, payload) do
    {
      decode_base64(header),
      decode_base64(payload)
    }
  end

  defp decode_base64(string) do
    string
    |> Base.url_decode64!(padding: false)
    |> Jason.decode!()
  end
end
