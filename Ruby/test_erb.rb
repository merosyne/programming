
require 'erb'
include ERB::Util

# Run from command line via:
#   erb -r MyClass template.erb > file.txt

class ErbTest

  def initialize
    @str_or_expression = "ERB"
    @mylist = [1, 2, 3, 4, 5]

    #===
    # A file that contains an ERB template should end in .erb
    #
    # ERB gets variables from a binding.  
    #
    # By default, a newline char is added to the page after the position 
    # of each tag.  To suppress in rails: <% for ... -%>
    #
    # Not supported on Dymaxion's version of ruby:
    #     This will be JSON encoded: <%= j("this & that") %>
    #     This will be converted to Textile markup: <%= t("this & that") %>
    #===

    var = <<-'EOL'
<%# This is a comment %>
<h1>test <%= @str_or_expression %></h1>
<ul>
   <% for item in @mylist %>
   <li><%= item %></li>
   <% end %>
</ul>

<%# These require ERB::Util %>
This will be HTML escaped: <%= h("this & that") %><br>
This will be URL encoded: <%= u("this & that") %><br>
EOL

    # - Optional second argument (integer 1-4) allows ERB to run in a separate
    #   thread, with the specified safety level (4 provides maximum isolation).
    # - Optional third argument can be used to suppress newlines after tags.
    renderer = ERB.new(var,0,'>')

    # - A Binding object provides access to the instance variables and methods
    #   that are owned by another object.
    # - Every Ruby object has a binding instance method that provides
    #   a Binding to itself.
    puts renderer.result(binding)
  end

  # To allow a second object to use the private binding method of this object:
  def get_binding
     binding()
  end

end

x = ErbTest.new
