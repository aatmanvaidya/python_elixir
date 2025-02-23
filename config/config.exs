import Config

config :pythonx, :uv_init,
  pyproject_toml: """
  [project]
  name = "project"
  version = "0.0.0"
  requires-python = ">=3.10"
  dependencies = [
    "numpy==2.2.3"
  ]
  """
