# PubChemDownload.py
See also: the [Groovy version](https://egonw.github.io/cdkbook/code/PubChemDownload.code)
## Source code
```python
from scyjava import config, jimport
config.add_endpoints('org.openscience.cdk:cdk-bundle:2.9')
URL = jimport('java.net.URL')
SilentChemObjectBuilder = jimport('org.openscience.cdk.silent.SilentChemObjectBuilder')
PCCompoundXMLReader = jimport('org.openscience.cdk.io.PCCompoundXMLReader')

cid = 5282253
reader = PCCompoundXMLReader(
  URL(
    "https://pubchem.ncbi.nlm.nih.gov/summary/summary.cgi?cid=" + str(cid) +
    "&disopt=SaveXML"
  ).openStream()
)
mol = reader.read(SilentChemObjectBuilder.getInstance().newAtomContainer())
print("CID: {}".format(mol.getProperty("PubChem CID")))
print(f"Atom count: {mol.getAtomCount()}")
```
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/egonw/chempyformatics/blob/main/docs/nb/PubChemDownload.ipynb)
## Output
```plain
CID: 5282253
Atom count: 43
```
