## Medication Reconciliation

### Rationale

### Settings
A component of Medication Management and other therapeutic follow-up protocols.  

Can be performed at any transition of care.  Examples include hospital admission/discharge and transfers/admission to Long-Term/Post-Acute Care (LTPAC). 

Often a component of an ambulatory patient encounter.

Beginning and ongoing for medication packaging - see blister pack example

### Description
The purpose of Medication Reconciliation is to develop a list of everything the patient is taking or intending to take.  This includes prescribed, recommended and patient-selected medications.  Also inclusive of prescription, non-prescription, and, if the patient offers, recreational and illicit products.

A clinician reviews a set of MedicationRequest, MedicationDispense, and MedicationUsage resources with the patient or a caregiver and creates a new list that indicates all of the medications that have been confirmed to be used by the patient.  Normally, the initial list is created for the clinician and then changes to the list are updated in the patient's medical record.

reference: Assuring Medication Accuracy at Transitions in Care https://www.who.int/patientsafety/implementation/solutions/high5s/h5s-sop.pdf?ua=1

#### Where do the medications that are listed on the Medication Reconciliation come from? 
One listing per medication inferred from the existence of a MedicationRequest, MedicationDispense, or MedicationUsage about the medication.

Would not contain records that have been recorded in error.

Input:

* electronic records (CDA, FHIR)
* paper records
* patient interview

Process:

* System deduplication
* Clinician assessment
* Patient feedback
* defined protocol
* may be focused related to the context.  A medication reconciliation related to a home care assessment may not be as inclusive as a comprehensive medication management.

Output:

* revised set of MedicationUsage resources 
* recommendation(s) to prescriber(s) for new/changed orders
* paper/electronic report for use by the patient
* patient education on medication/products - as appropriate for the context
	* what they are used for
	* how and when to take

### What data elements are important?

####Required
* Medication - the product
* Indication  - the defined indication
	* also may be relevant - what the patient understands they are taking the medication for
* Dates - may include any/all of
	* date ordered
	* date last dispensed
	* date stopped
* Reason for discontinuation
* last administration
* Dosage - should include both
	* dose quantity
	* rate/frequency of administration

####Optional
* Prescriber
* Dispenser
* Administered by
* patient statement of how taking

### What resources to use
* MedicationRequest
* MedicationDispense
* MedicationAdministration
* MedicationUsage
