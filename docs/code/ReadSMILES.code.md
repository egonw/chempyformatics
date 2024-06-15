# ReadSMILES.py
See also: the [Groovy version](https://egonw.github.io/cdkbook/code/ReadSMILES.code)
## Source code
```python
from scyjava import config, jimport
config.add_endpoints('org.openscience.cdk:cdk-bundle:2.9')
SmilesParser = jimport('org.openscience.cdk.smiles.SmilesParser')
Builder = jimport('org.openscience.cdk.silent.SilentChemObjectBuilder')

sp = SmilesParser(Builder.getInstance())
mol = sp.parseSmiles("CC(=O)OC1=CC=CC=C1C(=O)O")
print(f"Aspirin has {mol.getAtomCount()} atoms.")
```
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/egonw/chempyformatics/blob/main/docs/nb/ReadSMILES.ipynb)
## Output
```plain
Aspirin has 13 atoms.
```
