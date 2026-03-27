# Modèle Patient ANS (extension EHDSPatient) - Test - Héritage de Modèles Logiques v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Modèle Patient ANS (extension EHDSPatient)**

## Logical Model: Modèle Patient ANS (extension EHDSPatient) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/test-logical-model/StructureDefinition/ANSPatient | *Version*:0.1.0 |
| Draft as of 2026-03-27 | *Computable Name*:ANSPatient |

 
Extension du modèle EHDSPatient pour le contexte français. Traduit en français les libellés des éléments hérités (deux approches testées) et ajoute des champs spécifiques au système de santé français. 

**Utilisations:**

* Ce Modèle logique n'est utilisé par aucun autre profil dans ce guide d'implémentation

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.test-logical-model|current/StructureDefinition/ANSPatient)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ANSPatient.csv), [Excel](StructureDefinition-ANSPatient.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ANSPatient",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/StructureDefinition/ANSPatient",
  "version" : "0.1.0",
  "name" : "ANSPatient",
  "title" : "Modèle Patient ANS (extension EHDSPatient)",
  "status" : "draft",
  "date" : "2026-03-27T15:45:43+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Extension du modèle EHDSPatient pour le contexte français.\nTraduit en français les libellés des éléments hérités (deux approches testées) et ajoute des champs spécifiques au système de santé français.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/StructureDefinition/ANSPatient",
  "baseDefinition" : "http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ANSPatient",
      "path" : "ANSPatient",
      "short" : "Modèle Patient ANS (extension EHDSPatient)",
      "definition" : "Extension du modèle EHDSPatient pour le contexte français.\nTraduit en français les libellés des éléments hérités (deux approches testées) et ajoute des champs spécifiques au système de santé français."
    },
    {
      "id" : "ANSPatient.identifier",
      "path" : "ANSPatient.identifier",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "fr-FR"
          },
          {
            "url" : "content",
            "valueString" : "Identifiant du patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "fr-FR"
          },
          {
            "url" : "content",
            "valueString" : "Identifiant unique du patient dans un périmètre défini (par ex. identifiant national de santé, ou identifiant temporaire du DPI)."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "ANSPatient.name",
      "path" : "ANSPatient.name",
      "short" : "Nom du patient",
      "definition" : "Nom associé au patient. Peut inclure le(s) prénom(s), le nom de famille, le préfixe, etc."
    },
    {
      "id" : "ANSPatient.dateOfBirth",
      "path" : "ANSPatient.dateOfBirth",
      "short" : "Date de naissance",
      "definition" : "Date de naissance du patient."
    },
    {
      "id" : "ANSPatient.administrativeGender",
      "path" : "ANSPatient.administrativeGender",
      "short" : "Genre administratif",
      "definition" : "Genre administratif du patient. Note : le genre physiologique doit être renseigné ailleurs si différent."
    },
    {
      "id" : "ANSPatient.address",
      "path" : "ANSPatient.address",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "fr-FR"
          },
          {
            "url" : "content",
            "valueString" : "Adresse(s)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "fr-FR"
          },
          {
            "url" : "content",
            "valueString" : "Adresses postale et personnelle/professionnelle du patient."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "ANSPatient.telecom",
      "path" : "ANSPatient.telecom",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "fr-FR"
          },
          {
            "url" : "content",
            "valueString" : "Coordonnées de contact"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "fr-FR"
          },
          {
            "url" : "content",
            "valueString" : "Informations de contact du patient (téléphone, email, etc.)."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "ANSPatient.insFichier",
      "path" : "ANSPatient.insFichier",
      "short" : "INS-NIR (Identifiant National de Santé - Numéro au Fichier)",
      "definition" : "Identifiant National de Santé basé sur le numéro INSEE de naissance (NIR).\nUtilisé comme identifiant de référence dans le système de santé français.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "ANSPatient.insNia",
      "path" : "ANSPatient.insNia",
      "short" : "INS-NIA (Identifiant National de Santé - Numéro d'Identification d'Attente)",
      "definition" : "Identifiant de santé provisoire attribué lorsque le NIR de naissance n'est pas disponible.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "ANSPatient.lieuDeNaissance",
      "path" : "ANSPatient.lieuDeNaissance",
      "short" : "Lieu de naissance",
      "definition" : "Commune ou pays de naissance du patient, codé selon le référentiel COG (Code Officiel Géographique) de l'INSEE.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "ANSPatient.nationalite",
      "path" : "ANSPatient.nationalite",
      "short" : "Nationalité",
      "definition" : "Nationalité du patient.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "ANSPatient.situationFamiliale",
      "path" : "ANSPatient.situationFamiliale",
      "short" : "Situation familiale",
      "definition" : "Situation familiale du patient (célibataire, marié, pacsé, divorcé, veuf...).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
