# CreateAtom3.py
See also: the [Groovy version](https://egonw.github.io/cdkbook/code/CreateAtom3.code)
## Source code
```python
from scyjava import config, jimport
config.add_endpoints('org.openscience.cdk:cdk-bundle:2.9')
Atom = jimport('org.openscience.cdk.silent.Atom')

atom = Atom(6);
print(atom)
```
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/egonw/chempyformatics/blob/main/docs/nb/CreateAtom3.ipynb)
## Output
```plain
Atom(892529689, S:C, H:0, AtomType(892529689, FC:0, Isotope(892529689, Element...
  (892529689, S:C, AN:6))))
```
