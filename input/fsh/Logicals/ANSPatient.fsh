Logical: ANSPatient
Parent: http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient
Id: ANSPatient
Title: "Modèle Patient ANS (extension EHDSPatient)"
Description: """
Extension du modèle EHDSPatient pour le contexte français.
Traduit en français les libellés des éléments hérités (deux approches testées) et ajoute des champs spécifiques au système de santé français.
"""
Characteristics: #can-be-target

// ---------------------------------------------------------------
// APPROCHE 1 : surcharge directe de ^short et ^definition
// Remplace le texte anglais par du texte français dans ce modèle dérivé.
// Appliquée sur : name, dateOfBirth, administrativeGender
// ---------------------------------------------------------------
* name ^short = "Nom du patient"
* name ^definition = "Nom associé au patient. Peut inclure le(s) prénom(s), le nom de famille, le préfixe, etc."

* dateOfBirth ^short = "Date de naissance"
* dateOfBirth ^definition = "Date de naissance du patient."

* administrativeGender ^short = "Genre administratif"
* administrativeGender ^definition = "Genre administratif du patient. Note : le genre physiologique doit être renseigné ailleurs si différent."

// ---------------------------------------------------------------
// APPROCHE 2 : extension translation parallèle
// Conserve le libellé anglais d'origine ET ajoute un libellé fr-FR.
// Visible uniquement dans le JSON de la StructureDefinition.
// Appliquée sur : identifier, address, telecom
// ---------------------------------------------------------------
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Identifiant du patient"
* identifier ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* identifier ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Identifiant unique du patient dans un périmètre défini (par ex. identifiant national de santé, ou identifiant temporaire du DPI)."

* address ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* address ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Adresse(s)"
* address ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* address ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Adresses postale et personnelle/professionnelle du patient."

* telecom ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* telecom ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Coordonnées de contact"
* telecom ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* telecom ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Informations de contact du patient (téléphone, email, etc.)."

// ---------------------------------------------------------------
// SANS TRADUCTION (pour comparaison) : deceased[x]
// Libellé anglais d'origine conservé tel quel.
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// Champs ajoutés au modèle EHDSPatient
// ---------------------------------------------------------------
* insFichier 0..1 Identifier "INS-NIR (Identifiant National de Santé - Numéro au Fichier)" """
    Identifiant National de Santé basé sur le numéro INSEE de naissance (NIR).
    Utilisé comme identifiant de référence dans le système de santé français.
    """
* insNia 0..1 Identifier "INS-NIA (Identifiant National de Santé - Numéro d'Identification d'Attente)" """
    Identifiant de santé provisoire attribué lorsque le NIR de naissance n'est pas disponible.
    """
* lieuDeNaissance 0..1 CodeableConcept "Lieu de naissance" """
    Commune ou pays de naissance du patient, codé selon le référentiel COG (Code Officiel Géographique) de l'INSEE.
    """
* nationalite 0..1 CodeableConcept "Nationalité" """
    Nationalité du patient.
    """
* situationFamiliale 0..1 CodeableConcept "Situation familiale" """
    Situation familiale du patient (célibataire, marié, pacsé, divorcé, veuf...).
    """
