## Dispensing Lists

### Assumptions
The inclusion of a medication in the list does not imply that the patient has actually taken the medication, just that it has been supplied to him or her.  

### Rationale
Depending on the source of the list, may include only those medications from a specific pharmacy or from an institution (hospital) or from an organization (inpatient, outpatient) or within a jurisdiction (e.g. where there is a centralized system that captures dispenses from all community pharmacies)

1. Use Case: Clinical review prior to dispensing
	* To provide a list of medications that have been dispensed to a patient.  The list may be confined to a specific date range.
	* The list of dispensed medications is often required to be reviewed by the pharmacists prior to dispensing medication, whether a new medication or a refill of an existing medication, to the patient.  In many jurisdictions, the review of the patient's dispensed medication is required by legislation and in some cases, the functionality to retrieve a lists of the medication dispensed to a patient is built into the system so that a dispense can not take place until the list is displayed to the user.
	* The list would include any medication that has been dispensed and may include over the counter medications that the patient has purchased which have been recorded on the patient's record.
2. Use Case: Patient Access
	* There is a use case for patient access to the list of dispensed medication - to provide a patient with the list of medications that has been dispensed to him or her during a period.  Typically, this is a calendar year and is used for the purposes of submitting for reimbursement for insurance purposes.  For this use case, it would be necessary to include the ??? resource to bring in cost information.
3. Use Case:  Coroner
4. Use Case:  Drug recalls

### Settings
Applicable to inpatient, outpatient and community settings.

May be applicable to patients or care-givers

### Description
The list of medications that have been dispensed to a patient.

May be created by the dispensing system, EHR, or jurisdictional centralized Drug Information System (DIS) from dispense records

May be created by a centralized system using dispense claims data as a proxy for dispenses.

#### Where do the medications that are listed on the Medication Dispense list come from?
A provider view Medication Dispense list may include medications that come from: 

* Prescriptions written by clinicians who have the authority to write these types of medication orders - may include those medications that require a prescription to be dispensed as well as over the counter medications (for example, ASA 81mg) that have been prescribed by a clinician
	* Typically over the counter medications are recorded as dispenses when prescribed to allow the patient to submit the receipt for insurance purposes.
* Over-the-counter (OTC) medications that the dispenser adds to the list - often are medications that the patient takes regularly or seasonally (for example, antihistamines) or are medications for which there is a regulatory requirement to record (for example, in Canada, some jurisdictions require the recording of Exempted Codeine products (e.g. Acetaminophen with Codeine 8mg or ASA with Codeine 8mg) 

Would not contain records of dispenses that have been recorded in error.

A patient view of a medication list includes:

* Identical list as above plus cost information

### What resources to use
* MedicationDispense
* Optionally, MedicationUsage

### Types of queries
* Give me all medications dispensed to patient x
* Give me all medications dispensed to patient x within this time period
* Show me all medications dispensed to me
* Show me all medications dispensed to me within this time period
* Give me the dispenses for patient x for drug y (or for list of drugs - may be generic formulations or brands)
* Give me the dispenses for patient x for the drug classification z (or combination of classifications)
