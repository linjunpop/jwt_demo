defmodule JwtDemoTest do
  use ExUnit.Case
  doctest JwtDemo

  describe "generate_jwt/2" do
    test "generate unsecured JWT" do
      payload = %{
        sub: "user-123123123"
      }

      result = JwtDemo.generate_jwt(payload)

      assert result == "eyJhbGciOiJub25lIn0.eyJzdWIiOiJ1c2VyLTEyMzEyMzEyMyJ9"
    end

    test "generate signed JWT" do
      payload = %{
        sub: "user-123123123"
      }

      result = JwtDemo.generate_jwt(payload, {:sha256, "my-secret"})

      assert result ==
               "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyLTEyMzEyMzEyMyJ9.JXmdNRfwZmq3qAYZAVjXk0crv9axjR7HfwnNoF87qnc"
    end
  end
end
