defmodule FitWeb.WorkoutView do
  use FitWeb, :view

  def format_date(date) do
    {{y, m, d}, {h, mi, _}} = NaiveDateTime.to_erl(date)
    "#{d}-#{m}-#{y} om #{h}:#{mi}"
  end
end
