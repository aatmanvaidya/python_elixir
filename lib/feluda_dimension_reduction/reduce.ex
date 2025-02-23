defmodule FeludaDimensionReduction.Reduce do
  alias Pythonx, as: Py

  def run do
    file_path = Path.join(__DIR__, "config.yml") |> to_string()
    IO.inspect(file_path)

    unless File.exists?(file_path) do
      raise ArgumentError, "File does not exist: #{file_path}"
    end

    sample_embeddings =
      for _ <- 1..50 do
        for _ <- 1..6, do: :rand.uniform()
      end

    IO.inspect(hd(sample_embeddings), label: "First Sample Embedding")

    {result, _globals} =
      Py.eval(
        """
        from feluda import Feluda
        from feluda.models.media_factory import VideoFactory
        import numpy as np

        feluda = Feluda('#{file_path}')
        feluda.setup()
        dimension_reduction_operator = feluda.operators.get()["dimension_reduction"]

        sample_embeddings = np.array(sample_embeddings)
        input_data = [
          {"payload": str(i), "embedding": embedding}
          for i, embedding in enumerate(sample_embeddings)
        ]
        reduced_data = dimension_reduction_operator.run(input_data)
        reduced_embeddings = np.array([d["reduced_embedding"] for d in reduced_data])

        {
          "reduced_embeddings": reduced_embeddings.tolist(),
          "len_reduced_embeddings": len(reduced_embeddings),
          "reduced_embeddings_shape": reduced_embeddings[0].shape
        }
        """,
        %{"sample_embeddings" => sample_embeddings}
      )

    decoded_result = Py.decode(result)

    reduced_embeddings = decoded_result["reduced_embeddings"]
    IO.inspect(hd(reduced_embeddings), label: "First Sample Embedding from Python")

    # # Return all extracted values
    # %{
    #   sample_embeddings: sample_embeddings,
    #   len_reduced_embeddings: len_reduced_embeddings,
    #   reduced_embeddings_shape: reduced_embeddings_shape
    # }
    reduced_embeddings
  end
end
