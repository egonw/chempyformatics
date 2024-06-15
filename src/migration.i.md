# Migration

Going from one CDK release to another brings in API changes. While the project
tries to keep the number of changes minimal, these are inevitible. This chapter
discusses some API changes, and shows code examples on how to change your
code. The following sections discuss the migration between various versions.

The set of changes include changed class names. For example, the CDK 1.2
class <class>MDLWriter</class> is now called <class>MDLV2000Writer</class> to reflect the
V2000 version of the MDL formats.

## CDK 1.4 to 2.0

This section highlights the important API changes between the CDK 1.4 and
2.0 series. Innovations of CDK 2.0 are described in [<cite>Q30149558</cite>].

### Removed classes

Several classes have been removed in this version, for example, because they
are superceeded by other code or were considered redundant.

#### Removal of the NoNotify interface implementation

The <class>NoNotificationChemObjectBuilder</class> and the matching implementation
classes are removed. Please use the <class>SilentChemObjectBuilder</class> instead.
The same, of course, applies to all implementation classes. For example,
<class>NNMolecule</class> is removed.

#### Removal of IMolecule and IMoleculeSet

The <class>IMolecule</class> interface and all implementing classes have been
removed. They were practically identical in functionality to the
<class>IAtomContainer</class> interface, except the implication that the
<class>IMolecule</class> was for fully connected structures only. This separation
was found to be complicated, and was therefore removed. Please use the
<class>IAtomContainer</class> interface instead.

Generally, <class>IMolecule</class>, <class>IMoleculeSet</class>, <class>Molecule</class>,
and <class>MoleculeSet</class> can be replaced with the 'atomcontainer' equivalents.
Additionally, for <class>IMoleculeSet</class> you may also have to replace
use of methods like `getMoleculeCount()` with their matching `getAtomContainerCount()`.

### Renamed classes and methods

#### Rename of IteratingMDLReader to IteratingSDFReader

Strictly speaking the MDL files span a set of files and a SD file is different
from a molfile. This is reflected in the reader name change:
<class>IteratingMDLReader</class> is now called <class>IteratingSDFReader</class>.

#### CDKAtomTypeMatcher.findMatchingAtomTypes()

The method `findMatchingAtomTypes` of the <class>CDKAtomTypeMatcher</class>
gained a 's' and was previously called `findMatchingAtomType`. The new
name is more consistent, reflecting the fact that it perceives atom types
for all atoms.

### Changed behavior

Some classes and methods have the same API, but have slightly different
behavior as before. For example, the <class>SmilesGenerator</class> now requires
that all atoms have implicit hydrogen counts set. This can be done with
the <class>CDKHydrogenAdder</class> as explained in Section <xref>missinghydrogens</xref>.

### Constructors that now require a builder

The advantage of the builders in the CDK is that code can be independent of
data class implementations (and we have three of them in CDK 1.6, at this
moment). Over the past years more and more code started using the approach,
but that does involve that more and more class constructors take a
<class>IChemObjectBuilder</class>. CDK 1.6 has two more constructors that now take
a builder.

#### DescriptorEngine
The <class>DescriptorEngine</class> constructor is changed to now take a
<class>IChemObjectBuilder</class> which is needed to initialize descriptor instances.

#### SMARTSQueryTool

The second constructor that now needs a <class>IChemObjectBuilder</class> is that of the
<class>SMARTSQueryTool</class>. Here it is passed on to the <class>SMARTSParser</class> which
needs it for its data structure for the matching.

#### ModelBuilder3D

The `getInstance()` method of the <class>ModelBuilder3D</class> class now also
requires a <class>IChemObjectBuilder</class>.

#### CDKAtomTypeMatcher

A significant change in the <class>CDKAtomTypeMatcher</class> behavior is that it now
returns a special 'X' atom type when no atom type could be perceived.
See Section <xref>atomtypePerception</xref>.

### SMILESGenerator

The <topic>SMILES</topic> stack is replaced in this CDK version. This introduces a few API changes,
outlined here. The new code base is much faster and more functional that what the CDK
had before. Below are typical new <class>SmilesGenerator</class> API usage.

Generating unique SMILES is done slightly differently, but elegantly:

<code>UniqueSMILES</code>

## References

<references/>
