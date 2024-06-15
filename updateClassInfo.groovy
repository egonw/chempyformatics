// Copyright (c) 2019  Egon Willighagen <egon.willighagen@gmail.com>
//
// GPL v3

// update the class info data file
//
// it takes one optional argument, which is appended to the output

if (args.length == 0) {
  println "groovy updateClassInfo.groovy <directory>"
  System.exit(0)
}

def folder = args[0]

pkgs = new HashMap<String,String>();
modules = new HashMap<String,String>();
classinfoFile = new File("classinfo.tsv")
if (classinfoFile.exists()) {
  def lines = new File("classinfo.tsv").readLines()
  lines.each { String line ->
    data = line.split("\t")
    topic = data[0]
    pkg = data[1]
    module = data[2]
    pkgs.put(topic, pkg)
    modules.put(topic, module)
  }
}

lines = new File("classes.lst").readLines()
lines.each { String line ->
  data = line.split("\t")
  clazz = data[0]
  pkg = data[1]
  module = data[2]
  if (pkgs.containsKey(clazz)) {
    println clazz + "\t" + pkgs.get(clazz) + "\t" + modules.get(clazz)
  } else {
    println clazz + "\t" + pkg + "\t" + module
  }
}

