# Concernant votre adresse e-mail GitHub

Vous avez posé une excellente question.

Il faut distinguer trois notions.

A. L'adresse du compte GitHub

C'est celle utilisée pour vous connecter sur le site GitHub.

Exemple :

ancien@gmail.com

ou

nouveau@gmail.com

Elle est gérée sur GitHub, pas dans Git.

B. L'adresse utilisée dans les commits Git

Vérifiez-la avec :

git config --global user.email

Vous pouvez utiliser une adresse différente de celle de connexion GitHub.

Par exemple :

prenom.nom@gmail.com

ou

prenom.nom@proton.me

GitHub associera les commits à votre compte si cette adresse est ajoutée et vérifiée dans votre profil GitHub.

C. L'adresse utilisée par GitHub CLI (gh)

Elle dépend du compte auquel vous êtes connecté.

Si vous souhaitez changer l'adresse principale de votre compte GitHub

Cela se fait sur le site GitHub :

Connectez-vous à votre compte.
Cliquez sur votre avatar.
Settings.
Emails.
Ajoutez votre nouvelle adresse.
Vérifiez-la via le courriel reçu.
Définissez-la comme Primary.
Vous pouvez ensuite supprimer l'ancienne si vous le souhaitez.

Ensuite, mettez Git à jour :

git config --global user.email "nouvelle-adresse@example.com"

Vérifiez :

git config --global --list



| Usage                  | Adresse            |
| ---------------------- | ------------------ |
| Connexion GitHub       | adresse principale |
| Commits personnels     | adresse A          |
| Commits professionnels | adresse B          |
| Notifications          | adresse principale |

