defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&convert/1)
  end

  defp convert(?G), do: ?C
  defp convert(?C), do: ?G
  defp convert(?T), do: ?A
  defp convert(?A), do: ?U
end
