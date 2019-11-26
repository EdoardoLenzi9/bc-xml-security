# SOLID Design Principle

* SRP Single Responsibility Principle

Single purpose classes with a single reason to change

1. describe the primary responsibility in a sentence 
2. group similar methods
3. look at private/protected methods
4. decisions
5. internal relationship between methods and variables


* OCP Open Closed Principle

Open for extension, closed for modifications, 
used for strategy patterns (different behaviours)

1. duplicated code, change history -> classes that frequently change together


* LSP Liskov Substitution Principle

SubTypes must be substitutable for their base type,
don't differentiate the base class from the derived class

1. subclass must accept everything the base class could accept
2. don't violate the post condition of the base class (design by contract)

> check contracts and remember that **each LSP violation is also an OCP 
violation but not vice versa**


* ISP Interface Segregation Principle

Design cohesive interfaces, avoid fat interfaces 
(don't force clients to depend on methods that they never use)

Split fat interface per different clients (group methods);

1. check classes with an high number of public methods
    * check methods that frequently change together
2. group clients


* DIP Dependency Inversion Principle

High level modules should not depend on low level modules, both should 
depend on abstractions.

Abstractions should not depend on details but vice versa.

Comes at the heart of framework design.

1. Use always interfaces, no variable should hold a reference to a concrete class.
2. No class should derive from a concrete class 

Someone soon or later must create a class instance but it mustn't be 
volatile-transient (singleton) 


## LoD Law of Demeter

* Principle of Least Knowledge
* Only talk to immediate friends, don't talk with strangers
* Write shy code
* Minimize coupling

```
final String outputDir = ctxt.getOptions().getScratchDir().getAbsolutePath(); 
a.getB().getC().doSomething() 
```


## DRY Don't Repeat Yourself

Is a really nice rule cause improve maintainability and understandability
of the sys. 

> each piece of knowledge requires a single, unambiguous, authoritative representation
within a system.


# Collaboration disarmonies

* Intensive coupling 
(add a new method to the provider to replace multiple calls with a single call)

* Dispersed coupling (a brain method m)

* Shotgun surgery (data classes, brain methods, u have a method called by everyone)


# Tests

Write tests
TDD 