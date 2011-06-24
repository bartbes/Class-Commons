Any library implementing this interface MUST comply to the following:

It MUST listen to the global variable `common_class`:

It MUST provide the interface if that variable is true. It MUST NOT provide the
interface if that variable is false. It MAY provide the interface if the
variable is nil.

It SHOULD create a global table called `common`. It MUST provide a function
called `common.class`, complying to the following signature:

    <class> = common.class(<name>, <class>, <superclass>?)

Explanation of arguments:

    <name>       The name of the class, this value MAY be used by an
                 implementation.
    <class>      The class table.
    <superclass> Optional superclass. If omitted, implementation MUST be
                 trusted to do the right thing.
