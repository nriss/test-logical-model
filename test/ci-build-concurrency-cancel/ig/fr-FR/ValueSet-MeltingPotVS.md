# Melting Pot Value Set - Test - Héritage de Modèles Logiques v0.1.0

## ValueSet: Melting Pot Value Set 

 
Melting Pot Value Set. 

 **References** 

Ce jeu de valeurs n'est pas utilisé ici ; il peut être utilisé autre part (par exemple dans les spécifications et / ou implémentations qui utilisent ce contenu)

### Définition logique (CLD)

 

### 

-------

 . 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "MeltingPotVS",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/ValueSet/MeltingPotVS",
  "version" : "0.1.0",
  "name" : "MeltingPotVS",
  "title" : "Melting Pot Value Set",
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
  "description" : "Melting Pot Value Set.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "405738005",
        "display" : "Blue color (qualifier value)"
      },
      {
        "code" : "371254008"
      }]
    },
    {
      "system" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/CodeSystem/competence-code-system",
      "concept" : [{
        "code" : "C01"
      }]
    },
    {
      "system" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/CodeSystem/type-carte-code-system"
    }]
  }
}

```
