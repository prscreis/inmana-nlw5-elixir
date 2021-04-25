defmodule Inmana.WecomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You're a very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "paulo", "age" => "32"}
      expected_result = {:ok, "Welcome, paulo!"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "paulo", "age" => "15"}
      expected_result = {:error, "You shall not pass, paulo!"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
