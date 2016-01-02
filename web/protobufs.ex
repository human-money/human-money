defmodule Protobufs do
  use Protobuf, from: Path.wildcard(Path.expand("protobufs/**/*.proto", __DIR__))
end
