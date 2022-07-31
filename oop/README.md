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


## Relation between objects

Exists other types of relations between objects

1. *Dependency:* It's the most basic and the weakest type of relationship between objects. There is a dependency between two classes if some changes to the definition of one class might result in modifications to another class. Dependency typically occurs when specifies concrete class names in the code. For example, when specifying types in method signatures, when instantiating objects via constructor call, etc. The code becomes less dependent if it uses interfaces or abstract classes instead of concrete classes.

2. *Association:* It's a relationship in which one object uses or interacts with another. Association can be seen as a specialized kind of dependency, where an object always has access to the objects with which it interacts, whereas simple dependency doesn't establish a permanent link between objects.
In general, an association is used to represent something like a field in a class. An association could be a dependency too.

3. *Aggregation:* It's a specialized type of association that represent "one-to-many", "many-to-many" or "whole-part" relations between multiple objects. Usually, under aggregation, an object "has" a set of other objects and servers as a container or collection. The component can exist without the container and can be linked to several containers at the same time.

4. *Composition:* It's a specific kind of aggregation, where one object is composed of one or more instances of the other. The difference between this relation and others is that the component can only exist as a part of the container. 

```
    Dependency: Class A can be affected by changes in Class B.
    Association: Object A knows about object B. Class A depends on B.
    Aggregation: Object A knows about object B, and consists of B. Class A depends on B.
    Composition: Object A knows about object B, consists of B, and manages B's life cycle. Class A depend on B.
    Implementation: Class A defines methods declared in interface B. Objects A can be treated as B. Class A depends on B.
    Inheritance: Class A inherits interface and implementation of class B but can extend it. Object A can be treated as B. Class A depends on B.
```