# Projet Assembleur - Vérification des Nombres Premiers

## Description
Ce projet est un programme écrit en assembleur (NASM) qui permet de :
- Lire deux nombres entiers A et B en entrée.
- Trouver tous les nombres premiers compris entre A et B.
- Afficher ces nombres premiers.
- Calculer et afficher la somme de ces nombres premiers.

## Structure des fichiers
- `asm_io.asm` : Bibliothèque contenant des fonctions d'entrée/sortie pour afficher et lire des nombres et des chaînes de caractères.
- `asm_io.inc` : Fichier d'en-tête contenant les déclarations des macros et des fonctions utilisées.
- `premier.asm` : Fichier principal contenant l'implémentation du programme.

## Prérequis
- Assembleur NASM
- Système d'exploitation Linux (utilisation de l'interruption `int 0x80` spécifique à Linux)

## Compilation et Exécution
1. Assembler le programme avec NASM :
   ```sh
   nasm -f elf premier.asm -o premier.o
   ```
2. Assembler la bibliothèque d'entrée/sortie :
   ```sh
   nasm -f elf asm_io.asm -o asm_io.o
   ```
3. Lier les fichiers objets avec l'éditeur de liens :
   ```sh
   ld -m elf_i386 premier.o asm_io.o -o premier
   ```
4. Exécuter le programme :
   ```sh
   ./premier
   ```

## Explication du Fonctionnement
1. Le programme demande à l'utilisateur de saisir deux nombres A et B.
2. Il incrémente la valeur de A jusqu'à atteindre B.
3. Pour chaque nombre dans cet intervalle, il vérifie s'il est premier.
4. S'il est premier, il l'affiche et l'ajoute à une somme cumulative.
5. À la fin, il affiche la somme de tous les nombres premiers trouvés.

## Auteur
Racim Zenati

## Remarque
Le programme fonctionne uniquement avec des entiers positifs et n'est pas optimisé pour les grands nombres.

