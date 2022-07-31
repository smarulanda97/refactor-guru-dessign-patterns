# Basic of OOP

Object Oriented Programming is a paradigm base on the concept of wrapping pieces of data, and
behavior related to that data, into special bundles called objects.

## Pillars of OOP

This paradigm is based on 4 pillars, concepts that differentiate it from others.

1. *Abstraction:* In OOP, the objects of the program are based on real-world objects. However, the objects of the program don't represent the original with 100% accuracy (and it's rarely required that they do). Instead your objects only model attributes and behaviors of real objects in a specific context.
`Abstraction is a model of a real-world example object or phenomenon limited to a specific context, which represents all details relevant to this context with high accuracy and omits all the rest.`

2. *Encapsulation:* Each object has an interface - a public interface part of an object, open to interactions with the other objects. To encapsulate something means to make it private, and thus accessible only from within the methods of its class. There's a little bit less restrictive mode called protected that makes a member of a class available to subclasses as well.
`Encapsulation is the ability of an object to hide parts of its state and behaviors from other objects, exposing only a limited interface to the rest of the program.`

3. *Inheritance:* Creates a class that's slightly different from an existing one, there's no need to duplicate code. Instead, is possible to extend the existing class and put the extra functionality into a resulting subclass, which inherits fields and methods of the superclass. 
`Is the ability to build new classes on top of existing ones. The main benefit of inheritance is code reused.`
4. *Polymorphism:* Thinks of polymorphism as the ability of an object to "pretend" to be something else, usually a class it extends or an interface it implements.
`Is the ability to detect the real class of an object and call its implementation even when its real type is unknown in the current context.`
