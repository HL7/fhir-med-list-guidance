### Introduction

This Implementation Guide provides guidance on how to create medications lists using HL7 Fast Healthcare Interoperability Resources (FHIR) for different contexts of use.  The guidance is intended to be used by implementers of FHIR as well as HL7 standards developers and external projects developing FHIR implementation guides related to medication lists.

Lists of medications are present in many areas of both electronic healthcare applications, mobile applications, and paper based records.  These lists serve many purposes, but the context of where the list is used and to whom the list is made available is a critical part of what sources of information should be used to construct the list.  Without the context, a list of medications may not provide the user (healthcare provider, patient, care giver, etc) with the information that they need.

### Contexts for Medication Lists

The following contexts are included in this Implementation Guide:

* Prescribing
* Dispensing
* Administration of Medications
* Administration History
* Patient's View
* Medication Reconciliation

In ePrescribing applications the lists may be used to represent the active medications that a patient has been ordered/authorized to take and is reported to be taking; in other cases the list of medications may be expanded to represent any medication the patient has ever taken.  In the ePrescribing case it may also include filters to see what medications orders have been completed, or those that are on-hold, or those that have been entered-in-error.  Some lists may include both medications that have been authorized by a clinician via an order/prescription, and include those medications the patient is taking that have been purchased "over the counter" without any order from any clinician. 

In some systems, the list of dispensed medications provides another view of medications the patient is expected to be taking. 

In medication administration records, there are two common lists, one represents the list of medications to be administered, including dose, route of administration and timing information; the second use is to represent the actual time, date, route, person who performed the administration, and other relevant medication administration information.  

Another view of medication lists reflects the reported medications the patient has taken, is taking, or will take - we call this medication usage (formerly medication statement).  

The following are examples of medication lists:

* active medication list  - as represented by the patient
* active medication list - as represented by a healthcare organization
* dispense-related medication lists
* administration-related medication lists
* Medication to be administered
* Medication that has been administered
* Medication that has been "reported" to be administrated
* Medication history lists  - what the patient or a provider says a patient is taking 
* Prescribing medication lists

### Scope and Boundaries

The scope of this Implementation Guide includes the following:

* any medication list that is patient specific including the results of a query for medications regardless of the source of the medication records (for example, EHR records, EMR records, pharmacy records, payment or claims based records
* the definition of the characteristics of a medication list - e.g. active, administered medications, expiring
* nomenclature for medication lists across jurisdictions, organizations, etc

The following are not in scope for this Implementation Guide:

* lists of medications that are not patient specific
* lists created for medications or medication knowledge (for example, formularies, inventory lists)
* medications purchased by the patient where there is not a record of the purchase in the pharmacy system
	* comment about the above - why is this not in scope?
	* what about illegal drugs or drugs of abuse that have been purchased but there is no record of the purchase?
* medication track and trace which is not patient specific
* audit and monitoring of medications, for example, recall notifications, prescription drug monitoring by a regulatory authority
	* comment about the above - I thought recall notifications sometimes when out to patients?  maybe it is a different name, not a recall, but a notice that the drug has some serious issues and the patient should not be taking it.  

### Assumptions

The following assumptions have been made as part of the guidance:

* assumes that there is a record of the medication in an electronic system

### Overview of Pharmacy Resources

This Implementation Guide is based on FHIR Release 4. 

The Pharmacy resources that are in scope for the guidance include:

* MedicationRequest
* MedicationDispense
* MedicationAdministration
* MedicationUsage (formerly MedicationStatement)

The following resources are not in scope for this Implementation Guide, but it should be noted that there may be requirements to use a created list to get additional information about the medication via medication resource or MedicationKnowledge resource.

* Medication
* MedicationKnowledge

The following provides a high-level overview of the pharmacy resources:

| Syntax | Description |
| --- | --- |
| MedicationRequest | Represents an instruction for the administration of medication to a patient - both in the inpatient (hospital) and community setting. It can also include instructions for the dispensing, the reasons why the administration should occur and other data.  It is called an 'Request' to be consistent with other FHIR resources and the workflow pattern, but a common alias for this resource is a 'Prescription' or an 'Order'. The Order itself represents the content of the instruction and is not, by itself, actionable. The workflow process around 'fulfilling' the order is part of the generic FHIR workflow (see below), with the MedicationRequest representing the contents. |
| MedicationDispense | The provision of a supply of a medication with the intention that it is subsequently consumed by a patient (usually in response to a prescription). |
| MedicationAdministration | A record of a patient actually consuming a medicine, or if it has otherwise been administered to them. |
| MedicationUsage (Statement) | This is a record indicating that a patient may be taking a medication now, has taken the medication in the past, or will be taking the medication in the future. The source for this information can be the patient, significant other (such as a family member or spouse), or a clinician. A common scenario where this information is captured is during the history taking process during a patient visit or stay. A medication statement is not a part of the prescribe->dispense->administer sequence, but is a report that such a sequence (or at least a part of it) did take place, resulting in a belief that the patient has received a particular medication. It may be used to construct a patients 'Current Medications' list. |
| Medication | The medication resource represents an actual medication that can be given to a patient, and referenced by the other medication resources. In many cases, this resource is not needed and the drug is indicated by a reference to the appropriate terminology and so can be represented using a codeable concept. In other cases, however, it may be desired to indicate more details than the simple drug (such as the packaging, whether it is a generic medication or the active and inactive ingredients) and so the Medication resource can be used for this. |
| MedicationKnowledge | The MedicationKnowledge resource is draft and is included for comment purposes. This resource represents information about a medication, for example, details about the medication including interactions, contraindications, cost, regulatory status, administration guidelines, etc. |

### Definitions

* Inpatient setting - a hospital, long term care, rehab facilty, psychiatric hospital, Surgery Center, Emergency Department, Ambulance?
* Community setting - Ambulatory clinics, Minute clinics, home care , emergency field setting e.g school shooting, disaster site
* Active Medication List - constrained by the patient's input into whether they are taking or not taking  the medication
* Active Medication List - based on what was prescribed
* Medication List - too generic, so this type of list would need very clear description to understand what one was looking at. This list could be identical to one of the above active med lists, or it could even be a list of all medications the patient has ever taken. 
* Patient Profile
* Medication Profile

