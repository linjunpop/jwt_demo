defmodule JwtDemo.DecoderTest do
  use ExUnit.Case
  alias JwtDemo.Decoder

  describe "decode/1" do
    test "decode unsecured JWT" do
      jwt = "eyJhbGciOiJub25lIn0.eyJzdWIiOiJ1c2VyLTEyMzEyMzEyMyJ9"

      assert {%{"alg" => "none"}, %{"sub" => "user-123123123"}} == Decoder.decode(jwt)
    end

    test "decode signed JWT" do
      jwt =
        "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyLTEyMzEyMzEyMyJ9.JXmdNRfwZmq3qAYZAVjXk0crv9axjR7HfwnNoF87qnc"

      assert {%{"alg" => "HS256"}, %{"sub" => "user-123123123"}} == Decoder.decode(jwt)
    end
  end
end
