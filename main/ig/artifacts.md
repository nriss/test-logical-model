# Artifacts Summary - Test - Héritage de Modèles Logiques v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Logical Models 

These define data models that represent the domain covered by this implementation guide in more business-friendly terms than the underlying FHIR resources.

| | |
| :--- | :--- |
| [Modèle Patient ANS (extension EHDSPatient)](StructureDefinition-ANSPatient.md) | Extension du modèle EHDSPatient pour le contexte français. Traduit en français les libellés des éléments hérités et ajoute des champs spécifiques au système de santé français. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Patient français](StructureDefinition-fr-patient.md) | Description du patient français |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [EyeColor](StructureDefinition-EyeColor.md) | Eye color extension |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [EyeColor Value Set](ValueSet-EyeColorVS.md) | Different eye colors. |
| [Melting Pot Value Set](ValueSet-MeltingPotVS.md) | Melting Pot Value Set. |
| [ModifiedAdministrativeGender](ValueSet-ModifiedAdministrativeGender.md) | AdministrativeGender without unknown code |
| [Type Carte Value Set](ValueSet-TypeCarteVS.md) | Type Carte Value Set. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Compétences CodeSystem](CodeSystem-competence-code-system.md) | Compétences des professionnels de santé. |
| [Type de carte](CodeSystem-type-carte-code-system.md) | Type de carte professionnelle et personnelle. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [frpatient-exemple](Patient-frpatient-exemple.md) | Exemple d'un patient français |

