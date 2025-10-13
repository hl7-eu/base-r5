Profile: BodyStructureEuCore
Parent: BodyStructure
Id: bodyStructure-eu-core
Title: "BodyStructure (EU core)"
Description: "This profile specifies how the HL7 FHIR BodyStructure resource should be used for conveying commonly used concepts in the European context."
* insert SetFmmandStatusRule ( 2, draft)
* identifier ^short = "Body structure identifier"
* text ^short = "Textual description of the body structure"
* includedStructure
  * laterality from SiteLateralityEuVs (preferred)
  * structure from http://hl7.org/fhir/ValueSet/body-site (preferred)
  * qualifier from SiteQualifierEuVs (preferred) 
* morphology from http://hl7.org/fhir/ValueSet/bodystructure-code (preferred)
// * image 0..0