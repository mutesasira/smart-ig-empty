
Profile: MyCoursePatient
Parent: Patient
Id: MyCoursePatient
Title: "MyPatient"
Description: "ForTrainingPurposes"

// Cardinality rules for patient elements
* name 1..* 
* name.family 1..1 
* name.given 1..* 
* birthDate 1..1 
* gender 1..1 
* telecom 1..* 

* name obeys key-1

* extension contains PatientOccupation named occupation 1..1
* extension contains PatientPlaceOfBirth named placeOfBirth 1..3

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains NationalID 1..1
* identifier[NationalID].system = "http://nira.go.ug/nin"
* identifier[NationalID].system 1..1

* identifier contains MedicalRecordNumber 1..1
* identifier[MedicalRecordNumber].system = "http://nira.go.ug/mrn"
* identifier[MedicalRecordNumber].system 1..1

* identifier contains PassPortNumber 1..1
* identifier[PassPortNumber].system = "http://ia.go.ug/ppn"
* identifier[PassPortNumber].system 1..1

Extension: PatientOccupation
Id: patient-occupation123
Title: "Patient Occupation"
Description: "An extension to capture the occupation of the patient."
Context: Patient
* ^experimental = true
* value[x] only string

Extension: PatientPlaceOfBirth
Id: patient-place-of-birth123
Title: "Patient Place of Birth"
Description: "An extension to capture the place of birth of the patient."
Context: Patient
* ^experimental = true
* value[x] only string

Invariant:  key-1
Description: "Patient.name.given or Patient.name.family or both SHALL be present"
Expression: "family.exists() or given.exists()"
Severity:   #error





