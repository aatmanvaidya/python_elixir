import Config

config :pythonx, :uv_init,
  pyproject_toml: """
  [project]
  name = "project"
  version = "0.0.0"
  requires-python = "==3.10.*"
  dependencies = [
    "feluda==0.9.2",
    "feluda-dimension-reduction==0.1.2",
    "matplotlib==3.10.0"
  ]
  """
