# Code Smells

* Duplicated Code 
* Long Method 
* Large Class 
* Long Parameter List 
* Divergent Change 
* Shotgun Surgery 
* Feature Envy 
* ...

* Polymetric views

* Long methods (distribution view)
* System hotspots 
    * classes with too many responsabilities
    * classes too large
    * NOM Number of methods
    * NOA Number of attributes
    * LOC Lines of code

    * NMA wrt a child class, see the number of methods added 
    * NMO overridden 
    * NME extended

> inheritance classification view


# Detection strategy with metrics

* problem of magic tresholds


## GOD class 

Performs too much work on its own, 
u can smell it by metrics or blueprint

## Feature envy 

Denotes a method more interested in the data of 
a few other classes that of its own class.
(use blueprint)


## Data class

without logic, used by the others


## Brain Method

centralize the functionality of a class in the same way as a god class centralizes too much 
functionality of the system


---

# Version control history

VCS contains a lot of useful informations

* how often things change
* bug fixing
* code that changes in the past is likely to change in the future

Visualize class evolution (through the history -> animated diagram)


## Understand evolution, evolution smells

* [Code Maat](https://github.com/adamtornhill/code-maat) (git analizer)
* Visualizing class evolution (base on NOM and NOA box diagram)
* Evolution matrix (don't scale, )


**Evolution patterns and smells**

* Day fly
* Pulsar/supernova
* White Dwarf/red giant/idle

* Extended polimetric views (kiviat diagram)