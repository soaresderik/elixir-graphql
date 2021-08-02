defmodule TodoApp.Shared.FieldRenamer do
  def rename(k) do
    fn parent, _, _ -> {:ok, Map.get(parent, k)} end
  end
end
