Profile: AllergyIntoleranceEuCore
Parent: AllergyIntolerance
Id: allergyIntolerance-eu-core
Title:    "Allergy Intolerance (EU core)"
Description: """This profile introduce essential constraints and extensions for the AllergyIntolerance resource that apply across multiple use cases."""
* insert SetFmmandStatusRule (1, draft)
// * insert ImposeProfile($AllergyIntolerance-uv-ips, 0)
* extension contains $allergyintolerance-abatement named abatement 0..1
* extension[abatement].valueDateTime ^short = "End date"
* verificationStatus ^short = "Certainty"
* clinicalStatus ^short = "Current allergy or Intolerance status"
* type ^short = "Type of propensity"
* code 1..1
* code from $allergy-intolerance-uv-ips (preferred)
  * ^binding.additional.purpose = #candidate
  * ^binding.additional.valueSet = $eHDSIAllergenNoDrug
  * ^binding.additional.documentation = "Type of the substance/product for MyHealth@EU"

  * ^binding.additional.purpose = #candidate
  * ^binding.additional.valueSet = "http://hl7.org/fhir/uv/ips/ValueSet/whoatc-uv-ips"
  * ^binding.additional.documentation = "Type of the substance/product, allergy or intolerance condition."
* criticality ^short = "Criticality"
* patient.reference 1..
* patient only Reference(PatientEuCore)
* onsetDateTime ^short = "Onset date"
* reaction.substance from $eHDSIAllergenNoDrug (example)
* reaction.manifestation from $allergy-reaction-uv-ips (preferred)
  * ^binding.additional.purpose = #candidate
  * ^binding.additional.valueSet = $eHDSIReactionAllergy
  * ^binding.additional.documentation = "Type of reaction (MyHealth@EU)"
* reaction.severity ^short = "Reaction severity"
* reaction.onset ^short = "Reaction onset"