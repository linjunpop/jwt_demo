defmodule JwtDemoTest do
  use ExUnit.Case
  use ExUnitProperties

  doctest JwtDemo

  describe "Unsecured JWT" do
    property "circular encode and decode" do
      check all user_id <- string(:alphanumeric) do
        jwt = JwtDemo.Encoder.encode(%{"user" => user_id}, :none)

        {header, payload} = JwtDemo.Decoder.decode(jwt)

        assert %{"alg" => "none"} == header
        assert %{"user" => user_id} == payload
      end
    end
  end
end
