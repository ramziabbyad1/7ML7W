defmodule ListExample do
  def print([]), do: :ok
  def print([head|tail]) do
    IO.puts head
    print tail
  end
  def size([]), do: 0
  def size([head|tail]), do: 1+size(tail)
  def max([x,y]), do: if x > y, do: x, else: y
  def max([head|tail]), do: max(head,max(tail))
  def min([x,y]), do: if x < y, do: x, else: y
  def min([head|tail]), do: min(head,min(tail))
end

lis=[:storm, :savre, :catty]
ListExample.print(lis)
IO.puts "size = #{ListExample.size lis}"

IO.puts "max = #{ListExample.max lis}"
IO.puts "min = #{ListExample.min lis}"

defmodule Middle do
  def word_count([], acc), do: acc
  def word_count([head|tail], acc) do
    acc=if acc[head] != nil, do: Map.put(acc, head, acc[head]+1), else: Map.put(acc, head,1)
    word_count(tail,acc)
  end
  def word_count([head|tail]) do#why broken? recurse/call semantics
    map=%{}
    map =Map.put(map,head,1)
    for k <- tail do
      if map[k] != nil do
        map=Map.put(map, k, map[k]+1)
      else
        map=Map.put(map,k,1)
      end
    end
    map
  end
end

map=%{}
map=Middle.word_count([:one,:two,:two],map)
IO.puts "#{inspect map}"
map=%{}
map=Middle.word_count([:one,:two,:two])
IO.puts "#{inspect map}"

defmodule TreeRecurse do
  #def print_tree(nil, indent), do: :ok
  def print_tree({data}, indent), do: IO.puts "#{indent}#{data}"
  def print_tree({root,{left,right}},indent) do
    IO.puts "#{indent}#{root}"
    print_tree({left}, indent <> " ")
    print_tree({right}, indent <> " ")
  end

end


TreeRecurse.print_tree({"Hello Tree", {{"Left branch", {"Left-right child"}}, "Right branch"}}, "")
