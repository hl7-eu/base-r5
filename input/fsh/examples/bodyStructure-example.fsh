Instance: BodyStructureExample
InstanceOf: BodyStructureEu
Title: "Example Body Structure"
Description: "An example instance of the BodyStructureEu profile."
* id = "example-body-structure-eu"
* includedStructure
  * laterality = $sct#7771000 "Left"
  * structure = $sct#8205005 "Wrist"
  * qualifier = $sct#351726001 "Below"
* patient = Reference(PatientExample)
* morphology =  $sct#339008 "Blister"
