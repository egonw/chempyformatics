#  Atoms, Bonds and Molecules

## Atoms

The CDK interface <topic type="class">IAtom</topic> is the underlying data model of atoms. Creating
a new atom is fairly easy. For example, we can create an atom of element
type carbon, as defined by the element’s atomic number that we pass as parameter
in the constructor:

**Script** [code/CreateAtom3.py](code/CreateAtom3.code.md)
```python
atom = Atom(6);
print(atom)
```
