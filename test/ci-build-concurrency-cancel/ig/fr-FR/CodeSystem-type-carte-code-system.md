# Type de carte - Test - Héritage de Modèles Logiques v0.1.0

## CodeSystem: Type de carte 

 
Type de carte professionnelle et personnelle. 

* [MeltingPotVS](ValueSet-MeltingPotVS.md)
* [TypeCarteVS](ValueSet-TypeCarteVS.md)

-------

 . 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "type-carte-code-system",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/CodeSystem/type-carte-code-system",
  "version" : "0.1.0",
  "name" : "TypeCarteCS",
  "title" : "Type de carte",
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
  "description" : "Type de carte professionnelle et personnelle.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "CPA",
    "display" : "Carte de Personnel Autorisé",
    "definition" : "La carte d'un personnel autorisé (CDA/CPA)"
  },
  {
    "code" : "CPE",
    "display" : "Carte de Personnel d'Etablissement",
    "definition" : "La Carte de Personnel d'Etablissement de santé (CDE/CPE)."
  },
  {
    "code" : "CPF",
    "display" : "Carte de Professionnel de Santé en Formation",
    "definition" : "La Carte de Professionnel de Santé en Formation (CPF)."
  },
  {
    "code" : "CPS",
    "display" : "Carte de Professionnel de Santé",
    "definition" : "La Carte de Professionnel de Santé (CPS)."
  }]
}

```
