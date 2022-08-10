# <span style="color: #da680b;">SOLID principles:</span>

SOLID is a mnemonic for five design principles intended to make software design more understandable, flexible and
maintainable.

## Single Responsibility Principle (SRP)

`A class should have just one reason to change.`

Each class in our system should be responsible only for a single part of the functionality, and make that
responsibility encapsulated by the class.

If one class does many things we will have to change it every time when one of these things change. If you change the
class you'll have the risk of breaking other parts.

```php
class Employee {
    protected string $name;
    
    public function getName() {
        return $this->name;
    }
}

class TimeSheetReport {
    public function print(Employee $employee) {
        // do some stuff
    }
}
```

## Open Closed Principle (OCP)

`Classes should be open for extension but closed for modification.`

The idea of this principle is to avoid breaking and keep your old code when you implement new features.

A class is open if you can extend it, create subclasses and do whatever with it adding new methods or fields,
overriding the base behavior. If you create a class using final, the class will be closed for modification. Because, 
its interface would be clearly defined and won't change in the future.

```php
interface Order {
    public function getTotal(): int;
    public function getTotalWeight(): int;
}

interface Shipping {
    public function getCost(Order $order);
    public function getDate(Order $order);
}

class Ground implements Shipping {
    public function getCost(Order $order) {
        if ($order.getTotal() > 100) {
            return 0;
        }
        return max(10, $order.getTotalWeight() * 1.5);
    }
}

class DefaultOrder implements Order {
    protected $items;
    protected Shipping $shipping;
    
    public function getTotal() {
        return 999;
    }
    
    public function getTotalWeight(): int {
         return 10;
    }
    
    public function getShippingCost() {
        return $this->shipping->getCost($this);
    }
}
```

## Liskov Substitution Principle (LSP)

`When extending a class, remember that you should be able to pass objects of the subclass in place of the objects of 
the parent without breaking the client code.`

The subclasses should remain compatible with the behavior of the superclass.

LSP is a set of checks that allow you to predict whether a subclass remains compatible with the code that was able
to work with objects of the superclass:

1. Parameters in a method of a subclass should match or be more abstract than parameters type in method of the 
superclass.

```php
interface Animal 
{
    // some stuff
}

class Cat implements Animal 
{
    // some stuff
}

class Adult 
{
    public function feedCat(Cat c) 
    {
        // some stuff
    }
}

class Elderly extends Adult 
{
    public function feedCat(Animal c) 
    {
        // some stuff
    }
}
```

2. The return type in a method of a subclass should match or be subtype of the return type in the method of the 
superclass.

```php
interface Animal 
{
    // some stuff
}

class Cat implements Animal 
{
    // some stuff
}

class Persa extends Cat 
{
    // some stuff
}

class Adult 
{
    public function buyCat(): Cat 
    {
        // some stuff
    }
}

class Elderly extends Adult 
{
    public function buyCat(): Persa 
    {
        // some stuff
    }
}
```

3. A method in a subclass shouldn't throw types of exception which the base method isn't expect to throw. In other 
words, types of exceptions should match or be subtypes of the ones that the base method is already able to throw.

4. A subclass shouldn't strengthen pre-conditions. For example, the base method has a parameter with type `int`. If a 
subclass overrides this method and requires that the value of an argument passed to the method should be positive (by
throwing and exception if the value is negative), this strengthens the pre-conditions. The client code, which used to 
work fine when passing negative numbers into the method, now breaks if it starts working with an object of this subclass.

5. A subclass shouldn't weaken post-conditions. 

6. Invariants of a superclass must be preserved. Invariants are the conditions in which an object makes sense (Cat has 
four legs, has the ability to meow, etc.)

7. A subclass shouldn't change values of private fields of the superclass.

[//]: # (```php)
[//]: # ()
[//]: # (```)

## Interface Segregation Principle (ISP)

`Clients shouldn't be forced to depend on methods they do not use.`

Try to make small interfaces that clients don't have to implement behaviors that they don't need. Otherwise, a change 
to a big interfaces would break even clients that don't use the changed methods. Remember that the more interfaces you 
create, the more complex your code becomes. Keep the balance.

```php
interface CloudHostingProvider 
{
    public function createServer(string $region);
    public function listServers(string $region);
}

interface CDNProvider 
{
    public function getCDNAddress();
}

interface CloudStorageProvider 
{
    public function storeFile(string $file_name);
    public function getFile(string $file_name);
}

class Amazon implements CloudHostingProvider, CDNProvider, CloudStorageProvider 
{
    // do some stuff
}

class Dropbox implements CloudStorageProvider 
{
    // do some stuff
}
```

## Dependency Inversion Principle (DIP)

`High-level class shouldn't depend on low-level classes. Both should depend on abstractions. Abstractions shouldn't 
dependt on details. Details should depend on abstractions.`

**Low-level classes** implements basic operations such as working with a disk, transferring data over a network, 
connecting to a database, etc.

**High-level classes** contains a complex business logic that directs low-level classes to do something.

This principle suggests changing the direction of this dependency.

```php
# Abstraction
interface Database 
{
    public function insert();
    
    public function update();
    
    public function delete();
}

# Low-leve module
class Mysql implements Database 
{
    // do some stuff
}

class MongoDB implements Database
{
    // do some stuff
}

# High-level
class BudgetReport 
{
    protected Database $database;
    
    public function open(string $date) 
    {
        // do some stuff
    }
    
    public function save()
    {
        // do some stuff
    }
}
```