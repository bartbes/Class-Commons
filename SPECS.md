Libraries implementing Class Commons
====================================

Any library implementing this interface MUST comply to the following:

It MUST listen to the global variable `common_class`:

It MUST provide the interface if that variable is true. It MUST NOT provide the
interface if that variable is false. It MAY provide the interface if the
variable is nil.


It SHOULD create a global table called `common`. It MUST provide a function
called `common.class`, complying to the following signature:

    <class> = common.class(<name>, <class>, <superclass>?)

This MUST return a class, it SHOULD NOT set it as a global. It SHOULD NOT set
any special functions, like metamethods, with one exception, it MUST use the
`init` function as initializer when available, if not, it MUST be looked for
in the superclass.

A class SHOULD be considered read-only after having been passed to common.class.
Implementations MAY ignore any changes after the class has been created.

Explanation of arguments:

 * `name` The name of the class, this value MAY be used by an implementation.
 * `class` The class table.
 * `superclass` Optional superclass. If omitted, implementation MUST be trusted to do the right thing.


It MUST provide a function called `common.instance` to create an object of a
given class:

    <object> = common.instance(<class>, ...)

The function MUST pass all arguments except `<class>` to the class constructor.



Libraries using Class Commons
=============================

Any library using Class Commons SHOULD probe for its existence by checking for
`common` and `common.class`.

In case it is absent it MAY error, or it MAY use its own implementation, in any
case, it MUST NOT do anything else.

If it ships its own implementation, the `common` table MUST be reset to its
initial value (which MAY be assumed to be `nil`) when the library finishes
loading.
Furthermore, this implementation MAY implement all of the specification, but it
does not have to, but it MUST be enough to use the library itself.
