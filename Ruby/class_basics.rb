
# For methods on object see: http://ruby-doc.org/core-2.0/Object.html

class MyClass

   ClassConstant = 10
   @@class_and_subclass_counter = 1
   
   # An instance variable of the class, not of the objects initialized from this class.
   # Not the same as @instance_variable defined in initialize.
   @instance_variable = 5
   
   #===
   # class methods
   #===
   
   def self.class_and_subclass_counter
     @@class_and_subclass_counter
   end
   class << self
      def im_also_a_class_method
         @instance_variable
      end
   end
   
   #===
   # instance methods
   #===
   
   def initialize
     @instance_variable = 20
   end
   
   def i_am_public
      throw "Can't access private method" if i_am_private != "private"
      "public"
   end

# This is a method call that sets the default visibility of subsequently defined methods to private.  
# It does not apply to variables. 
private
   
   ImNotPrivate = 20
   
   def i_am_private
      "private"
   end
   
end

class SubClass < MyClass
   @@class_and_subclass_counter += 1
   @instance_variable = 4
end

# Constants are accessible, regardless of 'private' setting.
throw "ClassConstant" if MyClass::ClassConstant != 10
throw "ImNotPrivate" if MyClass::ImNotPrivate != 20

x = MyClass.new
throw "Access public method" if x.i_am_public != "public"

# You can access an instance variable externally... 
throw "can access an instance variable externally" if x.instance_variable_get(:@instance_variable) != 20
x.instance_variable_set(:@instance_variable,30);
throw "can set an instance variable externally" if x.instance_variable_get(:@instance_variable) != 30

# You can also access class level instance variables externally
throw "Class instance variable" if MyClass.instance_variable_get(:@instance_variable) != 5
throw "Subclass instance variable" if SubClass.instance_variable_get(:@instance_variable) != 4

# Subclasses share @@ variables with their parent.
throw "SubClass can change class @@ variable" if MyClass.class_and_subclass_counter != 2
throw "SubClass can change class @@ variable" if SubClass.class_and_subclass_counter != 2

throw "Alternate definition of class methods" if MyClass.im_also_a_class_method != 5
throw "Alternate definition of class methods" if SubClass.im_also_a_class_method != 4