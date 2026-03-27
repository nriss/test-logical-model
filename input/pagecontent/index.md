### Introduction

Cet IG est un **bac à sable technique** destiné à tester deux capacités de modélisation logique FHIR dans un contexte d'interopérabilité européen :

1. **L'héritage de modèles logiques** : est-il possible d'étendre un modèle logique existant en y ajoutant des champs ?
2. **La traduction d'éléments hérités** : est-il possible de traduire en français les libellés des éléments issus d'un modèle parent ?

Le modèle parent utilisé est [`EHDSPatient`](https://www.xt-ehr.eu/fhir/models/StructureDefinition-EHDSPatient.html) du projet [Xt-EHR](https://www.xt-ehr.eu/), qui définit un modèle logique de patient dans le cadre de l'Espace Européen des Données de Santé (EEDS).

---

### Résultats

#### 1. Héritage de modèles logiques — ✅ Fonctionne

Il est possible de dériver un modèle logique FHIR en utilisant `Parent:` dans FSH. Le modèle enfant [`ANSPatient`](StructureDefinition-ANSPatient.html) hérite de tous les éléments d'`EHDSPatient` et y ajoute 5 champs spécifiques au contexte français.

| Modèle parent | Modèle enfant | Champs ajoutés |
|---|---|---|
| [`EHDSPatient`](https://www.xt-ehr.eu/fhir/models/StructureDefinition-EHDSPatient.html) (Xt-EHR) | [`ANSPatient`](StructureDefinition-ANSPatient.html) | INS-NIR, INS-NIA, lieu de naissance, nationalité, situation familiale |

En FSH :
```fsh
Logical: ANSPatient
Parent: http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient
```

#### 2. Traduction des éléments hérités — ✅ Fonctionne (deux approches)

Deux approches ont été testées sur des champs différents afin de comparer leur rendu dans la [page de la StructureDefinition](StructureDefinition-ANSPatient.html).

**Approche 1 — Surcharge directe** (champs : `name`, `dateOfBirth`, `administrativeGender`)

Remplace le texte anglais par du texte français directement dans le modèle dérivé via `^short` et `^definition`. Le libellé français apparaît dans la page HTML générée.

```fsh
* name ^short = "Nom du patient"
* name ^definition = "Nom associé au patient..."
```

**Approche 2 — Extension `translation` parallèle** (champs : `identifier`, `address`, `telecom`)

Conserve le libellé anglais d'origine et ajoute un libellé français via l'extension FHIR standard `http://hl7.org/fhir/StructureDefinition/translation`. Les deux langues coexistent dans la StructureDefinition. Le libellé français n'est **pas** visible dans la page HTML générée par le publisher — il est uniquement présent dans le JSON brut.

```fsh
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Identifiant du patient"
```

**Sans traduction** (champ : `deceased[x]`)

Le libellé anglais d'origine est conservé tel quel, pour comparaison.

---

### Note sur les dépendances

Le package `xtehr.eu.ehds.models#0.3.0` n'est pas publié sur le registre public FHIR (`packages.fhir.org`). Il est inclus dans ce dépôt sous `non-registry-packages/` et pré-installé dans le cache FHIR avant l'étape SUSHI dans le workflow CI.

### Dépendances

{% include dependency-table.xhtml %}
