# Accueil - Test - Héritage de Modèles Logiques v0.1.0

## Accueil

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





