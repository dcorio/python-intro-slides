
Python: introduzione
======================

Cos'è
-------------

È un linguaggio di programmazione interpretato, molto flessibile adatto a diversi tipi di applicazione.

Storia
--------------

Python nasce intorno al 1990 ad opera di Guido van Rossum presso lo Stichting Mathematisch Centrum (CWI) in Olanda.



Avviare l'interprete
---------------------

.. sourcecode:: bash

    $ python

oppure:

.. sourcecode:: bash

    $ sudo apt-get install python-pip
    $ sudo pip install ipython
    $ ipython

Sintassi
--------

Separatore dei comandi:

 * a capo
 * ;  (usato di rado)


I commenti

.. sourcecode:: python

    >>> # Questo è un commento
    >>> a = 1  # questo è un altro



Variabili
---------

 * variabili a tipizzazione dinamica
 * sono riferimenti ad oggetti




Sintassi: assegnazione
----------------------


Assegnazione valori:


.. sourcecode:: python

    >>> a = 1
    >>> b = "Ciao"
    >>> print a
    1
    >>> print b
    Ciao
    >>> # Boolean
    >>> vero = True
    >>> falso = False
    >>> boh = None # non definito
    >>> vero and falso
    False
    >>> (vero or falso) == vero
    True


Numeri e stringhe
-----------------

Sono immutabili!

.. sourcecode:: python

    >>> a = "ciao"
    >>> b = a
    >>> b
    "Ciao"
    >>> a = "olà"
    >>> b
    "Ciao"


Controllo di flusso
-------------------

I blocchi di codice sono introdotti dal simbolo *:* e indentati

.. sourcecode:: python

    >>> if (True or False):
        print "Ovvio!"
    Ovvio!
    >>> i = 0
    >>> while i < 10:
        i += 1
        if not i % 2:
            print "dispari"
        print i



Importare le librerie
---------------------


.. sourcecode:: python

    >>> import sys
    >>> from sys import path
    >>> from sys import *




Librerie
---------

 * su http://pypi.python.org/pypi
 * pip search ....
 * sudo pip install ...


Creare uno script
-----------------

.. sourcecode:: python

    #!/usr/bin/env python

    import sys

    if len(sys.argv) < 2:
        print "Uso: %s nome_del_file\n" % sys.argv[0]
        sys.exit()

    nome_file = sys.argv[1]

    if not os.path.isfile(nome_file):
        sys.exit("Il file %s non esiste\n" % nome_file)


Le liste
--------

 * list
 * tuple
 * dict
 * set
 * frozenset

Le funzioni
-----------

Le funzioni possono essere definite dinamicamente e anche annidate:


.. sourcecode:: python

    >>> def f(x):
    ...     def f2(x):
    ...             return x + 1
    ...     return f2(x*2)
    ...
    >>> f(1)
    3

Le funzioni: passaggio di parametri
-----------------------------------

Il passaggio è sempre per valore:

.. sourcecode:: python

    >>> def f(x):
    ...     x+=1
    ...
    >>> x=1
    >>> f(x)
    >>> x
    1

`x` non viene modificato!


Le funzioni: argomenti posizionali
-----------------------------------


.. sourcecode:: python

    >>> def f(x1, x2):
    ...     return x1 + x2
    ...
    >>> f(1, 2)
    3

    # passaggio di una tupla
    >>> t = (2, 3)
    # l'asterisco espande la tupla
    >>> f(*t)
    5

    >>> def f(*args):
    ...     return args[0] + args[1]
    ...
    >>> f(*t)
    5

Le funzioni: argomenti chiave
----------------------------------


.. sourcecode:: python

    >>> def f(x1, x2):
    ...     return x1 + x2
    ...
    >>> f(x2=2, x1=0)
    2

    # Argomenti con valori di default
    >>> def f(x1, x2=1):
    ...     return x1 + x2
    ...
    >>> f(1)
    2


Le classi
----------

Le classi sono le fabbriche degli oggetti.


.. sourcecode:: python

    >>> class a:
    ...     v = 0
    ...
    >>> a
    <class __main__.a at 0x1c91940>
    >>> b = a()
    >>> b
    <__main__.a instance at 0x1ca6cf8>
    >>> c = b
    >>> c
    <__main__.a instance at 0x1ca6cf8>
    >>>

Classi e Oggetti
----------------

Le classi sono lo stampo. Gli oggetti il prodotto finito.


.. sourcecode:: python

    >>> class Auto:
    ...    marca = ''
    ...    modello = ''
    ... 
    >>> punto = Auto()
    >>> punto.marca = 'FIAT'
    >>> punto.modello = 'Punto 1.2'
    >>> punto
    <__main__.Auto instance at 0x105cc7680>
    >>> dir(punto)
    ['__doc__', '__module__', 'marca', 'modello']
    >>> punto.marca
    'FIAT'
    >>> 

I metodi
--------

I metodi sono le azioni che i nostri oggetti possono compiere.


.. sourcecode:: python

    >>> class Auto:
    ...    marca = ''
    ...    modello = ''
    ...    def accenditi(self):
    ...       print "accendo: %s %s" % (self.marca, self.modello)
    ... 
    >>> punto = Auto()
    >>> punto.marca = 'FIAT'
    >>> punto.modello = 'Punto 1.2'
    >>> 
    >>> punto.accenditi()
    accendo: FIAT Punto 1.2
    >>> 

Interfacce grafiche con Qt
--------------------------

Installare QtDesigner e PyQt4:

.. sourcecode:: bash

    $ sudo apt-get install qt4-designer python-qt4

.. sourcecode:: python

    import sys
    from PyQt4 import Qt

    # We instantiate a QApplication passing the arguments of the script to it:
    a = Qt.QApplication(sys.argv)

    # Add a basic widget to this application:
    # The first argument is the text we want this QWidget to show, the second
    # one is the parent widget. Since Our "hello" is the only thing we use (the
    # so-called "MainWidget", it does not have a parent.
    hello = Qt.QLabel("Hello, World")

    # ... and that it should be shown.
    hello.show()

    # Now we can start it.
    a.exec_()


