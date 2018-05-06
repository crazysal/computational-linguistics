##### Prolog uses cut and failure to define a number of solution-gathering predicates:
* `repeat /0`
* `findall /3`
* `bagof /3`
* `setof /3`
All of these are defined in terms of ‘!’, ‘true’ and/or ‘fail’.

> 'While' cycles  with `repeat/0`