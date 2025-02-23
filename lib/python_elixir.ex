defmodule PythonElixir do
  def sum_array do
    numbers = [1, 2, 3]

    {result, _globals} =
      Pythonx.eval(
        """
        import numpy as np
        arr = np.array(x)
        sum_result = np.sum(arr)
        int(sum_result)
        """,
        %{"x" => numbers}
      )

    Pythonx.decode(result)
  end
end
