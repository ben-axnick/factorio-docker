defmodule App.Zipfile do
  use Arc.Definition

  @acl :public_read
  @versions [:original]

  def filename(version, _) do
    "default.zip"
  end

  def storage_dir(version, {file, scope}) do
    "/tmp"
  end
end
