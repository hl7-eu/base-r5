Instance: BodyStructureExample
InstanceOf: BodyStructureEuCore
Title: "BodyStructure Example"
Description: "Example of a BodyStructure resource conforming to the BodyStructure (EU) profile."
* id = "example-body-structure-eu"



* includedStructure
  * laterality = $sct#7771000 "Left"
  * structure = $sct#8205005 "Wrist"
  * qualifier = $sct#351726001 "Below"


* patient = Reference(PatientExample)
* morphology =  $sct#339008 "Blister"

Instance: BodyStructureMultipleIncludedStructuresExample
InstanceOf: BodyStructureEuCore
Title: "BodyStructure Example: multiple included structures"
Description: "Example of a BodyStructure resource describing a lesion that extends over more than one anatomic location, using several site qualifiers and a business identifier."
* id = "example-body-structure-eu-multiple"
* identifier.system = "http://example.org/body-structures"
* identifier.value = "BS-0000042"



* includedStructure[0]
  * structure = $sct#8205005 "Wrist"
  * laterality = $sct#7771000 "Left"
  * qualifier[0] = $sct#255554000 "Dorsal"
  * qualifier[+] = $sct#40415009 "Proximal"
* includedStructure[+]
  * structure = $sct#14975008 "Forearm"
  * laterality = $sct#7771000 "Left"
  * qualifier = $sct#46053002 "Distal"


* patient = Reference(PatientExample)
* morphology = $sct#339008 "Blister"
