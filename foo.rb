require "completion"

Completion.register("foo")

Completion.build do |words, index|
  ["foo", "bar", "baz"]
end
