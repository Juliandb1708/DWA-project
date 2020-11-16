defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    case number do
      n when n >= 1000 -> "M" <> numeral(number - 1000)
      n when n >= 900 -> "CM" <> numeral(number - 900)
      n when n >= 500 -> "D" <> numeral(number - 500)
      n when n >= 400 -> "CD" <> numeral(number - 400)
      n when n >= 100 -> "C" <> numeral(number - 100)
      n when n >= 90 -> "XC" <> numeral(number - 90)
      n when n >= 50 -> "L" <> numeral(number - 50)
      n when n >= 40 -> "XL" <> numeral(number - 40)
      n when n >= 10 -> "X" <> numeral(number - 10)
      n when n >= 9 -> "IX" <> numeral(number - 9)
      n when n >= 5 -> "V" <> numeral(number - 5)
      n when n >= 4 -> "IV" <> numeral(number - 4)
      n when n >= 1 -> "I" <> numeral(number - 1)
      0 -> ""
    end
  end

end
