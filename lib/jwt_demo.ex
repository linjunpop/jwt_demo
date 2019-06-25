defmodule JwtDemo do
  @moduledoc """
  Documentation for JwtDemo.
  """

  @doc """
  Generate a JWT token from `header` and `payload`
  """
  def generate_jwt(payload, sign \\ nil)

  def generate_jwt(payload, nil) when is_map(payload) do
    [
      encode_map(%{alg: "none"}),
      encode_map(payload)
    ]
    |> Enum.join(".")
  end

  def generate_jwt(payload, {:sha256, secret_key}) do
    header_and_payload =
      [
        encode_map(%{alg: "HS256"}),
        encode_map(payload)
      ]
      |> Enum.join(".")

    signature = :crypto.hmac(:sha256, secret_key, header_and_payload)

    [header_and_payload, base64_encode(signature)]
    |> Enum.join(".")
  end

  defp encode_map(data) when is_map(data) do
    data
    |> Jason.encode!()
    |> base64_encode()
  end

  defp base64_encode(string) do
    string
    |> Base.url_encode64()
    # remove trailing equal sign
    |> String.replace(~r/=$/, "")
  end
end
