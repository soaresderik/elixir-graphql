defmodule TodoApp.ErrorHandling do
  def extract_error_msg(%{errors: errors}) do
    errors
    |> Enum.map(fn {field, {error, _details}} ->
      [
        field: field,
        message: String.capitalize(error)
      ]
    end)
  end

  def extract_error_msg([field, message]) do
    [
      field: field,
      message: message
    ]
  end
end
