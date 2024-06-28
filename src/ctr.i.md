# Chemistry Toolkit Rosetta

The [Chemistry Toolkit Rosetta](https://ctr.fandom.com/wiki/Chemistry_Toolkit_Rosetta_Wiki) (CTR) wiki was set up some time ago by Andrew Dalke to
demonstrate how certain basic cheminformatics tasks are done in the various cheminformatics toolkits around.
This chapter shows how CTR tasks can be solved with the CDK in Groovy. Each section discusses one CTR task,
and show one possible solution.

The data used in this chapter originates from the wiki, and is redistributed with this book under the
CC-BY-SA license, as it is in the wiki.

## Heavy atom counts from an SD file

This tasks starts with an SD file (see Section <xref>sdfiles</xref>) and counts for each structure in the file
the number of <topic>heavy atoms</topic> (non-hydrogen atoms). Because we simply handle the structures one by one,
the solution uses the `IteratingSDFReader` reader. The input file (`benzodiazepine.sdf.gz`) is a
gzipped file, which we handle by using a `GZIPInputStream` as outlined in Section <xref>gzip</xref>.
Because we want to make sure the input file does not have any unexpected content, we use the `STRICT`
mode, detailed in Section <xref>readingModes</xref>. The input file turns out to do not have non-standard
features, so that we do not have to worry about D and T element symbols.

The solution lists all heavy atom counts:

<code>CTR1</code>
