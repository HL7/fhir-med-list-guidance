## Medication Administration

### Assumptions
Medication administrations can be done by a clinician, by a patient via self-administration, by a family member e.g. mother for a baby, by a caregiver, or via the use of devices e.g. IV pumps, Insulin pumps, patient controlled analgesic (PCA) pumps.  In order to administer a medication there is often some kind of list of medications that includes date and time the medication is to be administered.  A common name for this type of list of medications to be administered and the corresponding record of medication administrations is Medication Administration Record (MAR).  

### Rationale
To inform the person who will administer the medication(s) the date/time, and medication specific information e.g. dose, route, method, special instructions for each medication a person is expected ( should take, will take, same discussion here) to take.

To provide a place to capture the data about the actual administration e.g. date/time or time interval of administration, dose, route, method, etc.

This type of information may be presented to the user who is administering the medication in an EHR module for medication administration, in a mobile application for the patient or caregiver, or a paper forum used to record this type of information.  

### Settings
Should not matter whether the patient is in an inpatient setting or an outpatient or a community based setting

### Description
The list of medications to be administered, or that have been administered may be captured in an application on a patient's phone or computer.
The lists may be created by the patient him or herself or it may be created by a parent for a child or a care-giver for a patient.  
The list may be created by a clinician within an EHR Medication Administration module.  
The list may be created in a paper document that is used by a patient or caregiver or clinician. 
The level of detail of the data that is captured during medication administration may differ depending of who is creating and entering the data, but the purpose for the list remains the same. 

#### Where do the medications that are listed on the Medication Reconciliation come from? 
A provider view Medication Administration list may include medications that come from: 

* Prescriptions written by clinicians who have the authority to write these types of medication orders
* Over-the-counter (OTC) medications that the patient informs/adds to the list - this would include herbals and supplements
* Medications that are taken in error (this still needs to be documented) NOTE: taken in error has many flavors e.g. wrong dose, wrong route, wrong patient, etc
	* This entry would only show up on the administered list, not on the scheduled list of administrations

A patient view of a medication list includes the same as above with the following caveat:

* may not include some medications - this is seen when the patient is stating by leaving a medication off their list, that they are not taking a specific medication, irrespective of whether it was prescribed

### What data elements are important?

### What resources to use
* MedicationAdministration

### What types of queries?
* What medications should be administered "today"? or this "shift"?
* Has this patient ever taken "drug xyz"?  This would search past medication administrations for this patient? 
* Did the patient get their "cyclosporin" today?

Here is a question that IS NOT answered in this section:  Asking the patient have you ever taken "drug XYZ"?  This would be Medication History and would use Medication Usage. 
