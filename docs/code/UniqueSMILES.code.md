# UniqueSMILES.py
See also: the [Groovy version](https://egonw.github.io/cdkbook/code/UniqueSMILES.code)
## Source code
```python
from scyjava import config, jimport
config.add_endpoints('org.openscience.cdk:cdk-bundle:2.9')
MoleculeFactory = jimport('org.openscience.cdk.templates.MoleculeFactory')
AtomContainerManipulator = jimport('org.openscience.cdk.tools.manipulator.AtomContainerManipulator')
CDKHueckelAromaticityDetector = jimport('org.openscience.cdk.aromaticity.CDKHueckelAromaticityDetector')
CDKHydrogenAdder = jimport('org.openscience.cdk.tools.CDKHydrogenAdder')
SmilesGenerator = jimport('org.openscience.cdk.smiles.SmilesGenerator')

mol = MoleculeFactory.makePhenylAmine()
AtomContainerManipulator.percieveAtomTypesAndConfigureAtoms(mol);
CDKHueckelAromaticityDetector.detectAromaticity(mol);
hAdder = CDKHydrogenAdder.getInstance(mol.getBuilder())
hAdder.addImplicitHydrogens(mol)
generator = SmilesGenerator.unique()
smiles = generator.createSMILES(mol)
print(f"{smiles}")
```
[Open in Google Colab](https://colab.research.google.com/github/egonw/chempyformatics/blob/main/docs/nb/UniqueSMILES.ipynb)
## Output
```plain
NC=1C=CC=CC1
```
