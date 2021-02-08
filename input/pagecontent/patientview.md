## Patient View of Medications

### Rationale
To allow a patient to answer the question "what medications am I taking".  This list can then be provided to health care practitioners in different settings. 

**ADD IN USE CASES**

* review the list and then request a renewal
* review the list and add new medications 
* review the list and update the medications

### Description
This list of medication may be captured in an application on a patient's phone or computer.

The list may be created by the patient him or herself or it may be created by a parent for a child or a care-giver for a patient.  

Lists created by someone other than the patient may include a different level of detail that if created by the patient, but the purpose for the list is the same.

To address what medications the patient has taken in the past or plans to take in the future....SEE CONTEXT.....

### What does it contain?
These lists may come in different flavours:

* medications that have been prescribed and are taking
* over the counter medications that the patient taking
* medications that are being taken, but were prescribed to a different person

A patient view of a medication list includes:

* medications the patient is currently taking
	* and those that were prescribed by the supply should have run out
	* and those that were prescribed for another person that the patient is taking
* may not include medications that have been prescribed but are not taking

### What data elements are important?
* source
* how captured - How was the medication captured in the list?
	* patient or care giver entered
	* manually typed in
	* scanned the medication supply
	* imported from an EHR
* reason for taking
	* my physician told me to
	* I decided to take it
* medication details - name, form, etc

### What resources to use
MedicationUsage (aka MedicationStatement)
