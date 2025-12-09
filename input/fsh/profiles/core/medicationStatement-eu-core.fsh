//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  MedicationStatementEuCore
Parent:   MedicationStatement
Id:       medicationStatement-eu-core
Title:    "MedicationStatement (EU core)"
Description: """This profile sets minimum expectations for the MedicationStatement resource common to most of the use cases.
This profile is adapted from the MPD work."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (1, draft)
* identifier 
  * ^short = "Medication Statement Identifier"
// * status ^short = "Current state of the dispensation"
* subject only Reference( PatientEuCore )
* status ^short = "State of the medication"
* category ^short = "Type of intended use"
  * ^binding.additional[+].purpose = #preferred
  * ^binding.additional[=].valueSet = Canonical(MedicationIntendedUseEuVs)
  * ^binding.additional[=].documentation = "When category is used for describing the intended use of the medication (e.g. Prophylactic use)."
/* Slice cannot be used in R4
* category insert SliceElement ( #value, $this )
* category contains intendedUse 0..*
* category[intendedUse] from medicationIntendedUseEuVs
*/
* dosage ^short = "	Details of how medication is/was taken or should be taken."
  * route //copy the additional bindign from the ips
* effectivePeriod ^short = "Period when the medication is/was or should be used."
* medication only CodeableReference(MedicationEuCore)
* medication from $medication-uv-ips (example) 
* reason.concept ^short = "Coded reason for use"
* adherence.code ^short = "Type of adherence."
