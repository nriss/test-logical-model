### Introduction

Cet IG est un **bac à sable technique** destiné à tester l'héritage de modèles logiques FHIR.

L'objectif est de vérifier qu'il est possible d'étendre un modèle logique existant (ici [`EHDSPatient`](https://www.xt-ehr.eu/fhir/models/StructureDefinition-EHDSPatient.html) du projet Xt-EHR) en y ajoutant des champs spécifiques au contexte français.

### Ce qui est testé

| Modèle parent | Modèle enfant | Champs ajoutés |
|---|---|---|
| [`EHDSPatient`](https://www.xt-ehr.eu/fhir/models/StructureDefinition-EHDSPatient.html) (Xt-EHR) | [`ANSPatient`](StructureDefinition-ANSPatient.html) | INS-NIR, INS-NIA, lieu de naissance, nationalité, situation familiale |

### Dépendances

{% include dependency-table.xhtml %}
