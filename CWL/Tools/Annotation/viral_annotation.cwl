#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: "Viral contig annotation"

hints:    
  DockerRequirement:
    dockerPull: mhoelzer/annotation_viral_contigs:0.1
    
requirements:
  InlineJavascriptRequirement: {}

baseCommand: ['python', '/viral_contigs_annotation.py']
arguments: ["-o", $(runtime.outdir)]

inputs:
  input_fasta:
    type: File
    inputBinding:
      separate: true
      prefix: "-p"
  input_table:
    type: File
    inputBinding:
      separate: true
      prefix: "-t"
  input_fna:
    type: File
    inputBinding:
      separate: true
      prefix: "-n"

outputs:
  annotation_table:
    type: File
    outputBinding:
      glob: "*_prot_ann_table.tsv"
