Logical: ANSPatient
Parent: http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient
Id: ANSPatient
Title: "Modèle Patient ANS (extension EHDSPatient)"
Description: """
Extension du modèle EHDSPatient pour le contexte français.
Ajoute des identifiants et des informations spécifiques au système de santé français.
"""
Characteristics: #can-be-target

// Champs ajoutés au modèle EHDSPatient
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
