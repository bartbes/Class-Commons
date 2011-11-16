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

<dl>
    <dt><code>name</code></dt> <dd>The name of the class, this value MAY be used by an implementation.</dd>
    <dt><code>class</code></dt> <dd>The class table.</dd>
    <dt><code>superclass</code></dt> <dd>Optional superclass. If omitted, implementation MUST be trusted to do the right thing.</dd>
</dl>


It MUST procide a function called `common.instance` to create an object of a
given class:

    <object> = common.instance(<class>, ...)

The function MUST pass all arguments except <class> to the class constructor.
