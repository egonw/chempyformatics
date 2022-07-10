# CreateAtom3.py
See also: the [Groovy version](https://egonw.github.io/cdkbook/code/CreateAtom3.code)
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
Atom(1379435698, S:C, H:0, AtomType(1379435698, FC:0, Isotope(1379435698, Element(1379435698, S:C, AN:6))))
```
