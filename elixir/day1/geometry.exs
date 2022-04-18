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
IO.puts "The area of rectangle #{inspect r} is #{Square.area r}"

p={x,y}
line={m,a,b}
circle={r}
polygon={a,b,c,d,e}
triangle={x,y,z}

def hypotenuse({x,y}), do: :math.sqrt(x*x+y*y)

String.to_atom("fish")
is_atom("fish") #false

