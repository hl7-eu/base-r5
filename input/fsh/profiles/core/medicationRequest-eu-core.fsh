//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  MedicationRequestEuCore
Parent:   MedicationRequest
Id:       medicationRequest-eu-core
Title:    "MedicationRequest (EU core)"
Description: """This profile sets minimum expectations for the MedicationRequest resource common to most of the use cases.
This profile is adapted from the MPD work."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (1, draft)
* identifier 
  * ^short = "Business identifier for this request"
* status ^short = "Current state of the order" 
* intent ^short = "Order, proposal or plan"
* subject only Reference( PatientEuCore or Group )
* authoredOn ^short = "Date when the request was authored"
* requester only Reference( PatientEuCore or PractitionerEuCore or PractitionerRoleEuCore or OrganizationEuCore or RelatedPerson )
  * ^short = "The individual responsible for ordering the medication"
* dosageInstruction ^short = "How the medication should be taken."
  * timing ^short = "Administration schedule"
    * repeat
      * duration ^short = "Duration of the treatment"
      * frequency ^short = "Frequency times per period"
      * period ^short = "Duration of time over which repetitions are to occur"
      * periodUnit  ^short = "Unit of the period (e.g. day)"
    * code ^short = "A code for the timing schedule."
  * route ^short = "Route of administration"
  * text ^short = "Free text dosage instructions"
  * doseAndRate.doseQuantity ^short = "Amount of medication per dose"
* dispenseRequest
  * extension contains $ihe-ext-medicationrequest-prescribedquantity named prescribedQuantity 0..1
  * extension[prescribedQuantity] ^short = "Overall amount of product prescribed, independent from the number of repeats."
  * extension[prescribedQuantity] ^definition = "When Medication resource implies a pack size, prescribedQuantity should convey number of packages. When the Medication does not imply an amount, overall amount could be in tablets or millilitres."
* medication 1..
* medication only CodeableReference(MedicationEuCore)
* reason ^short = "Reason or indication for this prescription"
  * ^binding.additional.purpose = #candidate
  * ^binding.additional.valueSet = $eHDSIIllnessandDisorder
  * ^binding.additional.documentation = """MyHealth@EU crossborder value set for diagnoses. Based on WHO ICD 10.""" 
