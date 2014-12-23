# When you add a singleton method to an object, ruby inserts an anonymous class into the inheritance hierarchy to hold
# the new method.  This class is called a singleton class.
# - Doesnt' respond to the class method (its parent's class is returned instead)

x = Array.new
def x.size
   "boo"
end

throw "Singleton method" if x.size != "boo"

# Note the use of "to_s"
throw "Class skips the singleton class" if x.class.to_s != "Array"

