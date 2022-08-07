# <span style="color: #da680b;">Design Patterns:</span>

They are typical solutions to commonly occurring problems in software design. They are like pre-made blueprints that 
allow customized them and solve a recurring design problem

### Creational Patterns

Provide object creation mechanisms that increase flexibility and reuse existing code.

### Structural Patterns

Explain how to assemble objects and classes into larger structures, while keeping these structures flexible and 
efficient.

### Behavioral Patterns

Take care of effective communication and the assignment of responsibilities between objects.

# <span style="color: #da680b;">Features of Good Design:</span>

Process of designing software architecture: things to aim for and things you'd better avoid.

### Code reuse

Cost and time are two of the most valuable metrics when developing any software product. Less time in development means 
entering the market earlier than the competitors. Lower development costs mean more money is left for marketing and a
broader reach to potential customers.

*Code reuse* is one of the most common ways to reduce development costs.

The idea looks great on paper, but it turns out that making existing code work in a new context usually takes extra 
effort. 

### Extensibility

**Change** is the only constant thing in a programmer's life. Developers try to provide for possible future changes when
designing an application's architecture.

# <span style="color: #da680b;">Design principles:</span>

What's a good software design? How would u measure it? The answers are different depending on the type of application 
you're building. However, there are several universal principles of software design.

### Encapsulate What Varies

Identify the aspects of your application that vary and separate them from what stays the same. The main goal of this
principle is to minimize the effect caused by the changes. You can isolate the parts of the program that vary in 
independent modules, protecting the rest of the code from adverse effects. As a result, you spend less time getting
the program back into working shape, implementing and testing the changes.

#### Encapsulation on a method level

Suppose that you're making an e-commerce. Somewhere in your code, there's a gerOrderTotal(order) method that calculates 
a grand total for the order including taxes. We can anticipate that tax-related code might change in the future because 
it depends on the country, state, ir even city where customer reside.  You can extract the tax calculation login into
a separate method, hiding it from the original method.

#### Encapsulation on a class level

Over the time you might add more and more responsibilities to a method which used to do a simple thing. These added 
behaviors often come with their own helper fields and methods that eventually blur the primary responsibility of the 
containing class. Extracting everything to a new class might make things much more clear and simple. Objects of the 
Order class delegate all tax-related work to a special object that does just that.

### Program to an Interface, not an implementation

Depend on abstractions, not on concrete classes. You can tell that the design is flexible enough if you can easily 
extend it without breaking any existing code.

When you want to make two classes collaborate, you can start by making one of them dependent on the other. Hell, I 
often start by doing that myself. However, there's another, more flexible way to set up collaboration between objects.

1. Determine what exactly one object needs from the other: which method does it execute?
2. Describe these methods in a new interface or abstract class.
3. Make the class that is a dependency implements this interface.
4. Now make the second class dependent on this interface rather than on the concrete class. You still can make it 
work with objects of the original class, but the connection is now much more flexible.

After making this change, you won't probably feel any immediate benefit, On the contrary, the code has become more 
complicated that it was before. However, if you feel that is might be a good extension point for some extra 
functionality, or that some other people who use your code might want to extend it here, then go for it.
`
### Favor composition over inheritance

Inheritance is probably the most obvious and easy way of reusing code between classes. You have two classes with the
same code. Create a common base class for th`ese two and move the similar code into it. Piece of cake!

Unfortunately, inheritance comes with caveats that often become apparent only after your program already ahs tons of 
classes and changing anything is pretty hard. Here's  a list of those problems:

1. **A subclass can't reduce the interface of the superclass.** You have to implement all abstracts methods of the 
parent class even if you won't be using them.
2. **When overriding methods you need to make sure that the new behavior is compatible with the base one.** It's 
important because objects of the subclass may be passed to any code that expects objects of the superclass, and
you don't want that code break;
3. **Inheritance breaks encapsulation of the superclass** because the internal details of the parent class become 
available to the subclass. There might be opposite situation where a programmer makes a superclass aware of some 
details of subclasses for the sake of making further extension easier.
4. **Subclasses are tightly coupled to superclasses.** Any change in the superclass may break the functionality
of subclasses.
5. **Trying to reuse code through inheritance can lead to creating parallel inheritance hierarchies.** Inheritance 
usually takes place in a single dimension. But whenever there are two or more dimensions, you have to crate lots of
class combinations, bloating the class hierarchy to a ridiculous size.

There's an alternative to inheritance called composition. Whereas inheritance represents the "is a" relationship 
between classes (a car is a transport), composition represents the "has a" relationship (a car has an engine).

