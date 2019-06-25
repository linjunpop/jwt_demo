defmodule JwtDemo do
  @moduledoc """
  Documentation for JwtDemo.
  """

  @doc """
  Generate a JWT token from `header` and `payload`
  """
  @spec generate_jwt(binary(), binary()) :: binary()
  def generate_jwt(header, payload) do
    [
      encode(header),
      encode(payload)
    ]
    |> Enum.join(".")
  end

  defp encode(data) do
    data
    |> Base.url_encode64()
    # remove trailing equal sign
    |> String.replace(~r/=$/, "")
  end
end
