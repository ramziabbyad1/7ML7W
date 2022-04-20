defmodule Rectangle do
	def area({w,h}), do: h*w
	def perimeter({w,h}) do
		2*(w+h)
	end
end

defmodule Square do
	def area({w}), do: Rectangle.area({w,w})
	def area({w,h}) when w == h do
		Rectangle.area({w,h})
	end
	def perimeter({w}) do
		Rectangle.perimeter({w,w})
	end
	def perimeter({w,h}) when w == h do
		Rectangle.perimeter({w,w})
	end
end

#defmodule Point do
#  def dist({{x1,y1},{x2,y2}}), do: :math.sqrt(x1*x1+x2*x2)
#end
#
#defmodule Circle do
#  def permiter_r({r}), do: 2*:math.pi()*r
#  def permiter_d({r}), do: 2*:math.pi()*r
#  def area({r}), do: :math.pi()*r*r
#  def radius_d({d}), do: d/2 
#end
#
#defmodule 

r = {3,4}
IO.puts "The area of rectangle #{inspect r} is #{Rectangle.area r}"
s = {4}
IO.puts "The area of square #{inspect s} is #{Square.area s}"
#IO.puts "The area of rectangle #{inspect r} is #{Square.area r}"

#some geometry objects in tuple form
p1 = {1,0}
p2 = {0,1}
l1 = {0,1,1}
c1 ={2.53}
fivegon1={1,3,5,2.1}
triangle1={3, 4}

IO.puts "p1: #{inspect p1}"
IO.puts "p2: #{inspect p2}"
IO.puts "l1: #{inspect l1}"
IO.puts "c1: #{inspect c1}"
IO.puts "fivegon1: #{inspect fivegon1}"
IO.puts "triangle1: #{inspect triangle1}"
#
hypotenuse = fn({x,y}) -> :math.sqrt(x*x+y*y) end
IO.puts "Hypotenuse of triangle #{inspect triangle1} is #{hypotenuse.(triangle1)}"
#
IO.puts "convert 'fish' string to atom :#{ String.to_atom("fish") }"
IO.puts "is \"fish\" an atom? #{is_atom("fish")}" #false
IO.puts "is :fish an atom? #{is_atom(:fish)}" #true

