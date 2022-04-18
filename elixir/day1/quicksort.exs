defmodule Quicksort do
  def sort([]), do: []
  def sort([head|tail]) do
    sort( for x <- tail, x >= head, do: x ) ++
    [head] ++
      sort( for x <- tail, x < head, do: x )
  end
end

IO.inspect Quicksort.sort([5,6,2,3,1,9])
