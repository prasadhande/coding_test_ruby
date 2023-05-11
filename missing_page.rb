## My dog ate my thesis
## I printed my thesis, but my dog mixed up all the pages.

## I don’t have time to reorder them. Fortunately, I can give it “as is” to my professors. They love spending time sorting things, and the pages are numbered from 1 to 5000. Yes, it’s a very large document.

## However, I saw my dog eating one of the pages. I have to reprint it, but I do not know which one it is.

## The deadline is in a few minutes, so I can only browse through the remaining pages once.

## Can you help me?

## If possible, please observe these additional constraints: I do not have a pencil, and my computer’s battery is so low that the only thing it can do as its final action is print the page I select. I have an old calculator that I can use to perform only the four basic arithmetic operations.


def find_missing_page(pages)
  expected_sum = (1..5000).sum
  actual_sum = pages.sum

  missing_page_number = expected_sum - actual_sum

  puts "The missing page number is: #{missing_page_number}"

  # print the missing page
  print_missing_page(missing_page_number)
end

def print_missing_page(page_number)
  # connect to the printer
  printer = connect_to_printer()

  # print the missing page
  printer.print_page(page_number)

  # disconnect from the printer
  printer.disconnect()
end

def connect_to_printer
  # code to connect to the printer goes here
  # return a printer object
end




# create an array of page numbers
pages = (1..5000).to_a

# simulate dog eating a page
pages.delete_at(rand(5000))

# find the missing page and print it
find_missing_page(pages)
