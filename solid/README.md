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
```

## Interface Segregation Principle (ISP)

## Dependency Inversion Principle (DIP)