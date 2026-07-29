Alias: $regex-ext = http://hl7.org/fhir/StructureDefinition/regex

// ---------------------------------------------------------------------
// Profil du type string pour le matricule INS (NIR/NIA + clé de contrôle)
// ---------------------------------------------------------------------
Profile: MatriculeINS
Parent: string
Id: matricule-ins
Title: "Matricule INS"
Description: """
Profil du type `string` représentant le matricule de l'Identifiant National
de Santé (INS) : NIR ou NIA à 13 caractères complété de la clé de contrôle
à 2 chiffres (15 caractères au total) — cf. Référentiel INS ANS v2.1, §3.1.2.

La regex appliquée (`^[12][0-9]{12}[0-9]{2}$`) ne couvre que le cas
numérique standard du NIR. Elle ne couvre pas les cas particuliers
documentés par l'ANS : lieux de naissance en Corse (codes 2A/2B, non
numériques), NIA, ni les numéros d'ordre spéciaux. Aucun regex officiel
n'étant publié par l'ANS à ce jour, ce profil est fourni à titre
expérimental pour ce repo de test.
"""
* ^extension[$regex-ext].valueString = "^[12][0-9]{12}[0-9]{2}$"
