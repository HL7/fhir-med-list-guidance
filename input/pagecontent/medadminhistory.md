## Medication Administration History

### Assumption
When collecting Medication Administration history from patients there are often a series of questions the clinician asks the patient.  These questions can vary depending on the reason for asking the questions.  The history can be obtained by talking to a patient, a family member e.g. mother for a baby, by a caregiver, or via queries into systems that record medication administration records (MAR). I am not aware of a standard name for this type of medication list.   

### Rationale
It is common when ordering some medications to understand how the patient responded to the same medication previously.  This is one of the primary reasons for reviewing medication administration history.  Another reason is to evaluate the dose used previously and make adjustments to a new order for the same medication.

The most common reason in acute care settings is to confirm that a specific dose of a medication was administered. 

### Settings
Should not matter whether the patient is in an inpatient setting or an outpatient or a community based setting

### Description
This section HAS NOT BEEN UPDATED

The list of medications to be administered, or that have been administered may be captured in an application on a patient's phone or computer.

The lists may be created by the patient him or herself or it may be created by a parent for a child or a care-giver for a patient.  

The list may be created by a clinician within an EHR Medication Administration module.  

The list may be created in a paper document that is used by a patient or caregiver or clinician. 

The level of detail of the data that is captured during medication administration may differ depending of who is creating and entering the data, but the purpose for the list remains the same. 

#### Where do the medications that are listed on the Medication Administration History come from? 
A provider view of Medication Administration history may include medications that come from: 

* Patient reported medication administration history
* Family member medication administration reported history
* Caretaker reported medication administration history
* Via access to Medication Administration Records (MAR)

In acute care settings it is common to query the MAR for medication administration history.

In settings where the patient, caretaker or family member is the source of the medication history it common to ask various questions.  The answers to the questions would use FHIR Medication Usage resource to record these types of statements.  The following lists some common questions, not all are relevant to Medication Administration History.  

* What types of questions do clinicians ask about medication history when they talk to their patients or family member or caretakers
	* What medications are you currently taking?  Note this is not bound to just those medications that are prescribed or that are "legal"; and the answer may not include some prescribed medications if the patient is not taking them.
		* A common drill down question is: I noticed you didn't mention the following prescribed medication "xyz", did you forget that medication or are you telling me you are NOT taking that medication? What is the reason you are not taking that prescribed medication? 
	* What medications have you been prescribed? This answer can very greatly in quality of response - some folks will know with great detail all of the information about their prescribed medications.  Others will have incomplete information; others will have very poor information related to their prescribed medications.  
		* A common drill down question is:  Are you currently taking this medication? 
	* Are you taking any medications that your doctor has not prescribed?  In essence this is asking about over the counter (OTC) meds, which may include supplements, herbals, etc. 
	* Are you taking any of the following drugs/medications?  This list may include depending on who is asking illegal drugs e.g heroin, cocaine, alcohol, morphine, opiods, meth, marijuana, etc. 
		* When you fill out a detailed questionnaire often there is a list of medications that you are prompted to answer yes or no regarding whether you are currently taking. These lists of drugs may vary from clinic to clinic. Another common example of this type of list is seen when you donate blood.  
	* Have you ever taking medication "xyz"?  This could be a transplant reject drug, a chemo drug, or other types of medications. 	
		*This may not be a list but it could be if the question is can you tell me when, if ever, you took the following medication?  The response may be a series of dates and time and potentially different doses for the same medication. 

When querying for Medication Administration History it would be common to look at both Medication Administration and Medication Usage records to answer the Medication Administration History question.  

A patient view of medication administration history discussion.  

* I have not seen this type of view, but here is one opinion.  If a patient wanted to understand if they had ever taken a medication, either via self administration or via a clinician or caretaker or family member administration - this would query for Medication Administration and/or Medication Usage records. 
	* The results of this type of query may return only one medication or depending on the query multiple instances of the same medication administered over some time period. 

### What data elements are important?

* Name of medication administered
* Dose
* Date/time of administration
* Form
* Source of medication administration history
	* MAR via EHR module or other system
	* Reported history via Medication Usage record(s)
		* Name of person who provided the history in the Medication Usage record

### What resources to use
* MedicationAdministration
* MedicationUsage

### What types of queries?
* Has this patient ever taken "drug xyz"?  This would search past Medication Administration records for this patient? and/or search Medication Usage records. 
* Did the patient get their "cyclosporin" today?