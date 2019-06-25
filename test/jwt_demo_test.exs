defmodule JwtDemoTest do
  use ExUnit.Case
  doctest JwtDemo

  describe "generate_jwt/2" do
    test "generate unsecured JWT" do
      header = ~S"""
      {
        "alg": "none"
      }
      """

      payload = ~S"""
      {
        "sub": "user-123123123"
      }
      """

      result = JwtDemo.generate_jwt(header, payload)

      assert result == "ewogICJhbGciOiAibm9uZSIKfQo.ewogICJzdWIiOiAidXNlci0xMjMxMjMxMjMiCn0K"
    end
  end
end
