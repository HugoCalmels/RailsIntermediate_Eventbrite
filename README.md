# Evenbrite

Evenbrite est un projet plus axé sur le back-end que le front-end, qui témoigne de mon niveau fin novembre 2021.

Fonctionnalités :
- Un utilisateur peut créer un évènement, il sera alors l'organisateur de l'évènement, et sera ajouté
aux particpants de cet évènement.
- Un utilisateur peut rejoindre un évènement crée par un autre utilisateur.
- Chaque utilisateur a un profil, dans lequel est indiqué tous les élements qu'il a rejoint.
- Il est possible d'ajouter une image de l'évènement qui sera hébergée sur AWS
- L'utilisateur est redirigé avec des "alertes", de manière automatique et satisfaisante.

Disponible en ligne : https://eventbrite-plus.herokuapp.com/

Pour installer localement :
- $ bundle exec rails webpacker:install
- $ bundle install
- $ rails db:create
- $ rails db:migrate
- $ rails db:seed
- $ rails s
