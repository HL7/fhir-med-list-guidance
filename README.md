# HL7 Pharmacy Medication List Guidance
An informative implementation guide for those designing FHIR medication list solutions

# Building the IGuide

## Compiling with SUSHI

This IGuide is developed in [FHIR Shorthand (FSH)](http://build.fhir.org/ig/HL7/fhir-shorthand/), a domain-specific language (DSL) for defining the content of FHIR Implementation Guides (IG).

After you check out the guide source from Github, install SUSHI (the FSH compiler), [as instructed here](http://build.fhir.org/ig/HL7/fhir-shorthand/sushi.html). 

To compile the guide, open a command window and navigate to the directory where the guide has been checked out. Issue the following command:

`$ sushi .

## Running the IG Publisher

Next, change directories to ./build. 

Now run:

Windows:   `$ _genonce`

Mac:   `$ ./_genonce.sh`

This will run the HL7 IG Publisher, which will take several minutes to complete. After the publisher is finished, open the file _/build/output/index.html_ to see the resulting IG.

To get a clean build, you may delete the _./build/input/resources_ and/or the _./build/output_ directories. However, DO NOT delete the entire _./build_ directory!

