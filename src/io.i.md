<section level="#" label="io">Input/Output</section>

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

<code>ReadSMILES</code>

## References

<references/>
