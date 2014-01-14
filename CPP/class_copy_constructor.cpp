#include <iostream>
#include <vector>
#include <assert.h>

using namespace std;

class TestClass {
   public:
      
      TestClass();
      TestClass(const TestClass&);
      TestClass& operator=(const TestClass&);
      ~TestClass();
      
      int data;
      vector<int>* vecptr;
};

TestClass::TestClass() {
   data = -1;
   vecptr = new vector<int>;
}
TestClass::TestClass(const TestClass& x) {
   vecptr = NULL;
   // Implicitly call operator=
   *this = x;
}
TestClass& TestClass::operator=(const TestClass& x) {
   if (this != &x) {
      data = x.data;
      if (vecptr) delete vecptr;
      vecptr = new vector<int>;
      
      *vecptr = *(x.vecptr);
   }
   return *this;
}
TestClass::~TestClass() {
   delete vecptr;
}

int main() {
   
   TestClass o;
   o.data = 5;
   o.vecptr->push_back(2);
   o.vecptr->push_back(99);
   
   TestClass cp(o);
   o.data = 6;
   o.vecptr->push_back(300);
   
   assert(cp.data == 5);
   assert(cp.vecptr->size() == 2);
   return 0;
}