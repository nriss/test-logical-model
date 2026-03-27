# Accueil - Test - Héritage de Modèles Logiques v0.1.0

* [**Table of Contents**](toc.md)
* **Accueil**

## Accueil

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/test-logical-model/ImplementationGuide/ans.fhir.fr.test-logical-model | *Version*:0.1.0 |
| Draft as of 2026-03-27 | *Computable Name*:TestLogicalModel |

### Introduction

Cet IG est un **bac à sable technique** destiné à tester deux capacités de modélisation logique FHIR dans un contexte d'interopérabilité européen :

1. **L'héritage de modèles logiques**: est-il possible d'étendre un modèle logique existant en y ajoutant des champs ?
1. **La traduction d'éléments hérités**: est-il possible de traduire en français les libellés des éléments issus d'un modèle parent ?

Le modèle parent utilisé est [`EHDSPatient`](https://www.xt-ehr.eu/fhir/models/StructureDefinition-EHDSPatient.html) du projet [Xt-EHR](https://www.xt-ehr.eu/), qui définit un modèle logique de patient dans le cadre de l'Espace Européen des Données de Santé (EEDS).

-------

### Résultats

#### 1. Héritage de modèles logiques — ✅ Fonctionne

Il est possible de dériver un modèle logique FHIR en utilisant `Parent:` dans FSH. Le modèle enfant [`ANSPatient`](StructureDefinition-ANSPatient.md) hérite de tous les éléments d'`EHDSPatient` et y ajoute 5 champs spécifiques au contexte français.

| | | |
| :--- | :--- | :--- |
| [`EHDSPatient`](https://www.xt-ehr.eu/fhir/models/StructureDefinition-EHDSPatient.html)(Xt-EHR) | [`ANSPatient`](StructureDefinition-ANSPatient.md) | INS-NIR, INS-NIA, lieu de naissance, nationalité, situation familiale |

En FSH :

```
Logical: ANSPatient
Parent: http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient

```

#### 2. Traduction des éléments hérités — ✅ Fonctionne (deux approches)

Deux approches ont été testées sur des champs différents afin de comparer leur rendu dans la [page de la StructureDefinition](StructureDefinition-ANSPatient.md).

**Approche 1 — Surcharge directe** (champs : `name`, `dateOfBirth`, `administrativeGender`)

Remplace le texte anglais par du texte français directement dans le modèle dérivé via `^short` et `^definition`. Le libellé français apparaît dans la page HTML générée.

```
* name ^short = "Nom du patient"
* name ^definition = "Nom associé au patient..."

```

**Approche 2 — Extension `translation` parallèle** (champs : `identifier`, `address`, `telecom`)

Conserve le libellé anglais d'origine et ajoute un libellé français via l'extension FHIR standard `http://hl7.org/fhir/StructureDefinition/translation`. Les deux langues coexistent dans la StructureDefinition. Le libellé français n'est **pas** visible dans la page HTML générée par le publisher — il est uniquement présent dans le JSON brut.

```
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Identifiant du patient"

```

**Sans traduction** (champ : `deceased[x]`)

Le libellé anglais d'origine est conservé tel quel, pour comparaison.

-------

### Note sur les dépendances

Le package `xtehr.eu.ehds.models#0.3.0` n'est pas publié sur le registre public FHIR (`packages.fhir.org`). Il est inclus dans ce dépôt sous `non-registry-packages/` et pré-installé dans le cache FHIR avant l'étape SUSHI dans le workflow CI.

### Dépendances






## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "ans.fhir.fr.test-logical-model",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/ImplementationGuide/ans.fhir.fr.test-logical-model",
  "version" : "0.1.0",
  "name" : "TestLogicalModel",
  "title" : "Test - Héritage de Modèles Logiques",
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
  "description" : "IG de test pour expérimenter l'héritage de modèles logiques FHIR (extension de EHDSPatient)",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France"
    }]
  }],
  "packageId" : "ans.fhir.fr.test-logical-model",
  "license" : "CC0-1.0",
  "fhirVersion" : ["5.0.0"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r5",
    "version" : "7.1.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r5",
    "version" : "5.2.0"
  },
  {
    "id" : "xtehr_eu_ehds_models",
    "uri" : "http://www.xt-ehr.eu/fhir/models/ImplementationGuide/xtehr.eu.ehds.models",
    "packageId" : "xtehr.eu.ehds.models",
    "version" : "0.3.0"
  }],
  "definition" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r5#1.1.2"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/competence-code-system"
      },
      "name" : "Compétences CodeSystem",
      "description" : "Compétences des professionnels de santé.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/EyeColor"
      },
      "name" : "EyeColor",
      "description" : "Eye color extension",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/EyeColorVS"
      },
      "name" : "EyeColor Value Set",
      "description" : "Different eye colors.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/frpatient-exemple"
      },
      "name" : "frpatient-exemple",
      "description" : "Exemple d'un patient français",
      "isExample" : true,
      "profile" : ["https://interop.esante.gouv.fr/ig/fhir/test-logical-model/StructureDefinition/fr-patient"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/MeltingPotVS"
      },
      "name" : "Melting Pot Value Set",
      "description" : "Melting Pot Value Set.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/ModifiedAdministrativeGender"
      },
      "name" : "ModifiedAdministrativeGender",
      "description" : "AdministrativeGender without unknown code",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ANSPatient"
      },
      "name" : "Modèle Patient ANS (extension EHDSPatient)",
      "description" : "Extension du modèle EHDSPatient pour le contexte français.\nTraduit en français les libellés des éléments hérités (deux approches testées) et ajoute des champs spécifiques au système de santé français.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/fr-patient"
      },
      "name" : "Patient français",
      "description" : "Description du patient français",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/TypeCarteVS"
      },
      "name" : "Type Carte Value Set",
      "description" : "Type Carte Value Set.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/type-carte-code-system"
      },
      "name" : "Type de carte",
      "description" : "Type de carte professionnelle et personnelle.",
      "isExample" : false
    }],
    "page" : {
      "sourceUrl" : "toc.html",
      "name" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "sourceUrl" : "index.html",
        "name" : "index.html",
        "title" : "Accueil",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "change-log.html",
        "name" : "change-log.html",
        "title" : "Historique des versions",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "copyrightyear"
      },
      "value" : "2025+"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "releaselabel"
      },
      "value" : "ci-build"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "shownav"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "i18n-default-lang"
      },
      "value" : "fr-FR"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "logging"
      },
      "value" : "progress"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "autoload-resources"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/capabilities"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/examples"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/extensions"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/models"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/operations"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/profiles"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/resources"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/vocabulary"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/maps"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/testing"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "input/history"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-resource"
      },
      "value" : "fsh-generated/resources"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "template/config"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-pages"
      },
      "value" : "input/images"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-liquid"
      },
      "value" : "template/liquid"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-liquid"
      },
      "value" : "input/liquid"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-qa"
      },
      "value" : "temp/qa"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-temp"
      },
      "value" : "temp/pages"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-output"
      },
      "value" : "output"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/guide-parameter-code",
        "code" : "path-tx-cache"
      },
      "value" : "input-cache/txcache"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-suppressed-warnings"
      },
      "value" : "input/ignoreWarnings.txt"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "path-history"
      },
      "value" : "https://interop.esante.gouv.fr/ig/fhir/test-logical-model/history.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "template-html"
      },
      "value" : "template-page.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "template-md"
      },
      "value" : "template-page-md.html"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-contact"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-context"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-copyright"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-jurisdiction"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-license"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-publisher"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-version"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "apply-wg"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "active-tables"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "fmm-definition"
      },
      "value" : "http://hl7.org/fhir/versions.html#maturity"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "propagate-status"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "excludelogbinaryformat"
      },
      "value" : "true"
    },
    {
      "code" : {
        "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
        "code" : "tabbed-snapshots"
      },
      "value" : "true"
    }]
  }
}

```
