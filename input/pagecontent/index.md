### Introduction

This Implementation Guide provides guidance on how to create medications lists using HL7 Fast Healthcare Interoperability Resources (FHIR) for different contexts of use.  The guidance is intended to be used by implementers of FHIR as well as HL7 standards developers and external projects developing FHIR implementation guides related to medication lists.
Lists of medications are present in many areas of both electronic healthcare applications, mobile applications, and paper based records.  These lists serve many purposes, but the context of where the list is used and to whom the list is made available is a critical part of what sources of information should be used to construct the list.  Without the context, a list of medications may not provide the user (healthcare provider, patient, care giver, etc.) with the information that they need.  Medication lists without context can lead to incorrect understanding of whether the patient is taking a medication, or if the source of the information is unknown or not understood, this may also lead to assuming the list of medications is accurate or complete.  

### Contexts for Medication Lists

The following contexts are included in this Implementation Guide:

1. Prescribing
2. Dispensing
3. Administration of Medications
4. Administration History
5. Patient's View
6. Medication Reconciliation
7. Blister Packing

In ePrescribing applications the lists may be used to represent the active medications that a patient has been ordered/authorized to take and is reported to be taking; in other cases the list of medications may be expanded to represent any medication the patient has ever taken.  In the ePrescribing case it may also include filters to see what medications orders have been completed, or those that are on-hold, or those that have been entered-in-error.  Some lists may include both medications that have been authorized by a clinician via an order/prescription, and include those medications the patient is taking that have been purchased "over the counter" without any order from any clinician. 

In some systems, the list of dispensed medications provides another view of medications the patient is expected to be taking. 

In medication administration records, there are two common lists, one represents the list of medications to be administered, including dose, route of administration and timing information; the second use is to represent the actual time, date, route, person who performed the administration, and other relevant medication administration information.  The attributes in this paragraph are not meant to be an exhaustive list or required list but are used to provide context about some of the data that may be associated with these types of lists. 

Another view of medication lists reflects the reported medications the patient has taken, is taking, or will take - we call this medication usage (formerly medication statement).  A challenge that often is documented in this area is how to represent that a patient is taking or not-taking a medication.  At it's most basic, the question may look like:  Are you taking your medications as prescribed? 

* More commonly though the questions around taking medication are more nuanced, as you can see in the following examples:   
* Patient or other carer is asked are you taking medication xyz? 
* A more complex question may look like - are you taking the medication as prescribed?  

Even more complexity can result in asking about future or past medication behavior e.g. 

* Have you ever taken this medication?
* When did you stop taking this medication? 
* Will you take the prescribed medication starting next week ( or some future date time)? 
* Will you stop taking the prescribed medication at some point in time ( can be specific or general)? 

With this limited set of use cases, you can see that when a medication list is either constrained or incorporates information related to taken/not taken, the use of FHIR resources can become more complex. 

In general, the Pharmacy resource that should be used to capture information about usage of medication should be captured with the Medication Usage resource. 

The following are examples of medication lists:

1. active medication list  - as represented by the patient
2. active medication list - as represented by a healthcare organization
3. dispense-related medication lists
4. administration-related medication lists
	1. Medication to be administered
	2. Medication that has been administered
	3. Medication that has been "reported" to be administrated
5. Medication history lists  - what the patient or a provider says a patient is taking 
6. Prescribing medication lists

### Some History About Medication Lists
One of the challenges when creating a medication list is how to represent that a patient is taking / not-taking a medication, and if the patient is taking the medication as prescribed.  Using MedicationStatement exclusively in R4 doesn’t work since we lost the ability to use MedicationStatement.status to convey whether a not-taken medication is active or not.  Some not-taken medications are associated with active orders/prescriptions while other not-taken statements are associated with old orders/prescriptions that have since been completed or stopped. 

Using MedicationRequest exclusively in R4 doesn’t work since it is still not scoped to handle patient statements about their over-the-counter (OTC) medication usage that 
don’t have an underlying prescription or request.

Using both MedicationStatement and MedicationRequest introduces patient safety risk if an application made a false assumption that all active medications were returned from a single resource.

Furthermore, the boundaries between MedicationStatement and a reported MedicationRequest present a challenge for systems that don’t make that fine distinction.  For example, the following use cases are often handled in the same way:

* Patient conveys to provider A that another provider B prescribed a given medication (this is debatable whether it is a MedicationStatement or a recorded MedicationRequest)
* Patient conveys they took an OTC medication (this is a MedicationStatement – since the patient isn’t requesting a new prescription)
* The system programmatically learns of an existing medication and makes a non-authoritative copy (this is a recorded MedicationRequest)

Most systems CAN differentiate between:

* What the patient said about their medication usage (taken vs not taken)
* Whether the provider wants to keep the recorded MedicationRequest or MedicationStatement on the active medication list

In summary, we have a bit of a catch 22 where:

* We can’t use MedicationStatement exclusively (when status = not-taken), nor can we use MedicationStatement to convey status of what was ordered (when usage differs from what was ordered).
* We can’t use MedicationRequest exclusively (when scope excludes patient statements about OTC medications)
* Systems often don’t differentiate between reported MedicationRequests vs MedicationStatements, so the boundaries are challenging to honor.

Lastly as a result of the discussions, Pharmacy has created a new attribute on MedicationUsage for R5:

* takenAsOrdered   This attribute has a cardinality of 0..1 with a boolean datatype and is defined:  Indicates if the medication is being consumed or administered as prescribed. 

With this change, you can now represent using MedicationUsage in R5 via status and/or the new boolean attribute the following information: 

| Attribute | Datatype | Value | Display | Definition |
| --- | --- | --- | --- | --- |
| status | code | active | Active | The medication is still being taken.|
| | | completed | Completed | The medication is no longer being taken.|
| | | entered-in-error | Entered in Error | Some of the actions that are implied by the medication usage may have occurred. For example, the patient may have taken some of the medication. Clinical decision support systems should take this status into account.|
| | | intended | Intended | The medication may be taken at some time in the future.|
| | | stopped | Stopped | Actions implied by the usage have been permanently halted, before all of them occurred. This should not be used if the statement was entered in error.|
| | | on-hold | On Hold | Actions implied by the usage have been temporarily halted, but are expected to continue later. May also be called 'suspended'.|
| | | unknown | Unknown | The state of the medication use is not currently known.|
| | | not-taken | Not Taken | The medication was not consumed by the patient|
|takenAsOrdered | boolean | | | Indicates if the medication is being consumed or administered as prescribed.|

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
* Context - the requirements of a use case relative to the selection of records (e.g., "active", "complete"), the record attributes to include (e.g., quantity, date/time of the recorded event) or additional information to be included (e.g., allergy list).
* Medication List - a list of medications for a patient, to satisfy a context includes, medication orders/dispenses/administration records with the product name and may include a number of attributes of each record such as date, timing, directions, quantity, dose amount, refills remaining, location of dispense, site of administration, etc.
* Medication Profile - the information in a Medication List and adds additional, context specific, information.  Examples of additional information include allergy/ADE/ADR information, recent encounter information, laboratory results, medication management program information, medication reconciliation information.

For the most part, this guidance document uses the term Medication List.  However, many contexts include other related information and are properly Medication Profiles.  The point is that a collection of medication order/dispense/administration records is being created whether it is just a Medication List or a Medication Profile with additional information.

There may also be jurisdictional implications regarding List versus Profile.  The document does not address these jurisdictional considerations.
