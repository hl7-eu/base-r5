Instance: PatientExample
InstanceOf: PatientEuCore
Title: "Example Patient"
Description: "An example of a patient resource"
* id = "patient-eu-core-example"
* name.family = "Doe"
* name.given = "John"
* gender = #male
* birthDate = "1980-01-01"
* address.line = "123 Example Street"
* address.city = "Example City"
* address.state = "EX"
* address.postalCode = "12345"
* address.country = "EX"
* telecom.system = #phone
* telecom.value = "555-1234"
* telecom.use = #home
* managingOrganization = Reference(OrganizationExample)