defmodule Bob do
  def hey(input) do
    cond do
      silence(input) -> "Fine. Be that way!"
      question(input) && yell(input) -> "Calm down, I know what I'm doing!"
      question(input) -> "Sure."
      yell(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp silence(input) do
    cond do
      String.trim(input) == "" -> true
      true -> false
    end
  end

  defp question(input) do
    cond do
      String.ends_with?(String.trim(input), "?") -> true
      true -> false
    end
  end

  defp yell(input) do
    cond do
      String.upcase(input) == String.downcase(input) -> false
      String.upcase(input) == input -> true
      true -> false
    end
  end
end
