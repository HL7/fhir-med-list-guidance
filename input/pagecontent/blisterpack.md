## Blister Packing Lists

### Assumptions
The medications in the list are the current medicines to be packed in blister packaging in the next packing run for that patient.  

Blister packets sealed units (e.g., foil packet), provided to the patient, containing medication doses which are taken at the same specified time.  There may be multiple blister packets to be taken within a day.  Each unit includes the time or event (e.g., lunch) when the contained medications are to be taken..

### Rationale
The list contains medicines to be packed along with detailed administration timings to be printed on the foils

1. Use Case: Clinical review prior to dispensing
	* This list is used periodically (usually monthly) to create a proforma prescription (collection of Medication Requests) for each patient in this cycle.
	* These Medication Requests are sent electronically to the prescriber to review and authorise
	* The prescriber may stop, modify or add to these requests before authorising
	* The authorised Medication Requests are returned electronically to the pharmacy where they used to update blister pack details.
	* The blister pack list is then used by the picker/packer to make up the blister packs or an electronic version is transferred to a packing robot.
	* Medication Dispense records are produced from the list
	* The completed blister packs are provided to the patient/caregiver.

### Settings
Applicable to Pharmacies, Aged Care Facilities, Mental Health units and community settings.

### Description
The list of medications that have been dispensed to a patient in blister packaging.

#### Where do the medications that are listed on the Medication Reconciliation come from? 
* Prescriptions written by clinicians who have the authority to write these types of medication orders - may include those medications that require a prescription to be dispensed as well as over the counter medications (for example, Paracetamol) that have been prescribed by a clinician
	* Medication administration charts within patient care facilities.
	
### What data elements are important?
* Patient Name and code
* Medicine name and code
* Medicine form
* Medicine strength
* Dose quantify
* Administration route
* Medicine administration timings

### What resources to use
* MedicationRequest
* MedicationDispense
* MedicationUsage

### Types  of queries
* Give me all medications to be dispensed to patient x
