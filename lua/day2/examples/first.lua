book = {
	title = "Grail Diary",
	author = "Henry Jones",
	pages = 100
}

--access some properties
print("\n\nproperties of book table")
print("book.title = " .. book.title)
print("book.author = " .. book.author)
print("book.pages = " .. book.pages)

--add some properties
print("\n\nadd some properties")
book.chapters = 20
book.stars = 5
print("book.chapters = " .. book.chapters)
print("book.stars = " .. book.stars)

--modify properties
book.title = "Diary of the grail"
print("\n\nmodify properties")
print("book.title = " .. book.title)

--access using variable key
key = "title"
print("\n\naccess using variable key")
print("book[key] = " .. book[key])

--delete a property
book.pages = nil
print("\n\ndelete book.pages")
print(book.pages)

--use the low level doFile
print("\n\nimport the print_table function from the util library using dofile")
dofile('util.lua')

--you can also link using lua -l util
print("\n\nprint a book\n")
print_table(book)

medals = {
	"gold",
	"silver",
	"bronze"
}
print("\n\ntables are also dictionaries that work like arrays much like phps arrays")
print("\ndon't forget, lua arrays are 1-based")
print("we'll use the medals table below:")
print_table(medals)
print("we can iterate using # operator since our table is defined as array")
k = 1
while k <= #medals do
	print("medals[" .. k .."] = " .. medals[k])
	k = k + 1
end

print("medals[0] = \"whoops, can i do this?\"")
medals[0] = "whoops, can i do this?"
print("print using a standard while loop: ")
k = 1
while k <= #medals do
	print("medals[" .. k .."] = " .. medals[k])
	k = k + 1
end

print("print using util.print_table: ")
print_table(medals)

--combining object/array initilizer for table
print("combining array and object forms of table")
ice_cream_scoops = {
	"vanilla",
	"chocolate";

	sprinkles = true
}

print("ice_cream_scoops[1] = " .. ice_cream_scoops[1])
print("ice_cream_scoops.sprinkles = " .. tostring(ice_cream_scoops.sprinkles))


