# CTR1.py
See also: the [Groovy version](https://egonw.github.io/cdkbook/code/CTR1.code)
## Source code
```python
from scyjava import config, jimport
config.add_endpoints('org.openscience.cdk:cdk-bundle:2.9')
SilentChemObjectBuilder = jimport('org.openscience.cdk.silent.SilentChemObjectBuilder')
IChemObjectReader = jimport('org.openscience.cdk.io.IChemObjectReader')
IteratingSDFReaderFactory = jimport('org.openscience.cdk.io.iterator.IteratingSDFReader')
GZIPInputStream = jimport('java.util.zip.GZIPInputStream')
File = jimport('java.io.File')

iterator = IteratingSDFReader(
  GZIPInputStream(
    File("ctr/benzodiazepine.sdf.gz")
      .newInputStream()
  ),
  SilentChemObjectBuilder.getInstance()
)
iterator.setReaderMode(
  IChemObjectReader.Mode.STRICT
)
while (iterator.hasNext()) {
  mol = iterator.next()
  heavyAtomCount = 0
  for (atom in mol.atoms()) {
    if (1 == atom.atomicNumber ||
        "H" == atom.symbol) {
      // do not count hydrogens
    } else {
      heavyAtomCount++
    }
  }
  println heavyAtomCount
}
```
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/egonw/chempyformatics/blob/main/docs/nb/CTR1.ipynb)
## Output
```plain
```
