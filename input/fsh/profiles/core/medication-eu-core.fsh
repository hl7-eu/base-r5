//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  MedicationEuCore
Parent:   Medication
Id:       medication-eu-core
Title:    "Medication (EU core) [WIP]"
Description: """This profile sets minimum expectations for the Medication resource common to most of the use cases.
This profile is adapted from the MPD work."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (1, draft)
// Common R4 R5
* extension contains $ihe-ext-medication-productname named productName 0..1 // productName
* extension[productName] ^short = "Name of the medicinal product. Names of different types (full name, short name, etc) and in different languages can be provided if relevant." 
* extension contains $ihe-ext-medication-classification named classification 0..* // classification
* extension[classification] ^short = "Classifications of the product, e.g ATC, narcotic/psychotropic, orphan drug, etc"
* extension contains $ihe-ext-medication-sizeofitem named sizeOfItem 0..1 // item.containedQuantity
* extension[sizeOfItem] ^short = "Size of one item (for example, in a pack of 5 vials, this would represent the size of 1 vial)"
* extension contains $ihe-ext-medication-characteristic named characteristic 0..* // characteristic
* extension[characteristic] ^short = "Specifies other descriptive properties of the medication."
* extension contains $ihe-ext-medication-unitofpresentation named unitOfPresentation 0..1 // item.unitOfPresentation
* extension[unitOfPresentation] ^short = "Unit of presentation of the product (e.g. tablet, vial, ampoule, etc)"
* extension contains MedicationPackageType named packageType 0..1
* extension[packageType] ^short = "Type of container. This information is more relevant in cases when the packaging has an impact on administration of the product (e.g. pre-filled syringe)"
* extension contains $ihe-ext-medication-device named device 0..* // device
* extension[device] ^short = "Device, typically an administration device, included in the product."
* extension[device].extension[device].valueCodeableConcept from $eHDSIPackage (example)
* totalVolume // MS // item.amount; packSize
  * ^short = "Total volume or number of package items inside a package. This element should not contain overall prescribed amount, but describe the product itself. In case of complex packages, this element could be left empty, and number of different items could be indicated in the nested Medications." //packSize (almost)
* ingredient
  * item only CodeableReference (Substance or MedicationEuCore)
    * ^short = "Substance (Substance resource or concept from terminology) or a medicinal product (Medication resource or concept from terminology). Medicinal product can be an ingredient in case of extemporal medications or combination packs (e.g Creme + 6 tablets)" 
  * item from $medicine-active-substances-uv-ips (example)
    * ^binding.additional.purpose = #candidate
    * ^binding.additional.valueSet = $eHDSISubstance
    * ^binding.additional.documentation = """MyHealth@EU crossborder value set for substances. Based on EMA SPOR SMS.""" 
  * strength[x] ^short = "Amount of substance in product (presentation or concentration strength)"
  * strength[x] ^definition = """Definitional resources should be used for specifying the different types of strengths: presentation; concentration."""
  * strength[x] // MS // item.ingredient.strengthInfo (does not map exactly)
    * extension contains $ihe-ext-medication-strengthsubstance named basisOfStrengthSubstance 0..1 
    * extension[basisOfStrengthSubstance] ^short = "Basis of strength substance - substance for which the strength is provided (this could be different from the precise active ingredient)."
* doseForm // MS // doseForm; item.doseForm
  * ^short = "Dose form. For a branded product, this would most likely be authorised dose form, but it could also be administrable dose form. For package items, it could be item's individual dose form." // doseForm
  * ^binding.additional.purpose = #candidate
  * ^binding.additional.valueSet = $eHDSIDoseForm
  * ^binding.additional.documentation = """MyHealth@EU crossborder value set for dose forms. Based on EDQM Standard Terms.""" 
* marketingAuthorizationHolder // MS
