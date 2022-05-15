# CreateAtom3.py
## Source code
```python
from scyjava import config, jimport
config.add_endpoints('org.openscience.cdk:cdk-bundle:2.7.1')
Atom = jimport('org.openscience.cdk.silent.Atom')

atom = Atom(6);
print(atom)
```
[Open in Google Colab](https://colab.research.google.com/github/egonw/chempyformatics/blob/main/docs/nb/CreateAtom3.ipynb)
## Output
```plain
Atom(89387388, S:C, H:0, AtomType(89387388, FC:0, Isotope(89387388, Element(89387388, S:C, AN:6))))
```
