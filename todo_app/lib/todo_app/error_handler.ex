defmodule TodoApp.ErrorHandler do
  def parse(%{errors: errors}) do
    errors
    |> Enum.map(fn {field, {error, _details}} ->
      [
        field: field,
        message: String.capitalize(error)
      ]
    end)
  end

  def parse([field, message]) do
    [
      field: field,
      message: message
    ]
  end
end
