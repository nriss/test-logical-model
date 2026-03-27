Logical: ANSPatient
Parent: http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient
Id: ANSPatient
Title: "Modèle Patient ANS (extension EHDSPatient)"
Description: """
Extension du modèle EHDSPatient pour le contexte français.
Traduit en français les libellés des éléments hérités et ajoute des champs spécifiques au système de santé français.
"""
Characteristics: #can-be-target

// ---------------------------------------------------------------
// APPROCHE 1 : surcharge directe de ^short et ^definition
// Remplace le texte anglais par du texte français dans ce modèle dérivé
// ---------------------------------------------------------------
* identifier ^short = "Identifiant du patient"
* identifier ^definition = "Identifiant unique du patient dans un périmètre défini (par ex. identifiant national de santé, ou identifiant temporaire du DPI)."

* name ^short = "Nom du patient"
* name ^definition = "Nom associé au patient. Peut inclure le(s) prénom(s), le nom de famille, le préfixe, etc."

* dateOfBirth ^short = "Date de naissance"
* dateOfBirth ^definition = "Date de naissance du patient."

* deceased[x] ^short = "Patient décédé / Date de décès"
* deceased[x] ^definition = "Indique si le patient est décédé ou renseigne la date de décès."

* administrativeGender ^short = "Genre administratif"
* administrativeGender ^definition = "Genre administratif du patient. Note : le genre physiologique doit être renseigné ailleurs si différent."

* address ^short = "Adresse(s)"
* address ^definition = "Adresses postale et personnelle/professionnelle du patient."

* telecom ^short = "Coordonnées de contact"
* telecom ^definition = "Informations de contact du patient (téléphone, email, etc.)."

// ---------------------------------------------------------------
// APPROCHE 2 : ajout d'une traduction parallèle via l'extension FHIR
// Conserve le libellé anglais ET ajoute le libellé français
// (l'extension s'applique sur l'élément string cible, ici ^short)
// ---------------------------------------------------------------
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][+].extension[lang].valueCode = #fr-FR
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][=].extension[content].valueString = "Identifiant du patient"

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
