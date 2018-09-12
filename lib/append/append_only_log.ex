defmodule Append.AppendOnlyLog do
  alias Append.Repo

  @moduledoc """
  Behaviour that defines functions for accessing and inserting data in an
  Append-Only database
  """

  @callback insert(struct) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  @callback get(integer) :: Ecto.Schema.t() | nil | no_return()
  @callback update(Ecto.Schema.t(), struct) ::
              {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}

  defmacro __using__(_opts) do
    quote do
      @behaviour Append.AppendOnlyLog

      def insert(attrs) do
        %__MODULE__{}
        |> __MODULE__.changeset(attrs)
        |> Repo.insert()
      end

      def get(id) do
      end

      def update(%__MODULE__{} = item, attrs) do
      end

      defoverridable Append.AppendOnlyLog
    end
  end
end
