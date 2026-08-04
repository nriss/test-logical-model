# ModifiedAdministrativeGender - Test - Héritage de Modèles Logiques v0.1.0

## ValueSet: ModifiedAdministrativeGender 

 
AdministrativeGender without unknown code 

 **References** 

* [Patient français](StructureDefinition-fr-patient.md)

### Définition logique (CLD)

 

### 

-------

 . 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ModifiedAdministrativeGender",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/ValueSet/ModifiedAdministrativeGender",
  "version" : "0.1.0",
  "name" : "ModifiedAdministrativeGender",
  "title" : "ModifiedAdministrativeGender",
  "status" : "draft",
  "date" : "2026-08-04T08:15:35+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "AdministrativeGender without unknown code",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://hl7.org/fhir/administrative-gender"
    }],
    "exclude" : [{
      "system" : "http://hl7.org/fhir/administrative-gender",
      "concept" : [{
        "code" : "unknown"
      }]
    }]
  }
}

```
