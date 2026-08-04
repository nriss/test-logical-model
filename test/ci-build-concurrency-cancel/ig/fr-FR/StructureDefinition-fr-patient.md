# Patient français - Test - Héritage de Modèles Logiques v0.1.0

## : Patient français 

 
Description du patient français 

**Utilisations:**

* Exemples pour ce/t/te Profil: [Patient/frpatient-exemple](Patient-frpatient-exemple.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.test-logical-model|current/StructureDefinition/fr-patient)

### 

 . 

*   
*   
*   
*   

#### Bindings terminologiques (différentiel)

#### Bindings terminologiques

#### Contraintes

** Résumé **

Obligatoire : 3 éléments
 Must-Support : 2 éléments

**Extensions**

Cette structure fait référence à ces extensions:

* [https://interop.esante.gouv.fr/ig/fhir/test-logical-model/StructureDefinition/EyeColor](StructureDefinition-EyeColor.md)

**Slices**

Cette structure définit les [slices](http://hl7.org/fhir/R5/profiling.html#slices) suivantes:

* The element 1 is sliced based on the value of Patient.identifier

#### Bindings terminologiques (différentiel)

 **View** 

#### Bindings terminologiques

#### Contraintes

** Résumé **

Obligatoire : 3 éléments
 Must-Support : 2 éléments

**Extensions**

Cette structure fait référence à ces extensions:

* [https://interop.esante.gouv.fr/ig/fhir/test-logical-model/StructureDefinition/EyeColor](StructureDefinition-EyeColor.md)

**Slices**

Cette structure définit les [slices](http://hl7.org/fhir/R5/profiling.html#slices) suivantes:

* The element 1 is sliced based on the value of Patient.identifier

 

 ,  



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "fr-patient",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/StructureDefinition/fr-patient",
  "version" : "0.1.0",
  "name" : "FrPatient",
  "title" : "Patient français",
  "status" : "draft",
  "date" : "2026-08-04T08:14:58+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Description du patient français",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "interface",
    "uri" : "http://hl7.org/fhir/interface",
    "name" : "Interface Pattern"
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 V2 Mapping"
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient"
    },
    {
      "id" : "Patient.extension",
      "path" : "Patient.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.extension:eyecolor",
      "path" : "Patient.extension",
      "sliceName" : "eyecolor",
      "short" : "Eye color of the patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/test-logical-model/StructureDefinition/EyeColor"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "system"
        }],
        "description" : "Slice based on the identifier.system pattern",
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Patient.identifier:INS",
      "path" : "Patient.identifier",
      "sliceName" : "INS",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:INS.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "urn:oid:1.2.250.1.213.1.4.8"
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "short" : "male | female | other",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/ValueSet/ModifiedAdministrativeGender"
      }
    }]
  }
}

```
