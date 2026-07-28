cwlVersion: v1.2
class: CommandLineTool
id: autogvp_filter_vcf
doc: |
  Tool for the 01-filter_vcf script from AutoGVP
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    ramMin: $(inputs.ram * 1000)
    coresMin: $(inputs.cpu)
  - class: DockerRequirement
    dockerPull: 'pgc-images.sbgenomics.com/diskin-lab/autogvp:v2.0.1'

baseCommand: []
arguments:
  - position: 0
    shellQuote: false
    valueFrom: >-
      bash /rocker-build/AutoGVP/scripts/update_intervar.R

inputs:
  vcf_file: { type: 'File', inputBinding: { position: 3 }, doc: "VCF file to filter" }
  multianno_file: { type: 'File', inputBinding: { position: 4 }, doc: "multianno file" }
  autopvs1_file: { type: 'File', inputBinding: { position: 5 }, doc: "autopvs1 results file" }
  intervar_file: { type: 'File', inputBinding: { position: 6 }, doc: "intervar results file" }
outputs:
  updated_intervar: { type: File, outputBinding: { glob: '*updated*' }}
