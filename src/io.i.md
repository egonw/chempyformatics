<section level="#" label="io">Input/Output</section>

## Reading from Readers and InputStreams

<section level="###" label="domoicacid">Example: Downloading Domoic Acid from PubChem</section>

As an example, below will follow a small script that takes a
<topic>PubChem</topic> compound
identifier (CID) and downloads the corresponding <topic>ASN.1</topic> XML file, parses it and
counts the number of atoms:

<code>PubChemDownload</code>

It reports:

<out>PubChemDownload</out>

PubChem ASN.1 files come with an extensive list of molecular properties. These
are stored as properties on the molecule object and can be retrieved using the
`getProperties()` method, or, using the Groovy bean formalism:

<code>PubChemDownloadProperties</code>

which lists the properties for the earlier downloaded domoic acid:

<out>PubChemDownloadProperties</out>

<section level="##" label="lineNotations">Line Notations</section>

Another common input mechanism in cheminformatics is the <topic>line notation</topic>.
Several line notations have been proposed, including the <topic>Wiswesser Line Notation</topic>
(WLN) [<cite>Q29042322</cite>] and the <topic>Sybyl Line Notation</topic> (SLN) [<cite>Q30853915</cite>],
but the most popular is <topic>SMILES</topic> [<cite>Q28090714</cite>]. There is a Open Standard around
this format called <topic>OpenSMILES</topic>, available at [http://www.opensmiles.org/](http://www.opensmiles.org/).

### SMILES

The CDK can both read and write SMILES, or at least a significant subset of the
line notation. You can parse a SMILES into a IAtomContainer with the
<class>SmilesParser</class>. The constructor of the parser takes an <class>IChemObjectBuilder</class> (see Section <xref>builders</xref>)
because it needs to know what CDK interface implementation it must use to create
classes. This example uses the <class>DefaultChemObjectBuilder</class>:

<code>ReadSMILES</code>

This outputs:

<out>ReadSMILES</out>

## References

<references/>
