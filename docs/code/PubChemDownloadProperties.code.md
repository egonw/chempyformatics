# PubChemDownloadProperties.py
See also: the [Groovy version](https://egonw.github.io/cdkbook/code/PubChemDownloadProperties.code)
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
for key, value in mol.getProperties().items():
  print(f"{key}={value}")
```
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/egonw/chempyformatics/blob/main/docs/nb/PubChemDownloadProperties.ipynb)
## Output
```plain
PubChem CID=5282253
Compound Complexity=510
Fingerprint (SubStructure Keys)=00000371E0723800000000000000000000000000000160...
  000000000000000000000000000000001E00100800000D28C18004020802C00200880220D208...
  000000002000000808818800080A001200812004400004D000988003BC7F020E800000000000...
  00000000000000000000000000000000
IUPAC Name (Allowed)=(2S,3S,4S)-3-(carboxymethyl)-4-[(1Z,3E,5R)-5-carboxy-1-me...
  thyl-hexa-1,3-dienyl]pyrrolidine-2-carboxylic acid
IUPAC Name (CAS-like Style)=(2S,3S,4S)-4-[(2Z,4E,6R)-6-carboxyhepta-2,4-dien-2...
  -yl]-3-(carboxymethyl)-2-pyrrolidinecarboxylic acid
IUPAC Name (Markup)=(2<I>S</I>,3<I>S</I>,4<I>S</I>)-4-[(2<I>Z</I>,4<I>E</I>,6<...
  I>R</I>)-6-carboxyhepta-2,4-dien-2-yl]-3-(carboxymethyl)pyrrolidine-2-carbox...
  ylic acid
IUPAC Name (Preferred)=(2S,3S,4S)-4-[(2Z,4E,6R)-6-carboxyhepta-2,4-dien-2-yl]-...
  3-(carboxymethyl)pyrrolidine-2-carboxylic acid
IUPAC Name (Systematic)=(2S,3S,4S)-3-(2-hydroxy-2-oxoethyl)-4-[(2Z,4E,6R)-6-me...
  thyl-7-oxidanyl-7-oxidanylidene-hepta-2,4-dien-2-yl]pyrrolidine-2-carboxylic...
   acid
IUPAC Name (Traditional)=(2S,3S,4S)-3-(carboxymethyl)-4-[(1Z,3E,5R)-5-carboxy-...
  1-methyl-hexa-1,3-dienyl]proline
InChI (Standard)=InChI=1S/C15H21NO6/c1-8(4-3-5-9(2)14(19)20)11-7-16-13(15(21)2...
  2)10(11)6-12(17)18/h3-5,9-11,13,16H,6-7H2,1-2H3,(H,17,18)(H,19,20)(H,21,22)/...
  b5-3+,8-4-/t9-,10+,11-,13+/m1/s1
InChIKey (Standard)=VZFRNCSOCOPNDB-AOKDLOFSSA-N
Log P (XLogP3-AA)=-1.3
Mass (Exact)=311.13688739
Molecular Formula=C15H21NO6
Molecular Weight=311.33
SMILES (Canonical)=CC(C=CC=C(C)C1CNC(C1CC(=O)O)C(=O)O)C(=O)O
SMILES (Isomeric)=C[C@H](/C=C/C=C(/C)\[C@H]1CN[C@@H]([C@H]1CC(=O)O)C(=O)O)C(=O)O
Topological (Polar Surface Area)=124
Weight (MonoIsotopic)=311.13688739
```
