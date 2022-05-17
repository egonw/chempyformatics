# ReadSMILES.py
## Source code
```python
from scyjava import config, jimport
config.add_endpoints('org.openscience.cdk:cdk-bundle:2.7.1')
SmilesParser = jimport('org.openscience.cdk.smiles.SmilesParser')
Builder = jimport('org.openscience.cdk.silent.SilentChemObjectBuilder')

sp = SmilesParser(Builder.getInstance())
mol = sp.parseSmiles("CC(=O)OC1=CC=CC=C1C(=O)O")
print(f"Aspirin has {mol.getAtomCount()} atoms.")
```
[Open in Google Colab](https://colab.research.google.com/github/egonw/chempyformatics/blob/main/docs/nb/ReadSMILES.ipynb)
## Output
```plain
Aspirin has 13 atoms.
```
